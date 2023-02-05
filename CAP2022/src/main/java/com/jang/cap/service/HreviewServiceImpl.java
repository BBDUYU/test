package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.HReviewMapper;
import com.jang.cap.model.HReviewVO;

@Service(value="hreviewService")
public class HreviewServiceImpl implements HreviewService {
	@Autowired HReviewMapper hreviewMapper;

	@Override
	public List<HReviewVO> getHreviewList(int hno) {
		// TODO Auto-generated method stub
		return this.hreviewMapper.getHreviewList(hno);
	}

	@Override
	public HReviewVO getReview(int rno) {
		// TODO Auto-generated method stub
		return this.hreviewMapper.getReview(rno);
	}

	@Override
	public int writeReview(HReviewVO review) {
		int hno = review.getHno();
	    return this.hreviewMapper.writeReview(review);

	}

	@Override
	public int updateReview(HReviewVO review) {
		// TODO Auto-generated method stub
		   return this.hreviewMapper.updateReview(review);
	}

	@Override
	public int deleteReview(int rno) {
		// TODO Auto-generated method stub
		   return this.hreviewMapper.deleteReview(rno);
	}

}
