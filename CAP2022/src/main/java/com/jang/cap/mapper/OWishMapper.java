package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.OWishVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.model.WishVO;



@Mapper
public interface OWishMapper {
    OWishVO getArticle(int owno);//글조회

	List<OWishVO> getWishList(SearchVO searchVO);

	
	
	int incGoodCnt(int ono); //좋아요 증가
	int deleteGoodCnt(int owno);//좋아요 삭제
	
	int addWishLike(OWishVO wish);
	int getWishLike(OWishVO wish);
	
	int getTotalRow(SearchVO searchVO);

}
