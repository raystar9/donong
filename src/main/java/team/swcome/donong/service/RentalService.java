package team.swcome.donong.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

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

	private String saveFolder = "C:\\Users\\이다혜\\Desktop\\final\\donong\\src\\main\\webapp\\resources\\rental\\upload";

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
		
		//첫 번째 이미지 삭제
		s3Util.fileDelete(bucketName, inputDirectory+fpath[0]);
		
		//두 번째 이미지 삭제
		if(!fpath[1].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[1]);
		}
		
		//세 번째 이미지 삭제
		if(!fpath[2].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[2]);
		}
		
		//네 번째 이미지 삭제
		if(!fpath[3].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[3]);
		}
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
		

		FileDTO f2 = rentalMapper.selectFileNamePath(f.getBoard_num());

		// 대표이미지
		File DelFile = new File(saveFolder + f2.getFile1());
		if (DelFile.exists()) {
			DelFile.delete();
		}

		String fileName = file1.getOriginalFilename();
		f.setFileName1(fileName);

		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;

		File path1 = new File(homedir);

		if (!(path1.exists())) {
			System.out.println("폴더 만들어요");
			path1.mkdir(); // 새로운 폴더를 생성
		}

		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");
		String fileExtension = fileName.substring(index + 1);

		String refileName = "farm" + year + month + date + random + "." + fileExtension;

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

		file1.transferTo(new File(saveFolder + fileDBName));

		// 두번째 이미지
		if (!file2.isEmpty()) {
			DelFile = new File(saveFolder + f2.getFile2());
			if (DelFile.exists()) {
				DelFile.delete();
			}
			
			fileName = file2.getOriginalFilename();
			f.setFileName2(fileName);

			r = new Random();
			random = r.nextInt(100000000);
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index + 1);
			refileName = "farm" + year + month + date + random + "." + fileExtension;
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

			file2.transferTo(new File(saveFolder + fileDBName));
		}else {
			f.setFileName2(defName);
			f.setFilePath2(defPath);
		}

		// 세번째 이미지
		if (!file3.isEmpty()) {
			DelFile = new File(saveFolder + f2.getFile3());
			if (DelFile.exists()) {
				DelFile.delete();
			}
			
			fileName = file3.getOriginalFilename();
			f.setFileName3(fileName);

			r = new Random();
			random = r.nextInt(100000000);
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index + 1);
			refileName = "farm" + year + month + date + random + "." + fileExtension;
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

			file3.transferTo(new File(saveFolder + fileDBName));
		}else {
			f.setFileName3(defName);
			f.setFilePath3(defPath);
		}

		// 네번째 이미지
		if (!file4.isEmpty()) {
			DelFile = new File(saveFolder + f2.getFile4());
			if (DelFile.exists()) {
				DelFile.delete();
			}
			
			fileName = file4.getOriginalFilename();
			f.setFileName4(fileName);

			r = new Random();
			random = r.nextInt(100000000);
			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index + 1);
			refileName = "farm" + year + month + date + random + "." + fileExtension;
			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

			file4.transferTo(new File(saveFolder + fileDBName));
		}else {
			f.setFileName4(defName);
			f.setFilePath4(defPath);
		}

		rentalMapper.updateFiles(f);
	};
}
