package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.HReviewVO;

@Mapper
public interface HReviewMapper {

	
	List<HReviewVO> getHreviewList(int hno);
	HReviewVO getReview(int rno);
	int writeReview(HReviewVO review);
	int updateReview(HReviewVO review);
	int deleteReview(int rno);
}
