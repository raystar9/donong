package team.swcome.donong.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	BoardService boardService;
	private String saveFolder="C:\\Users\\user1\\git\\donong\\src\\main\\webapp\\resources\\upload\\";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/communitylist", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "state", defaultValue = "no") String state,
			@RequestParam(required = false, defaultValue="전체") String category, HttpServletRequest request) {
		List<BoardDTO> boardlist = new ArrayList<>();
		HttpSession session = request.getSession();
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

	@RequestMapping(value = "/communitywrite", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {

		return "com/com_write";
	}

	@RequestMapping(value = "/communitywrite_ok", method = RequestMethod.POST)
	public String write_ok(Locale locale, Model model,@RequestParam MultipartFile uploadfile,@ModelAttribute BoardDTO boardDTO) throws IOException  {
		
		
		if(!uploadfile.isEmpty()) {
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			
			//원래 파일명 저장
			boardDTO.setFilepath(fileName);
			
			//생성할 폴더 이름: 오늘 년+월+일
			Calendar c=Calendar.getInstance();
			int year=c.get(Calendar.YEAR);
			int month=c.get(Calendar.MONTH)+1;
			int date=c.get(Calendar.DATE);
			String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
			
			//파일 객체 생성합니다.
			File path1=new File(homedir);
			
			//폴더가 존재하는지 확인합니다.
			if(!(path1.exists())) {
				System.out.println("폴더 만들어요");
				path1.mkdir();//새로운 폴더를 생성
			}
			//난수를 구합니다.
			Random r= new Random();
			int random=r.nextInt(100000000);
			
			/****확장자 구하기 시작****/
			int index=fileName.lastIndexOf(".");
			//문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면, lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			//(파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
			System.out.println("index="+index);
			
			String fileExtension= fileName.substring(index+1);
			System.out.println("fileExtension="+fileExtension);
			
			//새로운 파일명을 저장
			String refileName="bbs"+year+month+date+random+"."+fileExtension;
			System.out.println("refileName="+refileName);
			
			//오라클 디비에 저장될 레코드 값
			String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;
			System.out.println("fileDBName="+fileDBName);
			
			//transferTo(File path):업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder+fileDBName));
			//바뀐 파일명으로 저장
			boardDTO.setFilename(fileDBName);		
		}
		this.boardService.insertBbs(boardDTO);//저장 메서드 호출

		return "redirect:/communitylist";
		
	}

	@RequestMapping(value = "/communitycont", method = RequestMethod.GET)
	public ModelAndView cont(HttpServletRequest request,
			HttpServletResponse response,Locale locale, Model model,@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam("num") int bbs_num,
			@RequestParam("state") String state) throws Exception{
		
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
	
	@RequestMapping(value="/download.file",method= {RequestMethod.GET})
	public void downloadFile(HttpServletResponse response,
			@RequestParam("filename") String storedFileName,
			@RequestParam("filepath") String originalFileName,
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("original="+originalFileName);
		
		byte fileByte[]=FileUtils.readFileToByteArray(new File(saveFolder+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment;fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	@RequestMapping(value = "/communityedit", method = RequestMethod.GET)
	public String edit(Model model,  @RequestParam(value = "page", defaultValue = "1") int page,
		 @RequestParam(value = "num") int num) {
		
		model.addAttribute("bbsbean", boardService.getContent(num));
		model.addAttribute("page", page);
		model.addAttribute("num", num);
		return "com/com_edit";
	}
	
	@RequestMapping(value = "/communityedit_ok", method = RequestMethod.POST)
	public ModelAndView board_edit_ok(Model model,BoardDTO bbsbean,MultipartFile uploadfile, @RequestParam int page, HttpServletResponse response, @RequestParam(value = "num") String num) throws Exception {
		
		response.setContentType("text/html;chaset=UTF-8");
		PrintWriter out = response.getWriter();//출력 스트림 생성
		
		//번호를 기준으로 DB 내용을 가져옵니다.
		BoardDTO bcont= boardService.getContent(bbsbean.getNum());
		
		if(!bcont.getPassword().equals(bbsbean.getPassword())) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.back()");
			out.println("</script>");
			
			
		}else {//비번이 같다면
			
			if(!uploadfile.isEmpty()) {
				File DelFile=new File(saveFolder+bcont.getFilename());
				if(DelFile.exists())
				{
					DelFile.delete();//기존 이전 파일을 삭제
					}
				String fileName=uploadfile.getOriginalFilename();
				bbsbean.setFilepath(fileName);
				Calendar c=Calendar.getInstance();
				int year=c.get(Calendar.YEAR);
				int month=c.get(Calendar.MONTH)+1;
				int date=c.get(Calendar.DATE);
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
				
				//homedir에 file 객체 생성
				File path1=new File(homedir);
				
				if(!(path1.exists())) {
					System.out.println("폴더 만들어요");
					path1.mkdir();//새로운 폴더를 생성
				}
				Random r= new Random();
				int random=r.nextInt(100000000);
				
				/****확장자 구하기 시작****/
				int index=fileName.lastIndexOf(".");
				//문자열에서 특정 문자열의 위치 값(index)를 반환한다.
				//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면, lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
				//(파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
				System.out.println("index="+index);
				
				String fileExtension= fileName.substring(index+1);
				System.out.println("fileExtension="+fileExtension);
				
				//새로운 파일명을 저장
				String refileName="bbs"+year+month+date+random+"."+fileExtension;
				System.out.println("refileName="+refileName);
				
				//오라클 디비에 저장될 레코드 값
				String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;
				System.out.println("fileDBName="+fileDBName);
				
				//transferTo(File path):업로드한 파일을 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder+fileDBName));
				//바뀐 파일명으로 저장
				bbsbean.setFilename(fileDBName);		
				}
			this.boardService.editBbs(bbsbean);
			response.sendRedirect("communitycont?num="+num+"&page="+page+"&state=cont");
		}
		
		return null;
	}

	@RequestMapping(value = "/communitydel", method = RequestMethod.GET)
	public String del(Model model, @RequestParam(value = "num") String num) {
		model.addAttribute("num", num);
		return "com/com_del";
	}
	@RequestMapping(value = "/communitydel_ok", method = RequestMethod.POST)
	public String board_del_ok(BoardDTO b, @RequestParam("page") String page, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;chaset=UTF-8");
		PrintWriter out = response.getWriter();//출력 스트림 생성
		
		//번호를 기준으로 DB 내용을 가져옵니다.
		BoardDTO board= boardService.getContent(b.getNum());
		int num=b.getNum();
		String fname=b.getFilename();
		if(!board.getPassword().equals(b.getPassword())) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.back()");
			out.println("</script>");
			
			
		}else {//비번이 같다면
			if(fname!=null) {
				File file=new File(saveFolder+fname);
				file.delete();
			}
			boardService.deleteBbs(num);
			return
					"redirect:/communitylist";
			
			
		}
		
		return null;
	}

	@RequestMapping(value = "/communityreply", method = RequestMethod.GET)
	public String reply(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			 @RequestParam(value = "num") int num) {
		model.addAttribute("bbsbean", boardService.getContent(num));
		model.addAttribute("page", page);
		model.addAttribute("num", num);
		
		return "com/com_reply";
	}
	/* 게시판 답변 저장 */
	@RequestMapping(value = "/communityreply_ok", method = RequestMethod.POST)
	public String bbs_reply_ok(BoardDTO bbsbean, @RequestParam("page") String page) throws Exception {
		boardService.refEdit(bbsbean);
		bbsbean.setRe_lev(bbsbean.getRe_lev()+1);
		bbsbean.setRe_seq(bbsbean.getRe_seq()+1);
		
		boardService.bbsReplyOk(bbsbean);// 저장 메서드
		
		return "redirect:/communitylist?page="+page;
	}

	/* 자료실 검색 목록*/
	@RequestMapping(value="/communityfind",method=RequestMethod.GET)
	public ModelAndView bbs_find_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam("find_name") String find_name,
			@RequestParam("find_field") String find_field) throws Exception{
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

}
