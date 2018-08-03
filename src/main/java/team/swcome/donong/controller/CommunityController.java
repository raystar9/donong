package team.swcome.donong.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.util.IOUtils;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.BoardService;
import team.swcome.donong.service.ReplyService;
import team.swcome.donong.service.S3Service;
import team.swcome.donong.service.S3Util;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("sessionBean")
@Controller
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	BoardService boardService;
	@Autowired
	S3Service s3Service;
	S3Util s3Util = new S3Util();
	String bucketName = "donong-s3";
	
	@RequestMapping(value = "/community/list", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "state", defaultValue = "no") String state,
			@RequestParam(required = false, defaultValue="전체") String category, HttpServletRequest request,
			SessionBean sessionBean) {
		List<BoardDTO> boardlist = new ArrayList<>();
		HttpSession session = request.getSession();
		sessionBean.setMemberNum(1);
		sessionBean.setNickname("admin");
		sessionBean.getMemberNum();
		if (limit != null) {
			session.setAttribute("limit", limit);
		} else {
			limit = 10;
		}

		if (session.getAttribute("limit") != null) {
			limit = Integer.parseInt(session.getAttribute("limit").toString());
		}
		switch (category) {
		case "질문":
			boardlist = boardService.getAskList(page,limit);
			break;
		case "잡담":
			boardlist = boardService.getTalkList(page,limit);
			break;
		case "정보":
			boardlist = boardService.getInfoList(page,limit);
			break;
		case "모임":
			boardlist = boardService.getCircleList(page,limit);
			break;
		case "전체":
		default:
			boardlist = boardService.getMainList(page,limit);
		}
		int listcount;
		if(category.equals("전체")) {
			listcount = boardService.getListCount();			
		} else {
			listcount = boardService.getListCountByCategory(category);
		}
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page - 1) / 10) * 10 + 1;
		
		int endpage = startpage + 10 - 1;
		
		if (endpage > maxpage){
			endpage = maxpage;
		}
		if (endpage < page){
			page = endpage;
		}
		
		model.addAttribute("category", category);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("bbslist", boardlist);
		model.addAttribute("boardList", boardlist);
		
		if (state.equals("ajax")) {
			return "com/com_list2";
		} else {
			return "com/com_list";
		}
	}

	@RequestMapping(value = "/community/write", method = RequestMethod.GET)
	public String write(Locale locale, Model model, SessionBean sessionBean) {
		sessionBean.getMemberNum();
		return "com/com_write";
	}

	@RequestMapping(value = "/community/write_ok", method = RequestMethod.POST)
	public String write_ok(Locale locale, Model model,@RequestParam MultipartFile uploadfile,@ModelAttribute BoardDTO boardDTO) throws IOException  {

		if(!uploadfile.isEmpty()) {
			String uploadPath = "community";
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, uploadfile.getOriginalFilename(), uploadfile), HttpStatus.CREATED);
			
			String certificatePath = (String) img_path.getBody();
			
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			
			//원래 파일명 저장
			boardDTO.setFilename(fileName);		

			boardDTO.setFilepath(certificatePath);
		}
		this.boardService.insertBbs(boardDTO);//저장 메서드 호출

		return "redirect:/community/list";
		
	}

	@RequestMapping(value = "/community/cont", method = RequestMethod.GET)
	public ModelAndView cont(HttpServletRequest request,
			HttpServletResponse response,Locale locale, Model model,@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam("num") int bbs_num,
			@RequestParam("state") String state,
			SessionBean sessionBean) throws Exception{
		sessionBean.getMemberNum();
		if(state.equals("cont")) {//내용보기일때만
			boardService.bbsHit(bbs_num);
		}
		BoardDTO bbsbean = boardService.getContent(bbs_num);
		
		ModelAndView contM = new ModelAndView();
		contM.addObject("num", bbs_num);
		if(state.equals("cont")) {//내용보기일때
			contM.setViewName("com/com_cont");//내용보기 페이지 설정
			String content=bbsbean.getContent().replace("\n","<br/>");
			contM.addObject("content",content);
		}else if(state.equals("edit")) {//수정폼
			contM.setViewName("com/com_edit");
		}else if(state.equals("del")) {//삭제폼
			contM.setViewName("com/com_del");
		}else if(state.equals("reply")) {//답변달기 폼
			contM.setViewName("com/com_reply");
		}
		contM.addObject("bbsbean",bbsbean);
		contM.addObject("page",page);
		return contM;
	}
	
	@RequestMapping(value="/community/download.file",method= {RequestMethod.GET})
	public void downloadFile(HttpServletResponse response,
			@RequestParam("filename") String storedFileName,
			@RequestParam("filepath") String originalFileName,
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("original="+originalFileName);
		
		//byte fileByte[]=FileUtils.readFileToByteArray(new File(saveFolder+storedFileName));
		
		response.setContentType("application/octet-stream");
		//response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment;fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		//response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	@RequestMapping(value = "/community/edit", method = RequestMethod.GET)
	public String edit(Model model,  @RequestParam(value = "page", defaultValue = "1") int page,
		 @RequestParam(value = "num") int num,
		 SessionBean sessionBean) {
		sessionBean.getMemberNum();
		model.addAttribute("bbsbean", boardService.getContent(num));
		model.addAttribute("page", page);
		model.addAttribute("num", num);
		return "com/com_edit";
	}
	
	@RequestMapping(value = "/community/edit_ok", method = RequestMethod.POST)
	public String board_edit_ok(Model model,BoardDTO bbsbean,MultipartFile uploadfile, @RequestParam int page, HttpServletResponse response, @RequestParam(value = "num") int num) throws Exception {
	System.out.println(uploadfile);
	num=bbsbean.getNum();
		if(!uploadfile.isEmpty()) {
			String uploadPath = "community";
			ResponseEntity<String> img_path = new ResponseEntity<>
			(S3Service.uploadFile(uploadPath, uploadfile.getOriginalFilename(), uploadfile), HttpStatus.CREATED);
			
			String certificatePath = (String) img_path.getBody();
			
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			
			//원래 파일명 저장
			bbsbean.setFilename(fileName);		

			bbsbean.setFilepath(certificatePath);
		}else if(uploadfile.isEmpty()) {
			bbsbean.setFilename("");
			bbsbean.setFilepath("");
			boardService.deletefile(num);
		}
			logger.debug("upload : {}", uploadfile.getName());
			this.boardService.editBbs(bbsbean);
			
			return "redirect:/community/cont?num="+num+"&page="+page+"&state=cont";
		
		
		
	}

	@RequestMapping(value = "/community/del", method = RequestMethod.GET)
	public String del(Model model, @RequestParam(value = "num") String num, SessionBean sessionBean) {
		sessionBean.getMemberNum();
		model.addAttribute("num", num);
		return "com/com_del";
	}
	@RequestMapping(value = "/community/del_ok", method = RequestMethod.POST)
	public String board_del_ok(BoardDTO b, @RequestParam("page") String page, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;chaset=UTF-8");
		PrintWriter out = response.getWriter();//출력 스트림 생성
		
		//번호를 기준으로 DB 내용을 가져옵니다.
		BoardDTO board= boardService.getContent(b.getNum());
		int num=b.getNum();
		String fname=b.getFilename();
		
		if(fname!=null) {
				//File file=new File(saveFolder+fname);
				//file.delete();
				
			boardService.deleteBbs(num);
			
			
			
		}
	
		boardService.deleteBbs(num);
		return "redirect:/community/list";
	}

	@RequestMapping(value = "/community/reply", method = RequestMethod.GET)
	public String reply(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			 @RequestParam(value = "num") int num, SessionBean sessionBean) {
		model.addAttribute("bbsbean", boardService.getContent(num));
		model.addAttribute("page", page);
		model.addAttribute("num", num);
		sessionBean.getMemberNum();
		return "com/com_reply";
	}
	/* 게시판 답변 저장 */
	@RequestMapping(value = "/community/reply_ok", method = RequestMethod.POST)
	public String bbs_reply_ok(BoardDTO bbsbean, @RequestParam("page") String page) throws Exception {
		boardService.refEdit(bbsbean);
		bbsbean.setRe_lev(bbsbean.getRe_lev()+1);
		bbsbean.setRe_seq(bbsbean.getRe_seq()+1);
		
		boardService.bbsReplyOk(bbsbean);// 저장 메서드
		
		return "redirect:/community/list?page="+page;
	}

	/* 자료실 검색 목록*/
	@RequestMapping(value="/community/find",method=RequestMethod.GET)
	public ModelAndView bbs_find_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam("find_name") String find_name,
			@RequestParam("find_field") String find_field, SessionBean sessionBean) throws Exception{
		sessionBean.getMemberNum();
		int limit=10;
		
		Map<String, String> m=new HashMap<>();
		m.put("page", page + "");
		m.put("find_field", find_field);
		m.put("find_name", "%"+find_name+"%");
		int listcount=this.boardService.getListCount3(m);
		
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		if( endpage<page) page=endpage;
		
		List<BoardDTO> bbslist=boardService.getBbsList3(m);
		
		ModelAndView model=new ModelAndView("com/com_find");
		model.addObject("find_name",find_name);
		model.addObject("find_field",find_field);
		model.addObject("page",page);
		model.addObject("maxpage",maxpage);
		model.addObject("startpage",startpage);
		model.addObject("endpage",endpage);
		model.addObject("listcount",listcount);
		model.addObject("bbslist",bbslist);
		
		return model;
	}
	
	@RequestMapping(value="/community/s3_upload", method=RequestMethod.POST)
	public ModelAndView s3_upload(@RequestParam("file") MultipartFile file, ModelAndView mv) throws Exception {
		
		try {
			String uploadPath = "community";
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
	@RequestMapping("/community/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName, String directory) throws Exception {
		logger.info(directory);
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection conn = null;
		logger.info("FILE NAME: " + fileName);

		String inputDirectory = null;
		if(directory.equals("community")) {
			inputDirectory = "community";
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
	
	@RequestMapping(value = "/community/deleteFile", method = RequestMethod.GET)
	public String deleteFile(Model model,@RequestParam(value = "num") int num,BoardDTO b,String fileName, String directory,HttpServletRequest request,SessionBean sessionBean)throws Exception {
		
		request.setCharacterEncoding("utf-8");
		logger.info("delete file: " + fileName);
		logger.info("delete foloder:"+directory);
		String inputDirectory = null;
		if(directory.equals("community")) {
			inputDirectory = "community";
		}

		try {
			s3Util.fileDelete(bucketName, inputDirectory+fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "com/delete_confirm";
	}

}
