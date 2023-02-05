package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.OReviewVO;


@Mapper
public interface OReviewMapper {

	
	List<OReviewVO> getOreviewList(int ono);
	OReviewVO getReview(int orno);
	int writeReview(OReviewVO review);
	int updateReview(OReviewVO review);
	int deleteReview(int orno);
}
