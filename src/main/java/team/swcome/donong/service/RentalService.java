package team.swcome.donong.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.RentalDTO;
import team.swcome.donong.mapper.MemberMapper;
import team.swcome.donong.mapper.RentalMapper;


@Service
public class RentalService {

	@Autowired
	RentalMapper rentalMapper;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	S3Service s3Service;
	S3Util s3Util = new S3Util();
	String bucketName = "donong-s3";


	/* 농지 대여글 삽입 */
	public int insertFarm(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();
		String writer = "";

		// 로그인한 사람 이름 가져오기
		MemberDTO m = new MemberDTO();
		m = memberMapper.selectMemberByNum(r.getMember_num());
		writer = m.getRealname();

		// 시도, 시군구, 제목
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// 글 제목
		title = sido + " " + sigungu + " " + ri;

		// 시도, 시군구 번호
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", "%" + sido + "%");
		map.put("sigungu", "%" + sigungu + "%");

		RentalDTO r2 = rentalMapper.selectSidoSigunguNum(map);
		r.setSido(r2.getSido());
		r.setSigungu(r2.getSigungu());
		r.setTitle(title);
		r.setWriter(writer);

		rentalMapper.insertFarm(r);
		return r.getNum();
	}

	/* 농지 대여 글 파일 삽입 */
	public void insertFile(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws 폴더명
		
		//올린주소 리턴받음
		ResponseEntity<String> img_path = new ResponseEntity<>
		(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
		
		//받은걸 주소 String 으로 바꿔줌
		String certificatePath = (String) img_path.getBody();

		/* 첫번째 파일 */
		// 원래 파일명 저장
		String fileName = file1.getOriginalFilename();
		f.setFileName1(fileName);

		// 바뀐 파일명으로 저장
		f.setFilePath1(certificatePath);

		/* 두번째 파일 */
		if (!file2.isEmpty()) {
			//올린주소 리턴받음
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//받은걸 주소 String 으로 바꿔줌
			certificatePath = (String) img_path.getBody();
			
			fileName = file2.getOriginalFilename();
			
			f.setFileName2(fileName);
			f.setFilePath2(certificatePath);
		}

		/* 세번째 파일 */
		if (!file3.isEmpty()) {
			//올린주소 리턴받음
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//받은걸 주소 String 으로 바꿔줌
			certificatePath = (String) img_path.getBody();
			
			fileName = file3.getOriginalFilename();
			
			f.setFileName3(fileName);
			f.setFilePath3(certificatePath);
		}

		/* 네번째 파일 */
		if (!file4.isEmpty()) {
			//올린주소 리턴받음
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//받은걸 주소 String 으로 바꿔줌
			certificatePath = (String) img_path.getBody();
			
			fileName = file4.getOriginalFilename();
			
			f.setFileName4(fileName);
			f.setFilePath4(certificatePath);
			
		} 
		rentalMapper.insertFile(f);
	}

	/* 로그인한 사람 이름, 핸드폰 가져오기 */
	public MemberDTO selectNameByPhone(int num) {
		MemberDTO m = memberMapper.selectMemberByNum(num);
		System.out.println("name = " + m.getRealname());
		return m;
	};

	/* 농지 대여 리스트 가져오기 */
	public List<RentalDTO> selectRentalList() {
		List<RentalDTO> list = rentalMapper.selectRentalList();
		return list;
	};

	/* 대표 이미지 path 가져오기 */
	public String[] selectRepresentImg() {
		String[] filepath = rentalMapper.selectRepresentImg();
		return filepath;
	};

	/* 농지 대여 글 상세보기 가져오기 */
	public RentalDTO selectRentalView(int board_num) {
		RentalDTO r = rentalMapper.selectRentalView(board_num);
		return r;
	};

	/* 상세보기에서 사진들 경로 구해오기 */
	public FileDTO selectFileNamePath(int board_num) {
		FileDTO f = rentalMapper.selectFileNamePath(board_num);
		return f;
	};

	/* 농지 대여 글 삭제 */
	public void deleteRental(int board_num) {
		rentalMapper.deleteRental(board_num);
	};

	/* 농지 대여 파일 삭제 */
	public ResponseEntity<String> deleteFiles(Map m) {
		int board_num = (int)m.get("board_num");
		String directory = (String)m.get("directory");
		
		FileDTO f = rentalMapper.selectFileNamePath(board_num);
		String[] fpath = new String[4];
		fpath[0] = f.getFilePath1();
		fpath[1] = f.getFilePath2();
		fpath[2] = f.getFilePath3();
		fpath[3] = f.getFilePath4();
		
		String inputDirectory = null;
		if(directory.equals("rent")) {
			inputDirectory = "rent";
		}
		
		s3Util.fileDelete(bucketName, inputDirectory+fpath[0]);
		s3Util.fileDelete(bucketName, inputDirectory+fpath[1]);
		s3Util.fileDelete(bucketName, inputDirectory+fpath[2]);
		s3Util.fileDelete(bucketName, inputDirectory+fpath[3]);
			
		rentalMapper.deleteFiles(m);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	};

	/* 농지 게시글 검색 */
	public List<RentalDTO> selectSearch(RentalDTO r) {
		List<RentalDTO> list = rentalMapper.selectSearch(r);
		String represent[] = rentalMapper.selectRepresentImg();

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPath(represent[i]);
		}

		return list;
	};

	/* 농지 글 수정 */
	public void updateRental(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();

		// 시도, 시군구, 제목
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// 글 제목
		title = sido + " " + sigungu + " " + ri;

		// 시도, 시군구 번호
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", "%" + sido + "%");
		map.put("sigungu", "%" + sigungu + "%");

		RentalDTO r2 = rentalMapper.selectSidoSigunguNum(map);
		r.setSido(r2.getSido());
		r.setSigungu(r2.getSigungu());
		r.setTitle(title);

		rentalMapper.updateRental(r);
	};

	/* 농지 파일 수정 */
	public void updateFiles(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws 폴더명
		
		FileDTO f2 = rentalMapper.selectFileNamePath(f.getBoard_num());
		
		
		if(!f.getFile1().isEmpty()) {	//파일1이 변경되었을 때
			//올린주소 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
			
			//받은걸 주소 String 으로 바꿔줌
			String certificatePath = (String) img_path.getBody();

			// 원래 파일명 저장
			String fileName = file1.getOriginalFilename();
			f.setFileName1(fileName);

			// 바뀐 파일명으로 저장
			f.setFilePath1(certificatePath);
		}else {	//파일1이 변경되지 않았을 때
			f.setFileName1(f2.getFileName1());
			f.setFilePath1(f2.getFilePath1());
		}
		
		if(!f.getFile2().isEmpty()) {	//파일1이 변경되었을 때
			//올린주소 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//받은걸 주소 String 으로 바꿔줌
			String certificatePath = (String) img_path.getBody();

			// 원래 파일명 저장
			String fileName = file2.getOriginalFilename();
			f.setFileName2(fileName);

			// 바뀐 파일명으로 저장
			f.setFilePath2(certificatePath);
		}else {	//파일1이 변경되지 않았을 때
			f.setFileName2(f2.getFileName2());
			f.setFilePath2(f2.getFilePath2());
		}
		
		if(!f.getFile3().isEmpty()) {	//파일1이 변경되었을 때
			//올린주소 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//받은걸 주소 String 으로 바꿔줌
			String certificatePath = (String) img_path.getBody();

			// 원래 파일명 저장
			String fileName = file3.getOriginalFilename();
			f.setFileName3(fileName);

			// 바뀐 파일명으로 저장
			f.setFilePath3(certificatePath);
		}else {	//파일1이 변경되지 않았을 때
			f.setFileName2(f2.getFileName3());
			f.setFilePath2(f2.getFilePath3());
		}
		
		if(!f.getFile4().isEmpty()) {	//파일1이 변경되었을 때
			//올린주소 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//받은걸 주소 String 으로 바꿔줌
			String certificatePath = (String) img_path.getBody();

			// 원래 파일명 저장
			String fileName = file4.getOriginalFilename();
			f.setFileName4(fileName);

			// 바뀐 파일명으로 저장
			f.setFilePath4(certificatePath);
		}else {	//파일1이 변경되지 않았을 때
			f.setFileName4(f2.getFileName4());
			f.setFilePath4(f2.getFilePath4());
		}
		rentalMapper.updateFiles(f);
	};
}
