package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.SearchVO;
import com.jang.cap.model.WishVO;

public interface WishService {
	List<WishVO> getWishList(SearchVO searchVO);
    WishVO getArticle(int wno);//글조회

	
	int incGoodCnt(int hno); //좋아요 증가
	int deleteGoodCnt(int wno);//좋아요 삭제
	
	int addWishLike(WishVO wish);
	int getWishLike(WishVO wish);
	
    StringBuffer getPageUrl( SearchVO searchVO);  // 페이지 표시작성  메서드 추가 

}
