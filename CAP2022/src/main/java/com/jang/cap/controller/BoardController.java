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
	   
	      //??? ?????????
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
	            String originFileName = mf.getOriginalFilename(); // ?????? ?????? ???
	            long fileSize = mf.getSize(); // ?????? ?????????
	            
	            fileVO.setBno(bno);
	            fileVO.setOfilename(originFileName);
	            fileVO.setSfilename(originFileName); // ???????????? ?????? ????????? ?????? ????????? ????????????:?????? ?????? ??????  
	            fileVO.setFilesize(fileSize); 
	                 
	            boardService.insertFile(fileVO);//???????????? ?????? ?????? ??????
	   
	            String safeFile = uploadPath +  originFileName; // ???????????? ?????? ??????     
	   
	            try {
	                mf.transferTo(new File(safeFile)); // ???????????? ?????? ?????? 
	   
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

	     List<AttFileVO> fileList = boardService.getFileList(bno); //???????????? ?????? ?????? ??????-list
	     List<ReplyVO> reply = boardService.getReplyList(bno); // ?????? ?????? ?????? ?????? ??? list

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
	   	model.addAttribute("errCode", "5"); //????????????  ????????? ??????
	   model.addAttribute("bno", bno);
	   return "redirect:view";
	   } else {//?????? ?????????
	   List<AttFileVO> fileList = boardService.getFileList(bno); // ???????????? ?????? ?????? - list

	   model.addAttribute("board", board);
	   model.addAttribute("fileList", fileList);
	   return "/board/modify";
	   }
	  }
	   
	   @RequestMapping(value = "/modify", method=RequestMethod.POST)  //????????? ??? ??????
	   public String  boardModifyProc(@ModelAttribute("BoardVO") BoardVO boardVO, MultipartHttpServletRequest mrequest, RedirectAttributes rea ){

	   String content = boardVO.getContent().replaceAll("\r\n", "<br />"); //java ?????? ?????? HTML???????????????
	   boardVO.setContent(content);

	   boardService.updateArticle(boardVO);

	   int bno = boardVO.getBno(); 


	   //????????? ????????? ???????????? ??????????????? ????????????.
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

	   //????????? ??????  ?????? ????????????
	   List<MultipartFile> fileList = mrequest.getFiles("fileList");
	  
	   for (MultipartFile mf : fileList) {
	  if (!mf.isEmpty()) {
	       String originFileName = mf.getOriginalFilename(); // ??????????????? ?????? ?????? ???
	   	 long fileSize = mf.getSize(); // ?????? ?????????
	       
	       file.setBno(bno);
	       file.setFilesize(fileSize); 
	       file.setOfilename(originFileName);
	       file.setSfilename(originFileName);
	            
	       boardService.insertFile(file); // ???????????? ?????? ?????? 

	       String safeFile = uploadPath +  originFileName; 

	       try {
	           mf.transferTo(new File(safeFile)); // ???????????? ?????? ?????? 
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
	   String userId = (String) session.getAttribute("userId"); // login ????????? ??????
	   int bno = Integer.parseInt(request.getParameter("bno"));

	   BoardVO board = boardService.getArticle(bno);

	   String setView="";
	   if(userId.equals(board.getWriterId())){
	   //?????? ?????? 
	   List<ReplyVO> reply = boardService.getReplyList(bno); 
	   if(reply.size() > 0){
	   	boardService.deleteReplyBybno(bno);
	   }
	   //?????? ????????? ??????, ?????? ?????? ?????? 
	   List<AttFileVO> files  = boardService.getFileList(bno); 
	   if(files.size() > 0){
	        //?????????  ?????? ?????? ??????
	   for (AttFileVO filedel : files) {
	   String f_stor_all = filedel.getOfilename();
	   File f = new File(session.getServletContext().getRealPath("/") + f_stor_all); 
	   f.delete();
	   }
	   boardService.deleteFileBybno(bno); //??????????????? ?????? ?????? ??? ?????? file ?????? ??????
	   }
	   //board ??????
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
	   byte[] bytes = FileCopyUtils.copyToByteArray(file); //SPRING 5.0 ?????? 

	   String fn = new String(file.getName().getBytes(), "iso_8859_1");

	   response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
	   response.setContentLength(bytes.length);

	   return bytes;
	   }


}



