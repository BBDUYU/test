package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.HalfVO;
import com.jang.cap.model.HresVO;
import com.jang.cap.model.SearchVO;

public interface HresService {
	List<HresVO> getHresList(SearchVO searchVO);
	StringBuffer getPageUrl( SearchVO searchVO);

	
	HresVO getArticle(int rsno);

	int writeArticle(HresVO hres);
	
	int deleteArticle(int rsno);

}
