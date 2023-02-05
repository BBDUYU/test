package com.jang.cap.service;

import org.apache.ibatis.annotations.Param;

import com.jang.cap.model.QnaVO;

public interface QnaService {
	
	int writeQna(QnaVO qnaVO);
	int updateQna(QnaVO qnaVO);
	
}
