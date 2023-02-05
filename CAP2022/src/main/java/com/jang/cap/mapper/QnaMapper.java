package com.jang.cap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.QnaVO;

@Mapper
public interface QnaMapper {

	int writeQna(QnaVO qnaVO);
	int updateQna(QnaVO qnaVO);
	
	
	
}
