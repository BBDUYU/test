package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.BoardVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.model.WishVO;

@Mapper
public interface WishMapper {
    WishVO getArticle(int wno);//글조회

	List<WishVO> getWishList(SearchVO searchVO);

	
	
	int incGoodCnt(int hno); //좋아요 증가
	int deleteGoodCnt(int wno);//좋아요 삭제
	
	int addWishLike(WishVO wish);
	int getWishLike(WishVO wish);
	
	int getTotalRow(SearchVO searchVO);

}
