package com.jang.cap.service;

import java.util.List;

import com.jang.cap.model.HReviewVO;

public interface HreviewService {

	
	List<HReviewVO> getHreviewList(int hno);
	HReviewVO getReview(int rno);
	int writeReview(HReviewVO review);
	int updateReview(HReviewVO review);
	int deleteReview(int rno);
}
