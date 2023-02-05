package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.HalfVO;
import com.jang.cap.model.SearchVO;

@Mapper
public interface HalfMapper {
	
	List<HalfVO> getHalfList(SearchVO searchVO);
	
	HalfVO getArticle(int hno); 
	
	int writeArticle(HalfVO half);
	int updateArticle(HalfVO half);
	int deleteArticle(int hno);

	int getTotalRow(SearchVO searchVO);
	
}
