package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.HalfMapper;
import com.jang.cap.model.HalfVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.utils.PageHelper;

@Service(value="halfService")
public class HalfServiceImpl implements HalfService {

	@Autowired
	private HalfMapper halfMapper;
	
	PageHelper pageHelper = new PageHelper();

	
	@Override
	public HalfVO getArticle(int hno) {
		// TODO Auto-generated method stub
		return this.halfMapper.getArticle(hno);
	}

	@Override
	public List<HalfVO> getHalfList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	     int startRow = (currentPage - 1) *  pageHelper.getPageSize()+1;
		 int endRow   = currentPage * pageHelper.getPageSize();
			  searchVO.setStartRow(startRow);
			    searchVO.setEndRow(endRow);

			    return this.halfMapper.getHalfList(searchVO);
	}

	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		int totalRow = halfMapper.getTotalRow(searchVO);
	     return pageHelper.getPageUrl(searchVO, totalRow);
	}

	@Override
	public int writeArticle(HalfVO half) {
		// TODO Auto-generated method stub
		return halfMapper.writeArticle(half);
	}

	@Override
	public int updateArticle(HalfVO half) {
		// TODO Auto-generated method stub
	    return this.halfMapper.updateArticle(half);
	}

	@Override
	public int deleteArticle(int hno) {
		// TODO Auto-generated method stub
	    return this.halfMapper.deleteArticle(hno);

	}

}
