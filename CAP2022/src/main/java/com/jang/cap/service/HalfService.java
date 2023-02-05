package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.HalfVO;
import com.jang.cap.model.SearchVO;

public interface HalfService {
	List<HalfVO> getHalfList(SearchVO searchVO);
	StringBuffer getPageUrl( SearchVO searchVO);
	
	HalfVO getArticle(int hno);
	
	int writeArticle(HalfVO half);
	int updateArticle(HalfVO half);
	
	int deleteArticle(int hno);
}
