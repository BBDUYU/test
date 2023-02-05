package com.jang.cap.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jang.cap.model.AttFileVO;
import com.jang.cap.model.BoardVO;
import com.jang.cap.model.ReplyVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.model.UserVO;
import com.jang.cap.service.BoardService;
import com.jang.cap.service.LoginService;



@Controller 
@RequestMapping("/board")

public class BoardController {
	
	   @Autowired
	   private BoardService boardService;
	   @Autowired
		private LoginService loginService;
	   
	   
	@RequestMapping(value="/sup",method = RequestMethod.GET)
	public String sup() {
		return "/board/sup";
		
	}
	
	@RequestMapping(value="/qna",method = RequestMethod.GET)
	public String qna(@ModelAttribute("SearchVO")SearchVO searchVO,Model model,HttpSession session)throws Exception {
		
			
	      List<BoardVO> blist=boardService.getBoardList(searchVO);
	      model.addAttribute("boardList",blist);
	      
	      StringBuffer pageUrl=boardService.getPageUrl(searchVO);
	      model.addAttribute("pageHttp",pageUrl);
	      
	   
		return "/board/qna";
		
	}
	@RequestMapping(value="/qnaForm",method = RequestMethod.GET)
	public String qnaForm() {
		
		return "/board/qnaForm";
	}
	String uploadPath = "C:\\upload\\"; 
	
	 @RequestMapping(value="/qnaForm", method=RequestMethod.POST)
	   public String boardWriteProc(@ModelAttribute("BoardVO") BoardVO boardVO, 
	           MultipartHttpServletRequest mrequest){
	   
	      //새 글저장
		 String  content = boardVO.getContent().replaceAll("<","&lt;");
			content = content.replaceAll(">","&gt;");
			content = content.replaceAll("&","&amp;"); 
			content = content.replaceAll("\"","&quot;"); 
			content = content.replaceAll("\r\n", "<br/>");

		  
	      boardVO.setContent(content);
		
	   
	   boardService.writeArticle(boardVO);
	   
	   int bno = boardVO.getBno(); 
	   
	   AttFileVO fileVO = new AttFileVO();
	   List<MultipartFile> fileList = mrequest.getFiles("fileList"); 
	   
	        for (MultipartFile mf : fileList) {
	        if (!mf.isEmpty()) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈
	            
	            fileVO.setBno(bno);
	            fileVO.setOfilename(originFileName);
	            fileVO.setSfilename(originFileName); // 디스크에 파일 저장시 동일 파일명 발생대비:현재 처리 안함  
	            fileVO.setFilesize(fileSize); 
	                 
	            boardService.insertFile(fileVO);//테이블에 화일 정보 저장
	   
	            String safeFile = uploadPath +  originFileName; // 디스크에 파일 저장     
	   
	            try {
	                mf.transferTo(new File(safeFile)); // 디스크에 파일 저장 
	   
	            } catch (IllegalStateException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        }        
	        return "redirect:sup";
	   }
	   @RequestMapping("/view")
	   public String boardView(@RequestParam(value = "bno", required = false, defaultValue="0") 
	   int bno, HttpSession session, Model model) throws Exception { 

	     BoardVO boardVO = boardService.getArticle(bno); //get selected article model

	     List<AttFileVO> fileList = boardService.getFileList(bno); //첨부파일 목록 읽어 오기-list
	     List<ReplyVO> reply = boardService.getReplyList(bno); // 댓글 목록 읽어 오기 – list

	     model.addAttribute("board", boardVO);
	     model.addAttribute("fileList", fileList);
	     model.addAttribute("replyList", reply);

	     return "board/view";
	   }
	   @RequestMapping("/writeReply")
	   public String replyWriteProc(HttpServletRequest request, HttpSession session, ReplyVO replyVO,BoardVO boardVO, RedirectAttributes rea){

	   String userId = (String) session.getAttribute("userId");	   
	   int bno = Integer.parseInt(request.getParameter("bno")); 
	   
	   BoardVO board = boardService.getArticle(bno);

	   if (replyVO.getContent().isEmpty()) {
	   	rea.addAttribute("errCode", "1");
	   }
	   else {
	   String  content = replyVO.getContent().replaceAll("<","&lt;");
	   content = replyVO.getContent().replaceAll(">","&gt;");
	   content = replyVO.getContent().replaceAll("&","&amp;"); 
	   content = replyVO.getContent().replaceAll("\"","&quot;"); 
	   content = replyVO.getContent().replaceAll("\r\n", "<br />");

	   replyVO.setContent(content);
	   
	   boardService.writeReply(replyVO);
	   boardService.incrementReplyCnt(bno);

	   }

	   rea.addAttribute("bno", replyVO.getBno());
	   
	   return "redirect:view";
	   }

	   @RequestMapping(value = "/modify", method=RequestMethod.GET )
	   public String boardModify(HttpServletRequest request, HttpSession session, Model model){

	   String userId = (String) session.getAttribute("userId");
	   int bno = Integer.parseInt(request.getParameter("bno"));

	   BoardVO board = boardService.getArticle(bno);

	   // <br /> tag change to new line code
	   String content = board.getContent().replaceAll("<br />", "\r\n");
	   board.setContent(content); 

	   if(!userId.equals(board.getWriterId())){
	   	model.addAttribute("errCode", "5"); //작성자만  글수정 가능
	   model.addAttribute("bno", bno);
	   return "redirect:view";
	   } else {//회원 글수정
	   List<AttFileVO> fileList = boardService.getFileList(bno); // 첨부파일 읽어 오기 - list

	   model.addAttribute("board", board);
	   model.addAttribute("fileList", fileList);
	   return "/board/modify";
	   }
	  }
	   
	   @RequestMapping(value = "/modify", method=RequestMethod.POST)  //게시판 글 수정
	   public String  boardModifyProc(@ModelAttribute("BoardVO") BoardVO boardVO, MultipartHttpServletRequest mrequest, RedirectAttributes rea ){

	   String content = boardVO.getContent().replaceAll("\r\n", "<br />"); //java 새줄 코드 HTML줄바꾸기로
	   boardVO.setContent(content);

	   boardService.updateArticle(boardVO);

	   int bno = boardVO.getBno(); 


	   //체크된 파일을 테이블과 디스크에서 삭제한다.
	   String[] fileno = mrequest.getParameterValues("fileno");

	   if (fileno != null) {

	   for (String fn : fileno) {

	       int fno = Integer.parseInt(fn);
	       
	       String oFileName = boardService.getFileName(fno);
	      
	       String safeFile = uploadPath +  oFileName;
	       
	       File removeFile = new File(safeFile);// remove disk uploaded file 
	       removeFile.delete();
	           
	       boardService.deleteFile(fno); //remove table uploaded file 
	   }
	   }


	   AttFileVO file = new AttFileVO ();

	   //새첨부 파일  목록 일어오기
	   List<MultipartFile> fileList = mrequest.getFiles("fileList");
	  
	   for (MultipartFile mf : fileList) {
	  if (!mf.isEmpty()) {
	       String originFileName = mf.getOriginalFilename(); // 새첨부파일 원본 파일 명
	   	 long fileSize = mf.getSize(); // 파일 사이즈
	       
	       file.setBno(bno);
	       file.setFilesize(fileSize); 
	       file.setOfilename(originFileName);
	       file.setSfilename(originFileName);
	            
	       boardService.insertFile(file); // 테이블에 파일 저장 

	       String safeFile = uploadPath +  originFileName; 

	       try {
	           mf.transferTo(new File(safeFile)); // 디스크에 파일 저장 
	       } catch (IllegalStateException e) {
	           e.printStackTrace();
	       } catch (IOException e) {
	           e.printStackTrace();
	       }
	  }
	 }
	 rea.addAttribute("bno", boardVO.getBno());
	 return "redirect:/board/view";

	   }
	   @RequestMapping("/delete")
	   public String boardDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
	   String userId = (String) session.getAttribute("userId"); // login 개발뒤 삭제
	   int bno = Integer.parseInt(request.getParameter("bno"));

	   BoardVO board = boardService.getArticle(bno);

	   String setView="";
	   if(userId.equals(board.getWriterId())){
	   //답글 삭제 
	   List<ReplyVO> reply = boardService.getReplyList(bno); 
	   if(reply.size() > 0){
	   	boardService.deleteReplyBybno(bno);
	   }
	   //첨부 파일명 삭제, 실제 파일 삭제 
	   List<AttFileVO> files  = boardService.getFileList(bno); 
	   if(files.size() > 0){
	        //저장된  실제 파일 삭제
	   for (AttFileVO filedel : files) {
	   String f_stor_all = filedel.getOfilename();
	   File f = new File(session.getServletContext().getRealPath("/") + f_stor_all); 
	   f.delete();
	   }
	   boardService.deleteFileBybno(bno); //테이블에서 해당 번호 글 첨부 file 전체 삭제
	   }
	   //board 삭제
	   boardService.deleteArticle(bno);
	   setView="redirect:qna";
	   } else {
	   rea.addAttribute("errCode", "1");
	   rea.addAttribute("bno", bno);
	   setView="redirect:view";
	   }
	   return setView ;
	   }
	   @RequestMapping(value = "/filedown")
	   @ResponseBody
	   public byte[] downProcess(HttpServletResponse response, @RequestParam String fileName ) throws IOException {

	   File file = new File("c:/upload/" + fileName);
	   byte[] bytes = FileCopyUtils.copyToByteArray(file); //SPRING 5.0 이상 

	   String fn = new String(file.getName().getBytes(), "iso_8859_1");

	   response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
	   response.setContentLength(bytes.length);

	   return bytes;
	   }


}



