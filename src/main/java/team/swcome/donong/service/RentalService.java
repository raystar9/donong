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

	private String saveFolder = "C:\\Users\\?��?��?��\\Desktop\\final\\donong\\src\\main\\webapp\\resources\\rental\\upload";

	/* ?���? ???���? ?��?�� */
	public int insertFarm(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();
		String writer = "";

		// 로그?��?�� ?��?�� ?���? �??��?���?
		MemberDTO m = new MemberDTO();
		m = memberMapper.selectMemberByNum(r.getMember_num());
		writer = m.getRealname();

		// ?��?��, ?��군구, ?���?
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// �? ?���?
		title = sido + " " + sigungu + " " + ri;

		// ?��?��, ?��군구 번호
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

	/* ?���? ???�� �? ?��?�� ?��?�� */
	public void insertFile(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws ?��?���?
		
		//?��린주?�� 리턴받음
		ResponseEntity<String> img_path = new ResponseEntity<>
		(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
		
		//받�?�? 주소 String ?���? 바꿔�?
		String certificatePath = (String) img_path.getBody();

		/* 첫번�? ?��?�� */
		// ?��?�� ?��?���? ???��
		String fileName = file1.getOriginalFilename();
		f.setFileName1(fileName);

		// 바�?? ?��?��명으�? ???��
		f.setFilePath1(certificatePath);

		/* ?��번째 ?��?�� */
		if (!file2.isEmpty()) {
			//?��린주?�� 리턴받음
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//받�?�? 주소 String ?���? 바꿔�?
			certificatePath = (String) img_path.getBody();
			
			fileName = file2.getOriginalFilename();
			
			f.setFileName2(fileName);
			f.setFilePath2(certificatePath);
		}

		/* ?��번째 ?��?�� */
		if (!file3.isEmpty()) {
			//?��린주?�� 리턴받음
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//받�?�? 주소 String ?���? 바꿔�?
			certificatePath = (String) img_path.getBody();
			
			fileName = file3.getOriginalFilename();
			
			f.setFileName3(fileName);
			f.setFilePath3(certificatePath);
		}

		/* ?��번째 ?��?�� */
		if (!file4.isEmpty()) {
			//?��린주?�� 리턴받음
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//받�?�? 주소 String ?���? 바꿔�?
			certificatePath = (String) img_path.getBody();
			
			fileName = file4.getOriginalFilename();
			
			f.setFileName4(fileName);
			f.setFilePath4(certificatePath);
			
		} 
		rentalMapper.insertFile(f);
	}

	/* 로그?��?�� ?��?�� ?���?, ?��?��?�� �??��?���? */
	public MemberDTO selectNameByPhone(int num) {
		MemberDTO m = memberMapper.selectMemberByNum(num);
		System.out.println("name = " + m.getRealname());
		return m;
	};

	/* ?���? ???�� 리스?�� �??��?���? */
	public List<RentalDTO> selectRentalList() {
		List<RentalDTO> list = rentalMapper.selectRentalList();
		return list;
	};

	/* ???�� ?��미�? path �??��?���? */
	public String[] selectRepresentImg() {
		String[] filepath = rentalMapper.selectRepresentImg();
		return filepath;
	};

	/* ?���? ???�� �? ?��?��보기 �??��?���? */
	public RentalDTO selectRentalView(int board_num) {
		RentalDTO r = rentalMapper.selectRentalView(board_num);
		return r;
	};

	/* ?��?��보기?��?�� ?��진들 경로 구해?���? */
	public FileDTO selectFileNamePath(int board_num) {
		FileDTO f = rentalMapper.selectFileNamePath(board_num);
		return f;
	};

	/* ?���? ???�� �? ?��?�� */
	public void deleteRental(int board_num) {
		rentalMapper.deleteRental(board_num);
	};

	/* ?���? ???�� ?��?�� ?��?�� */
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
		
		//�? 번째 ?��미�? ?��?��
		s3Util.fileDelete(bucketName, inputDirectory+fpath[0]);
		
		//?�� 번째 ?��미�? ?��?��
		if(!fpath[1].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[1]);
		}
		
		//?�� 번째 ?��미�? ?��?��
		if(!fpath[2].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[2]);
		}
		
		//?�� 번째 ?��미�? ?��?��
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

	/* ?���? 게시�? �??�� */
	public List<RentalDTO> selectSearch(RentalDTO r) {
		List<RentalDTO> list = rentalMapper.selectSearch(r);
		String represent[] = rentalMapper.selectRepresentImg();

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPath(represent[i]);
		}

		return list;
	};

	/* ?���? �? ?��?�� */
	public void updateRental(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();

		// ?��?��, ?��군구, ?���?
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// �? ?���?
		title = sido + " " + sigungu + " " + ri;

		// ?��?��, ?��군구 번호
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", "%" + sido + "%");
		map.put("sigungu", "%" + sigungu + "%");

		RentalDTO r2 = rentalMapper.selectSidoSigunguNum(map);
		r.setSido(r2.getSido());
		r.setSigungu(r2.getSigungu());
		r.setTitle(title);

		rentalMapper.updateRental(r);
	};

	/* ?���? ?��?�� ?��?�� */
	public void updateFiles(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws ?��?���?
		
		FileDTO f2 = rentalMapper.selectFileNamePath(f.getBoard_num());
		
		
		if(!f.getFile1().isEmpty()) {	//?��?��1?�� �?경되?��?�� ?��
			//?��린주?�� 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
			
			//받�?�? 주소 String ?���? 바꿔�?
			String certificatePath = (String) img_path.getBody();

			// ?��?�� ?��?���? ???��
			String fileName = file1.getOriginalFilename();
			f.setFileName1(fileName);

			// 바�?? ?��?��명으�? ???��
			f.setFilePath1(certificatePath);
		}else {	//?��?��1?�� �?경되�? ?��?��?�� ?��
			f.setFileName1(f2.getFileName1());
			f.setFilePath1(f2.getFilePath1());
		}
		
		if(!f.getFile2().isEmpty()) {	//?��?��1?�� �?경되?��?�� ?��
			//?��린주?�� 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//받�?�? 주소 String ?���? 바꿔�?
			String certificatePath = (String) img_path.getBody();

			// ?��?�� ?��?���? ???��
			String fileName = file2.getOriginalFilename();
			f.setFileName2(fileName);

			// 바�?? ?��?��명으�? ???��
			f.setFilePath2(certificatePath);
		}else {	//?��?��1?�� �?경되�? ?��?��?�� ?��
			f.setFileName2(f2.getFileName2());
			f.setFilePath2(f2.getFilePath2());
		}
		
		if(!f.getFile3().isEmpty()) {	//?��?��1?�� �?경되?��?�� ?��
			//?��린주?�� 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//받�?�? 주소 String ?���? 바꿔�?
			String certificatePath = (String) img_path.getBody();

			// ?��?�� ?��?���? ???��
			String fileName = file3.getOriginalFilename();
			f.setFileName3(fileName);

			// 바�?? ?��?��명으�? ???��
			f.setFilePath3(certificatePath);
		}else {	//?��?��1?�� �?경되�? ?��?��?�� ?��
			f.setFileName2(f2.getFileName3());
			f.setFilePath2(f2.getFilePath3());
		}
		
		if(!f.getFile4().isEmpty()) {	//?��?��1?�� �?경되?��?�� ?��
			//?��린주?�� 리턴받음
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//받�?�? 주소 String ?���? 바꿔�?
			String certificatePath = (String) img_path.getBody();

			// ?��?�� ?��?���? ???��
			String fileName = file4.getOriginalFilename();
			f.setFileName4(fileName);

			// 바�?? ?��?��명으�? ???��
			f.setFilePath4(certificatePath);
		}else {	//?��?��1?�� �?경되�? ?��?��?�� ?��
			f.setFileName4(f2.getFileName4());
			f.setFilePath4(f2.getFilePath4());
		}
		rentalMapper.updateFiles(f);
	};
}
