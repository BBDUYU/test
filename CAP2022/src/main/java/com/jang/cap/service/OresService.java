package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.OresVO;
import com.jang.cap.model.SearchVO;

public interface OresService {
	List<OresVO> getOresList(SearchVO searchVO);
	StringBuffer getPageUrl( SearchVO searchVO);

	
	OresVO getArticle(int rsno);

	int writeArticle(OresVO ores);
	
	int deleteArticle(int rsno);

}
