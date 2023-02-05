package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.OresVO;
import com.jang.cap.model.SearchVO;

@Mapper
public interface OresMapper {

	List<OresVO> getOresList(SearchVO searchVO);
	
	OresVO getArticle(int rsno);
	
	int writeArticle(OresVO ores);
	int deleteArticle(int rsno);
	
	int getTotalRow(SearchVO searchVO);

}
