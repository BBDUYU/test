package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.HresVO;
import com.jang.cap.model.SearchVO;

@Mapper
public interface HresMapper {

	List<HresVO> getHresList(SearchVO searchVO);
	
	HresVO getArticle(int rsno);
	
	int writeArticle(HresVO hres);
	int deleteArticle(int rsno);
	
	int getTotalRow(SearchVO searchVO);

}
