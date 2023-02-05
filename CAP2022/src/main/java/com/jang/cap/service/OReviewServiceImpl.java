package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.OReviewMapper;
import com.jang.cap.model.OReviewVO;

@Service(value="oreviewService")
public class OReviewServiceImpl implements OReviewService {
	@Autowired OReviewMapper oreviewMapper;
	
	@Override
	
	public List<OReviewVO> getOreviewList(int ono) {
		return this.oreviewMapper.getOreviewList(ono);
	}

	@Override
	public OReviewVO getReview(int orno) {
		return this.oreviewMapper.getReview(orno);

	}

	@Override
	public int writeReview(OReviewVO review) {
		int ono = review.getOno();
		return this.oreviewMapper.writeReview(review);

	}

	@Override
	public int updateReview(OReviewVO review) {
		   return this.oreviewMapper.updateReview(review);
			}

	@Override
	public int deleteReview(int orno) {
		   return this.oreviewMapper.deleteReview(orno);

	}

}
