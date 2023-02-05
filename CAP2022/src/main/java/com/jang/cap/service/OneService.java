package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.OneVO;
import com.jang.cap.model.SearchVO;

public interface OneService {
	List<OneVO> getOneList(SearchVO searchVO);
	StringBuffer getPageUrl( SearchVO searchVO);
	
	OneVO getArticle(int ono);
	
	int writeArticle(OneVO one);
	int updateArticle(OneVO one);
	
	int deleteArticle(int ono);
}
