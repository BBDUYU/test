package com.jang.cap.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jang.cap.model.HReviewVO;
import com.jang.cap.model.HalfVO;
import com.jang.cap.model.HresVO;
import com.jang.cap.model.OReviewVO;
import com.jang.cap.model.OWishVO;
import com.jang.cap.model.OneVO;
import com.jang.cap.model.OresVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.model.WishVO;
import com.jang.cap.service.HalfService;
import com.jang.cap.service.HresService;
import com.jang.cap.service.HreviewService;
import com.jang.cap.service.OReviewService;
import com.jang.cap.service.OneService;
import com.jang.cap.service.OresService;
import com.jang.cap.service.OwishService;
import com.jang.cap.service.WishService;


@Controller
@RequestMapping("/board")

public class MainController {
	
	@Autowired
	private HalfService halfService;
	@Autowired
	private HresService hresService;
	@Autowired
	private HreviewService hreviewService;
	@Autowired
	private OneService oneService;
	@Autowired
	private OresService oresService;
	@Autowired
	private WishService wishService;
	@Autowired
	private OwishService owishService;
	@Autowired
	private OReviewService oreviewService;
	
	@RequestMapping(value="/main",method = RequestMethod.GET)
	 public String main() {
		return "/board/main";
	}
	
	@RequestMapping(value="/hboard",method = RequestMethod.GET)
	 public String hboard(@ModelAttribute("SearchVO")SearchVO searchVO,Model model,HttpSession session)throws Exception {
		  
		
		  List<HalfVO> hlist=halfService.getHalfList(searchVO);
	      model.addAttribute("hList",hlist);
	      
	      StringBuffer pageUrl=halfService.getPageUrl(searchVO);
	      model.addAttribute("pageHttp",pageUrl);
	      
	      
	      
		return "/board/HBoard";
	}
	
	@RequestMapping(value="/hForm",method = RequestMethod.GET)
	public String hForm() {
		
		return "/board/hForm";
	}
	
	 @RequestMapping(value="/hForm", method=RequestMethod.POST)
	   public String hboardWriteProc(@ModelAttribute("HalfVO") HalfVO halfVO, 
	           MultipartHttpServletRequest mrequest){
	   
	      //새 글저장
	      String time =  halfVO.getTime().replaceAll("\r\n", "<br/>");//java새줄 코드 HTML줄바꾸기로
	      time = time.replaceAll("<","&lt;");
	      time = time.replaceAll(">","&gt;");
	      time = time.replaceAll("&","&amp;"); 
	      time = time.replaceAll("\"","&quot;");
	      
	      String cancel =  halfVO.getCancel().replaceAll("\r\n", "<br />");//java새줄 코드 HTML줄바꾸기로
	      cancel = cancel.replaceAll("<","&lt;");
	      cancel = cancel.replaceAll(">","&gt;");
	      cancel = cancel.replaceAll("&","&amp;"); 
	      cancel = cancel.replaceAll("\"","&quot;");
		  
	      halfVO.setTime(time);
	      halfVO.setCancel(cancel);

	   
	   halfService.writeArticle(halfVO);
	   
	   int hno = halfVO.getHno(); 
	 
	   return "redirect:HBoard";
	 }
	 
	 @RequestMapping("/hview")
	 public String hView(@RequestParam(value = "hno", required = false, defaultValue="0") 
	 int hno, HttpSession session, Model model) throws Exception {

	   String userId = (String) session.getAttribute("userId"); 

	     

	   HalfVO halfVO = halfService.getArticle(hno); 


	   model.addAttribute("half", halfVO);
	   
	   List<HReviewVO> hreviewVO=hreviewService.getHreviewList(hno);	   
	   model.addAttribute("hreviewList",hreviewVO);

	   return "/board/hview";
	 }


     
     
   
     
     
     

        @RequestMapping(value="/hpay",method = RequestMethod.GET)
         public String pay(@RequestParam(value = "rsno", required = false, defaultValue="0") int rsno, HttpSession session, Model model) throws Exception {

        	
           HresVO hresVO = hresService.getArticle(rsno);
      	   model.addAttribute("hres", hresVO);

            return "/board/hpay";
        }


        
        @RequestMapping(value="/write", method=RequestMethod.GET)
        public String hwrite() {
           return "/board/halfReg";
           
        }
        @RequestMapping(value="/write", method=RequestMethod.POST)
        public String hwirteproc(@ModelAttribute("HalfVO") HalfVO halfVO, HttpSession session, Model model,
                MultipartHttpServletRequest mRequest) throws Exception{
           

        	String  content = halfVO.getContent().replaceAll("<","&lt;");
			content = content.replaceAll(">","&gt;");
			content = content.replaceAll("&","&amp;"); 
			content = content.replaceAll("\"","&quot;"); 
			content = content.replaceAll("\r\n", "<br/>");
			
			String  cancel = halfVO.getCancel().replaceAll("<","&lt;");
			cancel = cancel.replaceAll(">","&gt;");
			cancel = cancel.replaceAll("&","&amp;"); 
			cancel = cancel.replaceAll("\"","&quot;"); 
			cancel = cancel.replaceAll("\r\n", "<br/>");
			
			String  time = halfVO.getTime().replaceAll("<","&lt;");
			time = time.replaceAll(">","&gt;");
			time = time.replaceAll("&","&amp;"); 
			time = time.replaceAll("\"","&quot;"); 
			time = time.replaceAll("\r\n", "<br/>");
			
			 halfVO.setContent(content);
			 halfVO.setCancel(cancel);
			 halfVO.setTime(time);
        	
           ServletContext servletContext=mRequest.getSession().getServletContext();
           String webappRoot=servletContext.getRealPath("/");
           String relativeFolder=File.separator+"resources"+File.separator+"images"+File.separator;
           
           
           List<MultipartFile> fileList=mRequest.getFiles("file_1");
           List<MultipartFile> img1List=mRequest.getFiles("img_1");
           List<MultipartFile> img2List=mRequest.getFiles("img_2");
           
           for (MultipartFile mf : fileList){
        	   if(!mf.isEmpty()) {
        		   
        		   String originFileName=mf.getOriginalFilename();
        		   long fileSize=mf.getSize();
        		   
        		   halfVO.setPicture(originFileName);
        		   System.out.println("New Pic="+halfVO.getPicture());
        		   
        		   String safeFile=webappRoot + relativeFolder + originFileName;
        		   
        		   try {
        			   mf.transferTo(new File(safeFile));
        		   }catch(IllegalStateException e) {
        			   e.printStackTrace();
        		   }catch(IOException e) {
        			   e.printStackTrace();
        		   }
        	   }
           }
           for (MultipartFile mf : img1List){
        	   if(!mf.isEmpty()) {
        		   
        		   String originFileName=mf.getOriginalFilename();
        		   long fileSize=mf.getSize();
        		   
        		   halfVO.setImg1(originFileName);
        		   System.out.println("New Pic="+halfVO.getImg1());
        		   
        		   String safeFile=webappRoot+relativeFolder+originFileName;
        		   
        		   try {
        			   mf.transferTo(new File(safeFile));
        		   }catch(IllegalStateException e) {
        			   e.printStackTrace();
        		   }catch(IOException e) {
        			   e.printStackTrace();
        		   }
        	   }
           }
           for (MultipartFile mf : img2List){
        	   if(!mf.isEmpty()) {
        		   
        		   String originFileName=mf.getOriginalFilename();
        		   long fileSize=mf.getSize();
        		   
        		   halfVO.setImg2(originFileName);
        		   System.out.println("New Pic="+halfVO.getImg2());
        		   
        		   String safeFile=webappRoot+relativeFolder+originFileName;
        		   
        		   try {
        			   mf.transferTo(new File(safeFile));
        		   }catch(IllegalStateException e) {
        			   e.printStackTrace();
        		   }catch(IOException e) {
        			   e.printStackTrace();
        		   }
        	   }
           }
           if(this.halfService.writeArticle(halfVO)!=0) {
        	   model.addAttribute("halfVO",halfVO);
        	   model.addAttribute("msgCode","등록되었습니다");
        	   return "redirect:hboard";
           }
           else {
        	   model.addAttribute("msgCode","등록에 실패했습니다");
        	   return "halfReg";
           }


        }
        @RequestMapping(value="/owrite", method=RequestMethod.GET)
        public String owrite() {
           return "/board/oneReg";
           
        }
        @RequestMapping(value="/owrite", method=RequestMethod.POST)
        public String owirteproc(@ModelAttribute("OneVO") OneVO oneVO, HttpSession session, Model model,
                MultipartHttpServletRequest mRequest) throws Exception{
           
        	String  content = oneVO.getContent().replaceAll("<","&lt;");
			content = content.replaceAll(">","&gt;");
			content = content.replaceAll("&","&amp;"); 
			content = content.replaceAll("\"","&quot;"); 
			content = content.replaceAll("\r\n", "<br/>");
			
			String  time1 = oneVO.getTime1().replaceAll("<","&lt;");
			time1 = time1.replaceAll(">","&gt;");
			time1 = time1.replaceAll("&","&amp;"); 
			time1 = time1.replaceAll("\"","&quot;"); 
			time1 = time1.replaceAll("\r\n", "<br/>");
			
			String  time2 = oneVO.getTime2().replaceAll("<","&lt;");
			time2 = time2.replaceAll(">","&gt;");
			time2 = time2.replaceAll("&","&amp;"); 
			time2 = time2.replaceAll("\"","&quot;"); 
			time2 = time2.replaceAll("\r\n", "<br/>");
			
			String  cancel = oneVO.getCancel().replaceAll("<","&lt;");
			cancel = cancel.replaceAll(">","&gt;");
			cancel = cancel.replaceAll("&","&amp;"); 
			cancel = cancel.replaceAll("\"","&quot;"); 
			cancel = cancel.replaceAll("\r\n", "<br/>");
			
		      oneVO.setContent(content);
		      oneVO.setTime1(time1);
		      oneVO.setTime2(time2);
		      oneVO.setCancel(cancel);

           ServletContext servletContext=mRequest.getSession().getServletContext();
           String webappRoot=servletContext.getRealPath("/");
           String relativeFolder=File.separator+"resources"+File.separator+"images"+File.separator;
           
           
           List<MultipartFile> fileList=mRequest.getFiles("file_1");
           List<MultipartFile> img1List=mRequest.getFiles("img_1");
           List<MultipartFile> img2List=mRequest.getFiles("img_2");
           
           for (MultipartFile mf : fileList){
        	   if(!mf.isEmpty()) {
        		   
        		   String originFileName=mf.getOriginalFilename();
        		   long fileSize=mf.getSize();
        		   
        		   oneVO.setPicture(originFileName);
        		   System.out.println("New Pic="+oneVO.getPicture());
        		   
        		   String safeFile=webappRoot + relativeFolder + originFileName;
        		   
        		   try {
        			   mf.transferTo(new File(safeFile));
        		   }catch(IllegalStateException e) {
        			   e.printStackTrace();
        		   }catch(IOException e) {
        			   e.printStackTrace();
        		   }
        	   }
           }
           for (MultipartFile mf : img1List){
        	   if(!mf.isEmpty()) {
        		   
        		   String originFileName=mf.getOriginalFilename();
        		   long fileSize=mf.getSize();
        		   
        		   oneVO.setImg1(originFileName);
        		   System.out.println("New Pic="+oneVO.getImg1());
        		   
        		   String safeFile=webappRoot+relativeFolder+originFileName;
        		   
        		   try {
        			   mf.transferTo(new File(safeFile));
        		   }catch(IllegalStateException e) {
        			   e.printStackTrace();
        		   }catch(IOException e) {
        			   e.printStackTrace();
        		   }
        	   }
           }
           for (MultipartFile mf : img2List){
        	   if(!mf.isEmpty()) {
        		   
        		   String originFileName=mf.getOriginalFilename();
        		   long fileSize=mf.getSize();
        		   
        		   oneVO.setImg2(originFileName);
        		   System.out.println("New Pic="+oneVO.getImg2());
        		   
        		   String safeFile=webappRoot+relativeFolder+originFileName;
        		   
        		   try {
        			   mf.transferTo(new File(safeFile));
        		   }catch(IllegalStateException e) {
        			   e.printStackTrace();
        		   }catch(IOException e) {
        			   e.printStackTrace();
        		   }
        	   }
           }
           if(this.oneService.writeArticle(oneVO)!=0) {
        	   model.addAttribute("halfVO",oneVO);
        	   model.addAttribute("msgCode","등록되었습니다");
        	   return "redirect:oboard";
           }
           else {
        	   model.addAttribute("msgCode","등록에 실패했습니다");
        	   return "oneReg";
           }


        }
        @RequestMapping(value="/hreserve",method = RequestMethod.GET)
        public String hreserve(@RequestParam(value = "hno", required = false, defaultValue="0") 
       	 int hno, HttpSession session, Model model) throws Exception {

     	     

     	   HalfVO halfVO = halfService.getArticle(hno); 


     	   model.addAttribute("half", halfVO);
     	   model.addAttribute("hreserveVO",new HresVO());
     	  
       	
           return "/board/hreserve";
       }
        @RequestMapping(value="/hreserve", method=RequestMethod.POST)
        public String hreserveproc(@ModelAttribute("HresVO") HresVO hresVO,Model model) throws Exception{
        	

        	
        	
           hresService.writeArticle(hresVO);
           


           int rsno = hresVO.getRsno();
     	   model.addAttribute("hres", hresVO);


        return "/board/hresSuccess";

        
        }
        
        @RequestMapping(value="/oboard",method = RequestMethod.GET)
      	 public String oboard(@ModelAttribute("SearchVO")SearchVO searchVO,Model model,HttpSession session)throws Exception {
      		  
      		
      		  List<OneVO> olist=oneService.getOneList(searchVO);
      	      model.addAttribute("oList",olist);
      	      
      	      StringBuffer pageUrl=oneService.getPageUrl(searchVO);
      	      model.addAttribute("pageHttp",pageUrl);
      	      
      		return "/board/OBoard";
      	}
      	
       	@RequestMapping("/oview")
      	 public String oView(@RequestParam(value = "ono", required = false, defaultValue="0") 
      	 int ono, HttpSession session, Model model) throws Exception {

      	   String userId = (String) session.getAttribute("userId"); 

      	     

      	   OneVO oneVO = oneService.getArticle(ono); 

      	   List<OReviewVO> oreviewVO=oreviewService.getOreviewList(ono);	   
      	   model.addAttribute("oreviewList",oreviewVO);
      	   model.addAttribute("one", oneVO);

      	   return "/board/oview";
      	 }

           
           @RequestMapping(value="/oreserve",method = RequestMethod.GET)
           public String oreserve(@RequestParam(value="ono", required = false, defaultValue="0") 
          	 int ono, HttpSession session, Model model) throws Exception {

        	     

        	   OneVO oneVO = oneService.getArticle(ono); 


        	   model.addAttribute("one", oneVO);
        	   model.addAttribute("oreserveVO",new OresVO());
        	  
          	
              return "/board/oreserve";
          }
           
           @RequestMapping(value="/oreserve", method=RequestMethod.POST)
           public String oreserveproc(@ModelAttribute("OresVO") OresVO oresVO,Model model) throws Exception{
           	

           	
           	
              oresService.writeArticle(oresVO);
              


              int rsno = oresVO.getRsno();
        	   model.addAttribute("ores", oresVO);


           return "/board/oresSuccess";

           }
           @RequestMapping(value="/opay",method = RequestMethod.GET)
           public String opay(@RequestParam(value = "rsno", required = false, defaultValue="0") int rsno, HttpSession session, Model model) throws Exception {

          	
             OresVO oresVO = oresService.getArticle(rsno);
        	   model.addAttribute("ores", oresVO);

              return "/board/opay";
          }
           
       	public static final String ONLY_ME = "userid";

       	@RequestMapping(value="/wishlist",method = RequestMethod.GET)
       	 public String wishlist(@ModelAttribute("SearchVO")SearchVO searchVO,Model model,HttpSession session)throws Exception {
       		
       		searchVO.setKeyword((String)session.getAttribute("userId"));
			searchVO.setType(ONLY_ME);
			
      		 List<WishVO> wlist=wishService.getWishList(searchVO);
     	      model.addAttribute("wList",wlist);
     	      
     	      
     	     
     	      
     	     List<HalfVO> hlist=halfService.getHalfList(searchVO);
   	      model.addAttribute("hList",hlist);
     	     
     	    
       		return "/board/wishlist";
       	}
       	@RequestMapping(value="/wish", method=RequestMethod.POST)
        public String wish(HttpServletRequest request, Model model, HttpSession session, RedirectAttributes rea){
       		
     	  

       		
       		int hno = Integer.parseInt(request.getParameter("hno")); 

       		       		
       		String img1 = (String)(request.getParameter("img1"));
       		String price = (String)(request.getParameter("price"));
       		String name = (String)(request.getParameter("name"));
       		
       		String userId = (String) session.getAttribute("userId"); 

            
            WishVO wishVO=new WishVO();
            wishVO.setHno(hno);
            wishVO.setUserid(userId);
            
            wishVO.setImg1(img1);
            wishVO.setPrice(price);
            wishVO.setName(name);

            HalfVO half = halfService.getArticle(hno);

            if (wishService.getWishLike(wishVO) == 0 ) {  //이미 추천한 기록이 없으면
            	
            	wishService.addWishLike(wishVO);         //추천 기록 등록
            }else {
            	rea.addAttribute("errCode", "2");           //이미 추천했던 글이면 추천 불가 
                 }
            rea.addAttribute("hno", hno);

            
            return "redirect:/board/hview";
        }
       	@RequestMapping(value="/bwish", method=RequestMethod.POST)
        public String bwish(HttpServletRequest request, Model model, HttpSession session, RedirectAttributes rea){
       		
     	  

       		
       		int hno = Integer.parseInt(request.getParameter("hno")); 

       		       		
       		String img1 = (String)(request.getParameter("img1"));
       		String price = (String)(request.getParameter("price"));
       		String name = (String)(request.getParameter("name"));
       		
       		String userId = (String) session.getAttribute("userId"); 

            
            WishVO wishVO=new WishVO();
            wishVO.setHno(hno);
            wishVO.setUserid(userId);
            
            wishVO.setImg1(img1);
            wishVO.setPrice(price);
            wishVO.setName(name);

            HalfVO half = halfService.getArticle(hno);

            if (wishService.getWishLike(wishVO) == 0 ) {  //이미 추천한 기록이 없으면
            	
            	wishService.addWishLike(wishVO);         //추천 기록 등록
            }else {
            	rea.addAttribute("errCode", "2");           //이미 추천했던 글이면 추천 불가 
            	
            }
            rea.addAttribute("hno", hno);

            
            return "redirect:/board/hboard";
        }
       	
        @RequestMapping("/deletewish")
 	   public String wishDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
 	   String userId = (String) session.getAttribute("userId"); // login 개발뒤 삭제
 	   String referer = request.getHeader("Referer");
 	   
 	   int wno = Integer.parseInt(request.getParameter("wno"));
 
 		 	   //board 삭제
 	   wishService.deleteGoodCnt(wno);

   	return "redirect:"+ referer;
 	   }
        @RequestMapping(value="/owish", method=RequestMethod.POST)
        public String owish(HttpServletRequest request, Model model, HttpSession session, RedirectAttributes rea){
       		
     	  

       		
       		int ono = Integer.parseInt(request.getParameter("ono")); 

       		       		
       		String img1 = (String)(request.getParameter("img1"));
       		String price = (String)(request.getParameter("price"));
       		String name = (String)(request.getParameter("name"));
       		
       		String userId = (String) session.getAttribute("userId"); 

            
            OWishVO owishVO=new OWishVO();
            owishVO.setOno(ono);
            owishVO.setUserid(userId);
            
            owishVO.setImg1(img1);
            owishVO.setPrice(price);
            owishVO.setName(name);

            OneVO one = oneService.getArticle(ono);

            if (owishService.getWishLike(owishVO) == 0 ) {  //이미 추천한 기록이 없으면
            	
            	owishService.addWishLike(owishVO);         //추천 기록 등록
            }else {
            	rea.addAttribute("errCode", "2");           //이미 추천했던 글이면 추천 불가 
                 }
            rea.addAttribute("ono", ono);

            
            return "redirect:/board/oview";
        }
     	@RequestMapping(value="/obwish", method=RequestMethod.POST)
        public String obwish(HttpServletRequest request, Model model, HttpSession session, RedirectAttributes rea){
       		
     	  

       		
       		int ono = Integer.parseInt(request.getParameter("ono")); 

       		       		
       		String img1 = (String)(request.getParameter("img1"));
       		String price = (String)(request.getParameter("price"));
       		String name = (String)(request.getParameter("name"));
       		
       		String userId = (String) session.getAttribute("userId"); 

            
            OWishVO owishVO=new OWishVO();
            owishVO.setOno(ono);
            owishVO.setUserid(userId);
            
            owishVO.setImg1(img1);
            owishVO.setPrice(price);
            owishVO.setName(name);

            OneVO one = oneService.getArticle(ono);

            if (owishService.getWishLike(owishVO) == 0 ) {  //이미 추천한 기록이 없으면
            	
            	owishService.addWishLike(owishVO);         //추천 기록 등록
            }else {
            	rea.addAttribute("errCode", "2");           //이미 추천했던 글이면 추천 불가 
            	
            }
            rea.addAttribute("ono", ono);

            
            return "redirect:/board/oboard";
        }
     	  @RequestMapping("/odeletewish")
    	   public String owishDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea){
    	   String userId = (String) session.getAttribute("userId"); // login 개발뒤 삭제
    	  String referer = request.getHeader("Referer");
    	   
    	   int owno = Integer.parseInt(request.getParameter("owno"));
    
    		 	   //board 삭제
    	   owishService.deleteGoodCnt(owno);

      	return "redirect:"+ referer;
    	   }
       	
}

	
	
	
