package com.jang.cap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.QnaMapper;
import com.jang.cap.model.QnaVO;

@Service(value = "qnaService")
public class QnaServiceImpl implements QnaService {

	 @Autowired
	  private QnaMapper qnaMapper;
	
	@Override
	public int writeQna(QnaVO qnaVO) {
		// TODO Auto-generated method stub
		return qnaMapper.writeQna(qnaVO);
	}

	@Override
	public int updateQna(QnaVO qnaVO) {
		// TODO Auto-generated method stub
		return qnaMapper.updateQna(qnaVO);
	}

	
}
