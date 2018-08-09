package team.swcome.donong.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.util.IOUtils;

import team.swcome.donong.dto.FAQDTO;
import team.swcome.donong.dto.NoticeDTO;
import team.swcome.donong.dto.QNADTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.S3Service;
import team.swcome.donong.service.S3Util;
import team.swcome.donong.service.FAQService;
import team.swcome.donong.service.NoticeService;
import team.swcome.donong.service.QNAService;

@Controller
@SessionAttributes("sessionBean")
public class CSController {
	
	private static final Logger logger = LoggerFactory.getLogger(CSController.class);
	
	@Autowired
	NoticeService noticeService;
	@Autowired
	FAQService faqService;
	@Autowired
	QNAService qnaService;
	
	@Autowired
	S3Service s3Service;
	S3Util s3Util = new S3Util();
	String bucketName = "donong-s3";
	
	@RequestMapping(value="/cs", method=RequestMethod.GET)
	public ModelAndView csHome(
			ModelAndView mv) {
		RowBounds row = new RowBounds(0, 10);
		mv.addObject("faqList", faqService.getFaqTopTenList(row));
		mv.addObject("noticeList", noticeService.getNoticeList(row));
		
		mv.setViewName("service/cs_main");
		
		return mv;
	}
	
	@RequestMapping(value="/cs/notice", method=RequestMethod.GET)
	public ModelAndView noticeList(
			ModelAndView mv, 
			@RequestParam(defaultValue="") String srcOpt,
			@RequestParam(defaultValue="") String srcTxt,
			@RequestParam(value="state", defaultValue="none") String state,
			HttpServletRequest request) throws Exception {
		int page = 1;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		RowBounds row = new RowBounds((page - 1) * 10, 10);
		
		if (srcTxt.equals("")) {
			listCount = noticeService.getListCount();
			noticeList = noticeService.getNoticeList(row);
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("srcOpt", srcOpt);
			map.put("srcTxt", "%" + srcTxt + "%");
			
			listCount = noticeService.getSrcListCount(map);
			noticeList = noticeService.getSrcList(map, row);
		}
		
		maxPage = (listCount + 10 - 1) / 10;
		startPage = ((page - 1) / 10) * 10 + 1;
		endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		if (endPage < page) {
			page = endPage;
		}
		
		mv.addObject("page", page);
		mv.addObject("srcOpt", srcOpt);
		mv.addObject("srcTxt", srcTxt);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("listCount", listCount);
		mv.addObject("noticeList", noticeList);
		
		if (state.equals("paging") || state.equals("search")) {
			System.out.println("ajax 실행!!");
			mv.setViewName("service/notice_ajax");
		} else {			
			mv.setViewName("service/notice");
		}
		
		return mv;
	}

	@RequestMapping(value = "/cs/notice/write")
	public String noticeWrite() {
		return "service/notice_write";
	}

	@RequestMapping(value="/cs/notice", method=RequestMethod.POST)
	public String noticeWrite(NoticeDTO notice) {
		noticeService.insertNotice(notice);
		
		return "redirect:/cs/notice/" + notice.getNum() + "?state=cont";
	}
	
	@RequestMapping(value="/cs/notice/{num}", method=RequestMethod.GET)
	public ModelAndView noticeCont(
			ModelAndView mv, 
			@PathVariable int num, 
			@RequestParam("state") String state,
			HttpServletResponse response) throws Exception {
		NoticeDTO noticeDTO = noticeService.getNotice(num);
		noticeDTO.setContent(noticeDTO.getContent().replace("\n", "<br>"));
		
		mv.addObject("notice", noticeDTO);

		if (state.equals("cont")) {
			mv.setViewName("service/notice_cont");
		} else if (state.equals("edit")) {
			mv.setViewName("service/notice_edit");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/cs/notice/{num}", method=RequestMethod.PUT)
	public String noticeEdit(
			@PathVariable int num,
			NoticeDTO notice
			) {
		notice.setNum(num);
		noticeService.updateNotice(notice);
		
		return "redirect:/cs/notice/" + num + "?state=cont";
	}
	
	@RequestMapping(value="/cs/notice/{num}", method=RequestMethod.DELETE)
	public String noticeDel(
			@PathVariable int num
			) {
		noticeService.delNotice(num);
		
		return "redirect:/cs/notice";
	}
	
	@RequestMapping(value="/cs/faq", method=RequestMethod.GET)
	public ModelAndView faqList(
			ModelAndView mv,
			@RequestParam String keyword,
			@RequestParam(value="state", defaultValue="none") String state,
			HttpServletRequest request) {
		Map<String, Object> map = faqService.getFaqSrcList(keyword, request);
		
		mv.addObject("faqList", map.get("faqList"));
		mv.addObject("listCount", map.get("listCount"));
		mv.addObject("page", map.get("page"));
		mv.addObject("limit", map.get("limit"));
		mv.addObject("maxPage", map.get("maxPage"));
		mv.addObject("startPage", map.get("startPage"));
		mv.addObject("endPage", map.get("endPage"));
		mv.addObject("keyword", keyword);
		
		if (state.equals("paging")) {
			System.out.println("ajax 실행!!");
			mv.setViewName("service/faq_ajax");
		} else {			
			mv.setViewName("service/faq");
		}

		return mv;
	}
	
	@RequestMapping(value = "/cs/faq/write")
	public String faqInsert() {
		return "service/faq_write";
	}
	
	@RequestMapping(value="/cs/faq", method=RequestMethod.POST)
	public String faqInsert(FAQDTO faq) {
		faqService.insertFaq(faq);
		
		return "redirect:/cs/faq?keyword=";
	}
	
	@ResponseBody
	@RequestMapping(value="/cs/faq/{num}")
	public int faqReadCountUpdate(@PathVariable int num) {
		
		return faqService.faqReadCountUpdate(num); 
	}
	
	@RequestMapping(value="/cs/qna", method=RequestMethod.GET)
	public ModelAndView qnaList(
			ModelAndView mv, 
			SessionBean session, 
			@RequestParam(defaultValue="none") String state,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (session.getNickname().equals("admin")) {
			map = qnaService.getQnaListAll(request);
			
			mv.addObject("qnaList", map.get("qnaList"));
			mv.addObject("listCount", map.get("listCount"));
			mv.addObject("page", map.get("page"));
			mv.addObject("limit", map.get("limit"));
			mv.addObject("maxPage", map.get("maxPage"));
			mv.addObject("startPage", map.get("startPage"));
			mv.addObject("endPage", map.get("endPage"));
		} else {
			map = qnaService.getQnaList(session.getMemberNum(), request);
			
			mv.addObject("qnaList", map.get("qnaList"));
			mv.addObject("listCount", map.get("listCount"));
			mv.addObject("page", map.get("page"));
			mv.addObject("limit", map.get("limit"));
			mv.addObject("maxPage", map.get("maxPage"));
			mv.addObject("startPage", map.get("startPage"));
			mv.addObject("endPage", map.get("endPage"));
		}
		if (state.equals("paging") || state.equals("search")) {
			System.out.println("ajax 실행!!");
			mv.setViewName("service/qna_ajax");
		} else {			
			mv.setViewName("service/qna");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/cs/qna/write")
	public String qnaWrite() {
		
		return "service/qna_write";
	}
	
	@RequestMapping(value="/cs/qna", method=RequestMethod.POST)
	public String qnaWrite(QNADTO qna, SessionBean session) {
		qna.setWriter(session.getMemberNum());
		qnaService.insertQna(qna);
		
		return "redirect:/cs/qna/" + qna.getNum() + "?state=cont";
	}
	
	@RequestMapping(value="/cs/qna/{num}", method=RequestMethod.GET)
	public ModelAndView qnaCont(
			ModelAndView mv, 
			@PathVariable int num, 
			@RequestParam("state") String state,
			HttpServletResponse response) throws Exception {
		QNADTO qnaDTO = qnaService.getQna(num);
		qnaDTO.setContent(qnaDTO.getContent().replace("\n", "<br>"));
		
		mv.addObject("qna", qnaDTO);

		if (state.equals("cont")) {
			mv.setViewName("service/qna_cont");
		} else if (state.equals("edit")) {
			mv.setViewName("service/qna_edit");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/cs/qna/{num}", method=RequestMethod.PUT)
	public String qnaUpdate(
			@PathVariable int num,
			QNADTO qna) {
		System.out.println("start");
		qna.setNum(num);
		System.out.println("here : " + qna.getTitle());
		System.out.println("here : " + qna.getContent());
		if (qna.getAnswer() == null) {
			qnaService.updateQna(qna);
		} else {
			qnaService.updateAnswer(qna);
		}
		
		return "redirect:/cs/qna/" + num + "?state=cont";
	}
	
	@RequestMapping(value="/cs/qna/{num}", method=RequestMethod.DELETE)
	public String qnaDelete(@PathVariable int num) {
		qnaService.deleteQna(num);
		
		return "cs/qna";
	}
	
	@RequestMapping(value="/cs/s3_uploadpage")
	public String s3_test() {
		
		return "service/s3_upload";
	}
	
	@RequestMapping(value="/cs/s3_upload", method=RequestMethod.POST)
	public ModelAndView s3_upload(@RequestParam("file") MultipartFile file, ModelAndView mv) throws Exception {
		
		try {
			String uploadPath = "rent";
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, file.getOriginalFilename(), file), HttpStatus.CREATED);
			
			String certificatePath = (String) img_path.getBody();

			mv.addObject("imgPath", certificatePath);
			mv.setViewName("service/s3_complete");
			
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	//프로필 이미지
	@SuppressWarnings("resource")
	@ResponseBody
	@RequestMapping("/cs/displayFile")
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
//		else if(directory.equals("market")) {
//			inputDirectory = "market";
//		}else {
//			inputDirectory = "profile";
//		}

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
	
	@ResponseBody
	@RequestMapping(value = "/cs/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, String directory)throws Exception {

		logger.info("delete file: " + fileName);
		logger.info("delete foloder:"+directory);
		String inputDirectory = null;
		if(directory.equals("rent")) {
			inputDirectory = "rent";
		}
//		else if(directory.equals("market")) {
//			inputDirectory = "market";
//		} else {
//			inputDirectory = "profile";
//		}

		try {
			s3Util.fileDelete(bucketName, inputDirectory+fileName);
		} catch (Exception e) {
			// s3.fileDelete(bucketName, "s_user.jpg");
			e.printStackTrace();
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@RequestMapping(value = "/cs/download", method = RequestMethod.GET)
    public ResponseEntity<byte[]> download(
    		@RequestParam String directory, 
    		@RequestParam String fileName) throws IOException {
    	
        return s3Util.download(bucketName, directory + fileName);
    }
    
    
    
}