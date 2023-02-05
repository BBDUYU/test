package com.jang.cap.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jang.cap.model.HReviewVO;
import com.jang.cap.model.HalfVO;
import com.jang.cap.model.HresVO;
import com.jang.cap.model.OReviewVO;
import com.jang.cap.model.OneVO;
import com.jang.cap.model.OresVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.model.UserVO;
import com.jang.cap.service.HalfService;
import com.jang.cap.service.HresService;
import com.jang.cap.service.HreviewService;
import com.jang.cap.service.LoginService;
import com.jang.cap.service.OReviewService;
import com.jang.cap.service.OneService;
import com.jang.cap.service.OresService;
import com.jang.cap.utils.AES256Util;

@Controller 
@RequestMapping("/board")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private HresService hresService;
	@Autowired
	private HalfService halfService;
	@Autowired
	private HreviewService hreviewService;
	@Autowired
	private OresService oresService;
	@Autowired
	private OneService oneService;
	@Autowired 
	private OReviewService oreviewService;
	
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	 public String login() {
		return "/board/login";
		
	}
	
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginProc(@Valid UserVO userVO, BindingResult result, Model model, HttpSession session) {
	if (result.hasFieldErrors("userId")||result.hasFieldErrors("passwd"))  {
	model.addAllAttributes(result.getModel());
	
	return "/board/login";
	}

	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	UserVO loginUser = this.loginService.getUser(userVO.getUserId());

	if(loginUser == null){
	model.addAttribute("userId", "");
	model.addAttribute("msgCode", "등록되지않은 아이디 입니다.");// 등록되지않은 아이디
	return "/board/login";
	}
	else if(passwordEncoder.matches(userVO.getPasswd(), loginUser.getPasswd()) ) {
	model.addAttribute("loginUser", loginUser);
	session.setAttribute("userId", loginUser.getUserId()); //세션에 변수등록
	session.setAttribute("userName", loginUser.getName()); //세션에 변수등록
	return "/board/loginSuccess";
	}
	else {
	model.addAttribute("userId", "");
	model.addAttribute("msgCode", "패스워드가 일치하지 않습니다.");// 패스워드 불일
	return "/board/login";
	}
	}

	@RequestMapping(value="/join",method = RequestMethod.GET)
	public String toLoginView(Model model) {
	model.addAttribute("userVO",new UserVO());
	return "/board/join";
						
	}

	@RequestMapping(value="/join",method = RequestMethod.POST)
	public String onSubmit(@Valid UserVO userVO, BindingResult result, Model model)throws Exception{
		
		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "/board/join";
		}
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hasPass = passwordEncoder.encode(userVO.getPasswd());
		userVO.setPasswd(hasPass);//비밀번호암호화
		
		Path filePath = Paths.get("C:/jj/key3.txt");//암호화를 위한 파일
		String key = Files.readString(filePath);
		
		AES256Util aes256 = new AES256Util(key);
		
		String hasBirthday = aes256.aesEncode(userVO.getBirthday());
		userVO.setBirthday(hasBirthday);//생년월일암호화
		
		if(this.loginService.insertUser(userVO)!=0) {
			model.addAttribute("user",userVO);
			model.addAttribute("msgCode","축하합니다! 회원가입이 완료되었습니다. 로그인 하십시오!");
			return "/board/login";//가입성공시
		}
		else {
			model.addAttribute("msgCode","회원가입이 실패하였습니다. 다시 진행하여주십시오.");
			return "/board/join";//가입실패시
	}
		
}
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)//ID중복체크
	@ResponseBody 
	public String idCheck( HttpServletRequest request){

		String userId = request.getParameter("userId");
		  
		
		JSONObject obj = new JSONObject();
	
		UserVO loginUser = this.loginService.getUser(userId);
	
		if(loginUser != null){
		   obj.put("msg", "false");
		   return obj.toString();
		}
		else {
		   obj.put("msg", "true");
		   return obj.toString();
	
		}
		
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/login";
	}
	

	
	@RequestMapping(value="/editUser",method = RequestMethod.GET)
	public String toUserEditView(HttpSession session, Model model) throws Exception {
		
		String userId = session.getAttribute("userId").toString();
		
		UserVO loginUser = this.loginService.getUser(userId);
		
		if(loginUser == null) {
			model.addAttribute("userId","");
			model.addAttribute("msgCode","등록되지 않은 아이디입니다");
			return "/board/main";
		}
	
	else {
		  
		  Path filePath = Paths.get("C:/jj/Key3.txt");
		  String key = Files.readString(filePath);
		  AES256Util aes256 = new AES256Util(key);
		  
		  String hasBirthday = loginUser.getBirthday();
		  String decBirthday = aes256.aesDecode(hasBirthday);
	      loginUser.setBirthday(decBirthday);
			
			model.addAttribute("userVO",loginUser);
			return "/board/editForm";
	}
}
@RequestMapping(value="/editUser",method = RequestMethod.POST)
public String onEditSave(@Valid UserVO userVO,BindingResult result,Model model)throws Exception{

	
	if(result.hasErrors()) {
		model.addAllAttributes(result.getModel());
		return "/board/editForm";
	}
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	String hashPass = passwordEncoder.encode(userVO.getPasswd());
	userVO.setPasswd(hashPass);
	
	Path filePath = Paths.get("C:/jj/key3.txt");
	String key = Files.readString(filePath);
	
	AES256Util aes256 = new AES256Util(key);
	
	String hasBirthday = aes256.aesEncode(userVO.getBirthday());
	userVO.setBirthday(hasBirthday);
	
	if(this.loginService.updateUser(userVO) !=0) {
		model.addAttribute("user",userVO);
		model.addAttribute("msgCode","사용자 정보가 수정되었습니다");
		return "/board/main";
	}
	else {
		model.addAttribute("msgCode","사용자 정보수정에 실패하였습니다.");
		return "/board/editForm";
	}
}

@RequestMapping(value="/findId",method=RequestMethod.GET)
public String toFindIdForm(Model model) {
	model.addAttribute("user",new UserVO());
	return "/board/findIdForm";
}
@RequestMapping(value="/findId",method=RequestMethod.POST)
public String findIdSubmit(@Valid UserVO userVO,BindingResult result, Model model)throws Exception{
	if(result.hasFieldErrors("name")||result.hasFieldErrors("email")) {
		model.addAllAttributes(result.getModel());
		return "/board/findIdForm";
	}
	
	UserVO userId = this.loginService.findId(userVO.getName(),userVO.getEmail());

		   
	if(userId != null) {
		    model.addAttribute("findUser", userId);
		    return "/board/findIdSuccess";
	}      
	else{
		model.addAttribute("msgCode","이름 또는 이메일이 일치하지 않습니다.");
		return "/board/findIdForm";

	}
}
@RequestMapping(value="/findPass",method = RequestMethod.GET)
public String tofindPass(Model model) {
	model.addAttribute("UserVO",new UserVO());
	return "/board/findPassForm";
}
@RequestMapping(value="/findPass",method=RequestMethod.POST)
public String findPassSubmit(@Valid UserVO UserVO,BindingResult result, Model model)throws Exception{
	if(result.hasFieldErrors("userId")||result.hasFieldErrors("email")) {
		model.addAllAttributes(result.getModel());
		return "/board/findPassForm";
	}

	UserVO findUser = this.loginService.findPass(UserVO.getUserId(),UserVO.getEmail());

	if(findUser != null) {
		    model.addAttribute("findUser", findUser);
		    return "/board/updatePassForm";
	}      
	else{
		model.addAttribute("msgCode","아이디 또는 이메일이 일치하지 않습니다.");
		return "/board/findPassForm";

	}
}

@RequestMapping(value="/updatePass",method = RequestMethod.GET)
public String toupdatePass(Model model) {
	model.addAttribute("UserVO",new UserVO());
	return "/board/updatePassForm";
}
@RequestMapping(value = "/updatePass", method = RequestMethod.POST) 
public String updatePassSubmit(@Valid UserVO UserVO, BindingResult result, Model model)throws Exception {
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	String hasPass = passwordEncoder.encode(UserVO.getPasswd());
	UserVO.setPasswd(hasPass);
	
		if (result.hasFieldErrors("userId") || result.hasFieldErrors("passwd")) {
			model.addAllAttributes(result.getModel());
			return "/board/updatePassForm";
		}
		if (this.loginService.updatePass(UserVO) ==1){
			model.addAttribute("userId", UserVO.getUserId());
			return "/board/updatePassSuccess";
		}
		else {
			model.addAttribute("msgCode","패스워드 변경에 실패하였습니다. 확인후 다시 시도...");
			return "/board/updatePassForm";
		}
	}



	public static final String ONLY_ME = "userid";

@RequestMapping(value="/res",method = RequestMethod.GET)
public String res(@ModelAttribute("SearchVO")SearchVO searchVO,Model model,HttpSession session
		)throws Exception {
	  
	searchVO.setKeyword((String)session.getAttribute("userId"));
	searchVO.setType(ONLY_ME);
	
	
	List<HresVO> hreslist=hresService.getHresList(searchVO);
	model.addAttribute("hresList",hreslist);
	

	 
	   
	
	return "/board/resForm";
	
}
@RequestMapping(value="/review",method = RequestMethod.GET)
public String review(@RequestParam(value = "hno", required = false, defaultValue="0") 
int hno, HttpSession session, Model model) throws Exception {
	   String userId = (String) session.getAttribute("userId"); 
	   String userName = (String) session.getAttribute("userName"); 

	   HalfVO halfVO = halfService.getArticle(hno); 


	   model.addAttribute("half", halfVO);
	   
	   List<HReviewVO> hreviewVO=hreviewService.getHreviewList(hno);	   
	   model.addAttribute("hreviewList",hreviewVO);
	return "/board/review";
}
@RequestMapping(value="/review", method=RequestMethod.POST)
public String reviewProc(@ModelAttribute("HReviewVO") HReviewVO hreviewVO)throws Exception
{
	
	
	String  content = hreviewVO.getContent().replaceAll("<","&lt;");
	content = content.replaceAll(">","&gt;");
	content = content.replaceAll("&","&amp;"); 
	content = content.replaceAll("\"","&quot;"); 
	content = content.replaceAll("\r\n", "<br/>");

	hreviewVO.setContent(content);

	hreviewService.writeReview(hreviewVO);
	
	 int rno = hreviewVO.getRno(); 


	return "/board/main";

}

@RequestMapping(value="/ores",method = RequestMethod.GET)
public String ores(@ModelAttribute("SearchVO")SearchVO searchVO,Model model,HttpSession session)throws Exception {
	  
	searchVO.setKeyword((String)session.getAttribute("userId"));
	searchVO.setType(ONLY_ME);
	
	List<OresVO> oreslist=oresService.getOresList(searchVO);
	model.addAttribute("oresList",oreslist);
	
	return "/board/oresForm";
	
}

@RequestMapping("/hdelete")
public String hDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
String userId = (String) session.getAttribute("userId"); // login 개발뒤 삭제
int rsno = Integer.parseInt(request.getParameter("rsno"));
 String referer = request.getHeader("Referer");


hresService.deleteArticle(rsno);
 

return "redirect:"+ referer;
}

@RequestMapping("/odelete")
public String oDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
String userId = (String) session.getAttribute("userId"); // login 개발뒤 삭제
int rsno = Integer.parseInt(request.getParameter("rsno"));
String referer = request.getHeader("Referer");

oresService.deleteArticle(rsno);

return "redirect:"+referer ;
}
@RequestMapping(value="/oreview",method = RequestMethod.GET)
public String oreview(@RequestParam(value="ono", required = false, defaultValue="0") 
int ono, HttpSession session, Model model) throws Exception {
	   String userId = (String) session.getAttribute("userId"); 
	   String userName = (String) session.getAttribute("userName"); 

	  OneVO oneVO = oneService.getArticle(ono); 


	   model.addAttribute("one", oneVO);
	   
	   List<OReviewVO> oreviewVO=oreviewService.getOreviewList(ono);	   
	   model.addAttribute("oreviewList",oreviewVO);
	return "/board/oreview";
}

@RequestMapping(value="/oreview", method=RequestMethod.POST)
public String oreviewProc(@ModelAttribute("OReviewVO") OReviewVO oreviewVO)throws Exception
{
	
	
	String  content = oreviewVO.getContent().replaceAll("<","&lt;");
	content = content.replaceAll(">","&gt;");
	content = content.replaceAll("&","&amp;"); 
	content = content.replaceAll("\"","&quot;"); 
	content = content.replaceAll("\r\n", "<br/>");

	oreviewVO.setContent(content);

	oreviewService.writeReview(oreviewVO);
	
	 int orno = oreviewVO.getOrno(); 


	return "/board/main";

}
}




	