package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.OReviewVO;

public interface OReviewService {

	
	List<OReviewVO> getOreviewList(int ono);
	OReviewVO getReview(int orno);
	int writeReview(OReviewVO review);
	int updateReview(OReviewVO review);
	int deleteReview(int orno);
}
