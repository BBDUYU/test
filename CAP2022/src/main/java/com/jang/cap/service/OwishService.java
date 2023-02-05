package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.OWishVO;
import com.jang.cap.model.SearchVO;


public interface OwishService {
	List<OWishVO> getWishList(SearchVO searchVO);
    OWishVO getArticle(int owno);//글조회

	
	int incGoodCnt(int ono); //좋아요 증가
	int deleteGoodCnt(int owno);//좋아요 삭제
	
	int addWishLike(OWishVO owish);
	int getWishLike(OWishVO owish);
	
    StringBuffer getPageUrl( SearchVO searchVO);  // 페이지 표시작성  메서드 추가 

}

