package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.OneMapper;
import com.jang.cap.model.OneVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.utils.PageHelper;

@Service(value="oneService")
public class OneServiceImpl implements OneService {

	@Autowired
	private OneMapper oneMapper;
	PageHelper pageHelper = new PageHelper();
	
	@Override
	public List<OneVO> getOneList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	     int startRow = (currentPage - 1) *  pageHelper.getPageSize()+1;
		 int endRow   = currentPage * pageHelper.getPageSize();
			  searchVO.setStartRow(startRow);
			    searchVO.setEndRow(endRow);

			    return this.oneMapper.getOneList(searchVO);
	}

	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		int totalRow = oneMapper.getTotalRow(searchVO);
	     return pageHelper.getPageUrl(searchVO, totalRow);
	}

	@Override
	public OneVO getArticle(int ono) {
		return this.oneMapper.getArticle(ono);

	}

	@Override
	public int writeArticle(OneVO one) {
		return this.oneMapper.writeArticle(one);

	}

	@Override
	public int updateArticle(OneVO one) {
		return this.oneMapper.updateArticle(one);

	}

	@Override
	public int deleteArticle(int ono) {
		return this.oneMapper.deleteArticle(ono);

	}

}
