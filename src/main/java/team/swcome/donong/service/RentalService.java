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

		// 생성할 폴더 이름: 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;

		// 파일 객체 생성합니다.
		File path = new File(homedir);

		// 폴더가 존재하는지 확인합니다.
		if (!(path.exists())) {
			System.out.println("폴더 만들어요");
			path.mkdir(); // 새로운 폴더를 생성
		}

		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);

		/* 첫번째 파일 */
		// 원래 파일명 저장
		String fileName = file1.getOriginalFilename();
		f.setFileName1(fileName);

		// 확장자
		int index = fileName.lastIndexOf(".");
		String fileExtension = fileName.substring(index + 1);

		// 새로운 파일명을 저장
		String refileName = "farm" + year + month + date + random + "." + fileExtension;

		// 오라클 디비에 저장될 레코드 값
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

		// transferTo(FIle path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
		file1.transferTo(new File(saveFolder + fileDBName));
		// 바뀐 파일명으로 저장
		f.setFilePath1(fileDBName);

		if (!file2.isEmpty()) {
			/* 두번째 파일 */
			fileName = file2.getOriginalFilename();
			f.setFileName2(fileName);

			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index + 1);

			random = r.nextInt(100000000);
			refileName = "farm" + year + month + date + random + "." + fileExtension;

			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

			file2.transferTo(new File(saveFolder + fileDBName));
			f.setFilePath2(fileDBName);
		} else {
			f.setFileName2("default.png");
			f.setFilePath2("/default.png");
		}

		if (!file3.isEmpty()) {
			/* 세번째 파일 */
			fileName = file3.getOriginalFilename();
			f.setFileName3(fileName);

			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index + 1);

			random = r.nextInt(100000000);
			refileName = "farm" + year + month + date + random + "." + fileExtension;

			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

			file3.transferTo(new File(saveFolder + fileDBName));
			f.setFilePath3(fileDBName);
		} else {
			f.setFileName3("default.png");
			f.setFilePath3("/default.png");
		}

		if (!file4.isEmpty()) {
			/* 네번째 파일 */
			fileName = file4.getOriginalFilename();
			f.setFileName4(fileName);

			index = fileName.lastIndexOf(".");
			fileExtension = fileName.substring(index + 1);
			System.out.println("확장자4 = " + fileExtension);

			random = r.nextInt(100000000);
			refileName = "farm" + year + month + date + random + "." + fileExtension;

			fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

			file4.transferTo(new File(saveFolder + fileDBName));
			f.setFilePath4(fileDBName);
		} else {
			f.setFileName4("default.png");
			f.setFilePath4("/default.png");
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
	public void deleteFiles(int board_num) {
		FileDTO f = rentalMapper.selectFileNamePath(board_num);
		String[] fpath = new String[4];

		fpath[0] = f.getFilePath1();
		fpath[1] = f.getFilePath2();
		fpath[2] = f.getFilePath3();
		fpath[3] = f.getFilePath4();

		for (int i = 0; i < fpath.length; i++) {
			if (fpath[i] != null) {
				File file = new File(saveFolder + fpath[i]);
				file.delete();
			}
			;
		}
		;

		rentalMapper.deleteFiles(board_num);
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
		
		String defName = "default.png";
		String defPath = "/default.png";

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
