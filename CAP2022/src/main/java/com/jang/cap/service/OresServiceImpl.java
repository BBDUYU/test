package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.OresMapper;
import com.jang.cap.model.OresVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.utils.PageHelper;

@Service(value="oresService")

public class OresServiceImpl implements OresService {
	
	@Autowired OresMapper oresMapper;
	PageHelper pageHelper = new PageHelper();

	@Override
	public List<OresVO> getOresList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	     int startRow = (currentPage - 1) *  pageHelper.getPageSize()+1;
		 int endRow   = currentPage * pageHelper.getPageSize();
			  searchVO.setStartRow(startRow);
			    searchVO.setEndRow(endRow);
		return this.oresMapper.getOresList(searchVO);
	}

	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		int totalRow = oresMapper.getTotalRow(searchVO);
	     return pageHelper.getPageUrl(searchVO, totalRow);
	}

	@Override
	public OresVO getArticle(int rsno) {
		return this.oresMapper.getArticle(rsno);

	}

	@Override
	public int writeArticle(OresVO ores) {
		return oresMapper.writeArticle(ores);

	}

	@Override
	public int deleteArticle(int rsno) {
		return oresMapper.deleteArticle(rsno);

	}

}
