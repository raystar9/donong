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

	private String saveFolder = "C:\\Users\\?´?‹¤?˜œ\\Desktop\\final\\donong\\src\\main\\webapp\\resources\\rental\\upload";

	/* ?†ì§? ???—¬ê¸? ?‚½?… */
	public int insertFarm(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();
		String writer = "";

		// ë¡œê·¸?¸?•œ ?‚¬?Œ ?´ë¦? ê°?? ¸?˜¤ê¸?
		MemberDTO m = new MemberDTO();
		m = memberMapper.selectMemberByNum(r.getMember_num());
		writer = m.getRealname();

		// ?‹œ?„, ?‹œêµ°êµ¬, ? œëª?
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// ê¸? ? œëª?
		title = sido + " " + sigungu + " " + ri;

		// ?‹œ?„, ?‹œêµ°êµ¬ ë²ˆí˜¸
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

	/* ?†ì§? ???—¬ ê¸? ?ŒŒ?¼ ?‚½?… */
	public void insertFile(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws ?´?”ëª?
		
		//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
		ResponseEntity<String> img_path = new ResponseEntity<>
		(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
		
		//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
		String certificatePath = (String) img_path.getBody();

		/* ì²«ë²ˆì§? ?ŒŒ?¼ */
		// ?›?˜ ?ŒŒ?¼ëª? ???¥
		String fileName = file1.getOriginalFilename();
		f.setFileName1(fileName);

		// ë°”ë?? ?ŒŒ?¼ëª…ìœ¼ë¡? ???¥
		f.setFilePath1(certificatePath);

		/* ?‘ë²ˆì§¸ ?ŒŒ?¼ */
		if (!file2.isEmpty()) {
			//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
			certificatePath = (String) img_path.getBody();
			
			fileName = file2.getOriginalFilename();
			
			f.setFileName2(fileName);
			f.setFilePath2(certificatePath);
		}

		/* ?„¸ë²ˆì§¸ ?ŒŒ?¼ */
		if (!file3.isEmpty()) {
			//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
			certificatePath = (String) img_path.getBody();
			
			fileName = file3.getOriginalFilename();
			
			f.setFileName3(fileName);
			f.setFilePath3(certificatePath);
		}

		/* ?„¤ë²ˆì§¸ ?ŒŒ?¼ */
		if (!file4.isEmpty()) {
			//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
			img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
			certificatePath = (String) img_path.getBody();
			
			fileName = file4.getOriginalFilename();
			
			f.setFileName4(fileName);
			f.setFilePath4(certificatePath);
			
		} 
		rentalMapper.insertFile(f);
	}

	/* ë¡œê·¸?¸?•œ ?‚¬?Œ ?´ë¦?, ?•¸?“œ?° ê°?? ¸?˜¤ê¸? */
	public MemberDTO selectNameByPhone(int num) {
		MemberDTO m = memberMapper.selectMemberByNum(num);
		System.out.println("name = " + m.getRealname());
		return m;
	};

	/* ?†ì§? ???—¬ ë¦¬ìŠ¤?Š¸ ê°?? ¸?˜¤ê¸? */
	public List<RentalDTO> selectRentalList() {
		List<RentalDTO> list = rentalMapper.selectRentalList();
		return list;
	};

	/* ???‘œ ?´ë¯¸ì? path ê°?? ¸?˜¤ê¸? */
	public String[] selectRepresentImg() {
		String[] filepath = rentalMapper.selectRepresentImg();
		return filepath;
	};

	/* ?†ì§? ???—¬ ê¸? ?ƒ?„¸ë³´ê¸° ê°?? ¸?˜¤ê¸? */
	public RentalDTO selectRentalView(int board_num) {
		RentalDTO r = rentalMapper.selectRentalView(board_num);
		return r;
	};

	/* ?ƒ?„¸ë³´ê¸°?—?„œ ?‚¬ì§„ë“¤ ê²½ë¡œ êµ¬í•´?˜¤ê¸? */
	public FileDTO selectFileNamePath(int board_num) {
		FileDTO f = rentalMapper.selectFileNamePath(board_num);
		return f;
	};

	/* ?†ì§? ???—¬ ê¸? ?‚­? œ */
	public void deleteRental(int board_num) {
		rentalMapper.deleteRental(board_num);
	};

	/* ?†ì§? ???—¬ ?ŒŒ?¼ ?‚­? œ */
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
		
		//ì²? ë²ˆì§¸ ?´ë¯¸ì? ?‚­? œ
		s3Util.fileDelete(bucketName, inputDirectory+fpath[0]);
		
		//?‘ ë²ˆì§¸ ?´ë¯¸ì? ?‚­? œ
		if(!fpath[1].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[1]);
		}
		
		//?„¸ ë²ˆì§¸ ?´ë¯¸ì? ?‚­? œ
		if(!fpath[2].isEmpty()) {
			inputDirectory = null;
			if(directory.equals("rent")) {
				inputDirectory = "rent";
			}
			s3Util.fileDelete(bucketName, inputDirectory+fpath[2]);
		}
		
		//?„¤ ë²ˆì§¸ ?´ë¯¸ì? ?‚­? œ
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

	/* ?†ì§? ê²Œì‹œê¸? ê²??ƒ‰ */
	public List<RentalDTO> selectSearch(RentalDTO r) {
		List<RentalDTO> list = rentalMapper.selectSearch(r);
		String represent[] = rentalMapper.selectRepresentImg();

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPath(represent[i]);
		}

		return list;
	};

	/* ?†ì§? ê¸? ?ˆ˜? • */
	public void updateRental(RentalDTO r) {
		String sido = "";
		String sigungu = "";
		String ri = "";
		String title = "";
		String address = r.getAddress();

		// ?‹œ?„, ?‹œêµ°êµ¬, ? œëª?
		String[] addArr = address.split("\\s");
		sido = addArr[1];
		sigungu = addArr[2];
		ri = addArr[3];

		// ê¸? ? œëª?
		title = sido + " " + sigungu + " " + ri;

		// ?‹œ?„, ?‹œêµ°êµ¬ ë²ˆí˜¸
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", "%" + sido + "%");
		map.put("sigungu", "%" + sigungu + "%");

		RentalDTO r2 = rentalMapper.selectSidoSigunguNum(map);
		r.setSido(r2.getSido());
		r.setSigungu(r2.getSigungu());
		r.setTitle(title);

		rentalMapper.updateRental(r);
	};

	/* ?†ì§? ?ŒŒ?¼ ?ˆ˜? • */
	public void updateFiles(FileDTO f) throws IllegalStateException, IOException {
		MultipartFile file1 = f.getFile1();
		MultipartFile file2 = f.getFile2();
		MultipartFile file3 = f.getFile3();
		MultipartFile file4 = f.getFile4();
		
		String uploadPath = "rent";	// aws ?´?”ëª?
		
		FileDTO f2 = rentalMapper.selectFileNamePath(f.getBoard_num());
		
		
		if(!f.getFile1().isEmpty()) {	//?ŒŒ?¼1?´ ë³?ê²½ë˜?—ˆ?„ ?•Œ
			//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file1.getOriginalFilename(), file1), HttpStatus.CREATED);
			
			//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
			String certificatePath = (String) img_path.getBody();

			// ?›?˜ ?ŒŒ?¼ëª? ???¥
			String fileName = file1.getOriginalFilename();
			f.setFileName1(fileName);

			// ë°”ë?? ?ŒŒ?¼ëª…ìœ¼ë¡? ???¥
			f.setFilePath1(certificatePath);
		}else {	//?ŒŒ?¼1?´ ë³?ê²½ë˜ì§? ?•Š?•˜?„ ?•Œ
			f.setFileName1(f2.getFileName1());
			f.setFilePath1(f2.getFilePath1());
		}
		
		if(!f.getFile2().isEmpty()) {	//?ŒŒ?¼1?´ ë³?ê²½ë˜?—ˆ?„ ?•Œ
			//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file2.getOriginalFilename(), file2), HttpStatus.CREATED);
			
			//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
			String certificatePath = (String) img_path.getBody();

			// ?›?˜ ?ŒŒ?¼ëª? ???¥
			String fileName = file2.getOriginalFilename();
			f.setFileName2(fileName);

			// ë°”ë?? ?ŒŒ?¼ëª…ìœ¼ë¡? ???¥
			f.setFilePath2(certificatePath);
		}else {	//?ŒŒ?¼1?´ ë³?ê²½ë˜ì§? ?•Š?•˜?„ ?•Œ
			f.setFileName2(f2.getFileName2());
			f.setFilePath2(f2.getFilePath2());
		}
		
		if(!f.getFile3().isEmpty()) {	//?ŒŒ?¼1?´ ë³?ê²½ë˜?—ˆ?„ ?•Œ
			//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file3.getOriginalFilename(), file3), HttpStatus.CREATED);
			
			//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
			String certificatePath = (String) img_path.getBody();

			// ?›?˜ ?ŒŒ?¼ëª? ???¥
			String fileName = file3.getOriginalFilename();
			f.setFileName3(fileName);

			// ë°”ë?? ?ŒŒ?¼ëª…ìœ¼ë¡? ???¥
			f.setFilePath3(certificatePath);
		}else {	//?ŒŒ?¼1?´ ë³?ê²½ë˜ì§? ?•Š?•˜?„ ?•Œ
			f.setFileName2(f2.getFileName3());
			f.setFilePath2(f2.getFilePath3());
		}
		
		if(!f.getFile4().isEmpty()) {	//?ŒŒ?¼1?´ ë³?ê²½ë˜?—ˆ?„ ?•Œ
			//?˜¬ë¦°ì£¼?†Œ ë¦¬í„´ë°›ìŒ
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file4.getOriginalFilename(), file4), HttpStatus.CREATED);
			
			//ë°›ì?ê±? ì£¼ì†Œ String ?œ¼ë¡? ë°”ê¿”ì¤?
			String certificatePath = (String) img_path.getBody();

			// ?›?˜ ?ŒŒ?¼ëª? ???¥
			String fileName = file4.getOriginalFilename();
			f.setFileName4(fileName);

			// ë°”ë?? ?ŒŒ?¼ëª…ìœ¼ë¡? ???¥
			f.setFilePath4(certificatePath);
		}else {	//?ŒŒ?¼1?´ ë³?ê²½ë˜ì§? ?•Š?•˜?„ ?•Œ
			f.setFileName4(f2.getFileName4());
			f.setFilePath4(f2.getFilePath4());
		}
		rentalMapper.updateFiles(f);
	};
}
