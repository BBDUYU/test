package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.OneVO;
import com.jang.cap.model.SearchVO;

@Mapper
public interface OneMapper {
	
	List<OneVO> getOneList(SearchVO searchVO);
	
	OneVO getArticle(int ono); 
	
	int writeArticle(OneVO one);
	int updateArticle(OneVO one);
	int deleteArticle(int ono);

	int getTotalRow(SearchVO searchVO);
	
}
