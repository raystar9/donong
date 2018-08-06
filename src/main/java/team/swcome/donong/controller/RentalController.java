package team.swcome.donong.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.amazonaws.util.IOUtils;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.RentalDTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.RentalService;
import team.swcome.donong.service.S3Service;
import team.swcome.donong.service.S3Util;

@SessionAttributes("sessionBean")
@Controller
public class RentalController {

	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
	@Autowired
	RentalService RentalService;
	@Autowired
	S3Service s3Service;
	S3Util s3Util = new S3Util();
	String bucketName = "donong-s3";

	/* 농지 대여 목록 페이지로 이동 */
	@RequestMapping(value = "/rental", method = RequestMethod.GET)
	public String rentalList(Model model) {
		List<RentalDTO> list = RentalService.selectRentalList();
		String[] filepath = RentalService.selectRepresentImg();

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPath(filepath[i]);
		}

		model.addAttribute("list", list);
		return "rental/rentalList";
	}

	/* 농지 대여 글쓰기 페이지로 이동 */
	@RequestMapping(value = "/rental/write", method = RequestMethod.GET)
	public String rentalWrite(Model model, SessionBean sessionBean) {
		sessionBean.setMemberNum(9); // 임시로 정해놓음
		int member_num = sessionBean.getMemberNum();
		MemberDTO m = RentalService.selectNameByPhone(member_num);

		model.addAttribute("name", m.getRealname());
		model.addAttribute("phone", m.getPhone());

		return "rental/rentalWrite";
	}

	/* 농지 대여 글쓰기 실행 */
	@RequestMapping(value = "/rental/write_ok", method = RequestMethod.POST)
	public String rentalWrite_ok(Model model, 
								 SessionBean sessionBean, 
								 RentalDTO r, 
								 FileDTO f)
			throws IllegalStateException, IOException {
		// int member_num = sessionBean.getMemberNum(); - 로그인 연결되면 이렇게 가져올 것
		sessionBean.setMemberNum(9); // 임시로 정해놓음
		int member_num = sessionBean.getMemberNum();
		r.setMember_num(member_num);

		int board_num = RentalService.insertFarm(r); // 게시글 번호를 가져와서 지정
		f.setBoard_num(board_num);
		RentalService.insertFile(f);

		return "redirect:/rental";
	}

	/* 농지 대여 상세보기 페이지로 이동 */
	@RequestMapping(value = "/rental/view", method = RequestMethod.GET)
	public String rentalViewWithoutLogin(Model model, SessionBean sessionBean, HttpServletRequest request) {
		sessionBean.setMemberNum(9); // 임시로 정해놓음
		int member_num = sessionBean.getMemberNum();
		MemberDTO m = RentalService.selectNameByPhone(member_num);

		int board_num = Integer.parseInt(request.getParameter("num"));
		RentalDTO r = RentalService.selectRentalView(board_num);

		FileDTO f = RentalService.selectFileNamePath(board_num);

		model.addAttribute("file", f);
		model.addAttribute("member", m);
		model.addAttribute("rental", r);
		return "rental/rentalView";
	}

	/* 마커 찍을 때 Ajax */
	@RequestMapping(value = "/markerJson", method = RequestMethod.POST)
	@ResponseBody
	public Object markerJson(Model model) {
		List<RentalDTO> list = RentalService.selectRentalList();
		String[] imgs = RentalService.selectRepresentImg();

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPath(imgs[i]);
		}

		return list;
	}

	/* 농지 대여 삭제 */
	@RequestMapping(value = "/rental/delete", method = RequestMethod.GET)
	public String rentalDelete(Model model, HttpServletRequest request, String directory, SessionBean sessionBean) {
		int board_num = Integer.parseInt(request.getParameter("num"));
		
		Map m = new HashMap();
		m.put("board_num", board_num);
		m.put("directory", directory);
		
		RentalService.deleteFiles(m);
		RentalService.deleteRental(board_num);
		
		return "redirect:/rental";
	}

	/* 검색할 때 Ajax */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public Object searchJson(Model model, HttpServletRequest request) {
		int num = 0;
		int sido = 0;
		int sigungu = 0;
		int price = 0;

		if (!request.getParameter("num").equals("")) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		if (!request.getParameter("sido").equals("")) {
			sido = Integer.parseInt(request.getParameter("sido"));
		}
		if (!request.getParameter("sigungu").equals("")) {
			sigungu = Integer.parseInt(request.getParameter("sigungu"));
		}
		if (!request.getParameter("price").equals("")) {
			price = Integer.parseInt(request.getParameter("price"));
		}

		RentalDTO r = new RentalDTO();
		r.setNum(num);
		r.setSido(sido);
		r.setSigungu(sigungu);
		r.setPrice(price);

		List<RentalDTO> list = RentalService.selectSearch(r);
		return list;
	}

	/* 농지 대여 수정 페이지 이동 */
	@RequestMapping(value = "/rental/modify", method = RequestMethod.GET)
	public String rentalModify(Model model, HttpServletRequest request, SessionBean sessionBean){
		sessionBean.setMemberNum(9); // 임시로 정해놓음
		int member_num = sessionBean.getMemberNum();
		MemberDTO m = RentalService.selectNameByPhone(member_num);

		int board_num = Integer.parseInt(request.getParameter("num"));
		RentalDTO r = RentalService.selectRentalView(board_num);

		FileDTO f = RentalService.selectFileNamePath(board_num);

		model.addAttribute("file", f);
		model.addAttribute("member", m);
		model.addAttribute("rental", r);
		
		return "rental/rentalModify";
	}
	
	/* 농지 대여 수정 처리 */
	@RequestMapping(value = "/rental/modify_ok", method = RequestMethod.POST)
	public String rentalModify_ok(Model model, RentalDTO r, FileDTO f, SessionBean sessionBean)
			throws IllegalStateException, IOException {
		int board_num = r.getNum();
		r.setNum(board_num);
		f.setBoard_num(board_num);

		RentalService.updateRental(r);
		RentalService.updateFiles(f);

		return "redirect:/rental/view?num=" + board_num;
	}

	/* aws 사진 View */
	@SuppressWarnings("resource")
	@ResponseBody
	@RequestMapping("/rental/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName, String directory) throws Exception {
		logger.info(directory);
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection conn = null;
		logger.info("FILE NAME: " + fileName);

		String inputDirectory = null;
		if(directory.equals("rent")) {
			inputDirectory = "rent";
		}

		try {
			HttpHeaders headers = new HttpHeaders();
			URL url;
			try {
				url = new URL(s3Util.getFileURL(bucketName, inputDirectory + fileName));
				conn = (HttpURLConnection) url.openConnection();
				in = conn.getInputStream(); // 이미지를 불러옴
			} catch (Exception e) {
				url = new URL(s3Util.getFileURL(bucketName, "default.png"));
				conn = (HttpURLConnection) url.openConnection();
				in = conn.getInputStream();
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
}
