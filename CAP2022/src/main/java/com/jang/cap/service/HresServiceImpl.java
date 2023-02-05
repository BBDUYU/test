package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.HresMapper;
import com.jang.cap.model.HresVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.utils.PageHelper;

@Service(value="hresService")
public class HresServiceImpl implements HresService {

	@Autowired HresMapper hresMapper;
	PageHelper pageHelper = new PageHelper();

	@Override
	public List<HresVO> getHresList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	     int startRow = (currentPage - 1) *  pageHelper.getPageSize()+1;
		 int endRow   = currentPage * pageHelper.getPageSize();
			  searchVO.setStartRow(startRow);
			    searchVO.setEndRow(endRow);
		return this.hresMapper.getHresList(searchVO);
	}

	@Override
	public int writeArticle(HresVO hres) {
		// TODO Auto-generated method stub
		return hresMapper.writeArticle(hres);
	}

	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		int totalRow = hresMapper.getTotalRow(searchVO);
	     return pageHelper.getPageUrl(searchVO, totalRow);
	}

	@Override
	public HresVO getArticle(int rsno) {
		// TODO Auto-generated method stub
		return this.hresMapper.getArticle(rsno);
	}

	@Override
	public int deleteArticle(int rsno) {
		// TODO Auto-generated method stub
	    return this.hresMapper.deleteArticle(rsno);
	}
	
	

}
