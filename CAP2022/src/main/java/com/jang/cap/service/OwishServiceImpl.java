package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.OWishMapper;
import com.jang.cap.model.OWishVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.utils.PageHelper;



@Service(value = "owishService")
public class OwishServiceImpl implements OwishService {

	@Autowired
	  private OWishMapper owishMapper;
	PageHelper pageHelper = new PageHelper();
	
	@Override
	public List<OWishVO> getWishList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	     int startRow = (currentPage - 1) *  pageHelper.getPageSize()+1;
		 int endRow   = currentPage * pageHelper.getPageSize();
			  searchVO.setStartRow(startRow);
			    searchVO.setEndRow(endRow);		return this.owishMapper.getWishList(searchVO);
	}

	@Override
	public OWishVO getArticle(int owno) {
		 return this.owishMapper.getArticle(owno);
	}

	@Override
	public int incGoodCnt(int ono) {
		return owishMapper.incGoodCnt(ono);
	}

	@Override
	public int deleteGoodCnt(int owno) {
		return owishMapper.deleteGoodCnt(owno);

	}

	@Override
	public int addWishLike(OWishVO wish) {
		return this.owishMapper.addWishLike(wish);
	}

	@Override
	public int getWishLike(OWishVO wish) {
		return this.owishMapper.getWishLike(wish);
	}

	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		 int totalRow = owishMapper.getTotalRow(searchVO);
	     return pageHelper.getPageUrl(searchVO, totalRow);
	}

}
