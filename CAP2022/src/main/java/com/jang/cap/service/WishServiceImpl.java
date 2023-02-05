package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.WishMapper;
import com.jang.cap.model.SearchVO;
import com.jang.cap.model.WishVO;
import com.jang.cap.utils.PageHelper;
@Service(value = "wishService")
public class WishServiceImpl implements WishService {

	@Autowired
	  private WishMapper wishMapper;
	PageHelper pageHelper = new PageHelper();
	
	@Override
	public List<WishVO> getWishList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	     int startRow = (currentPage - 1) *  pageHelper.getPageSize()+1;
		 int endRow   = currentPage * pageHelper.getPageSize();
			  searchVO.setStartRow(startRow);
			    searchVO.setEndRow(endRow);		return this.wishMapper.getWishList(searchVO);
	}

	@Override
	public int incGoodCnt(int hno) {
		// TODO Auto-generated method stub
		return wishMapper.incGoodCnt(hno);
	}

	@Override
	public int deleteGoodCnt(int wno) {
		// TODO Auto-generated method stub
		return this.wishMapper.deleteGoodCnt(wno);
	}

	@Override
	public int addWishLike(WishVO wish) {
		// TODO Auto-generated method stub
		return this.wishMapper.addWishLike(wish);
	}

	@Override
	public int getWishLike(WishVO wish) {
		// TODO Auto-generated method stub
		return this.wishMapper.getWishLike(wish);
	}

	@Override
	public WishVO getArticle(int wno) {
		// TODO Auto-generated method stub
		 return this.wishMapper.getArticle(wno);
	}

	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		 int totalRow = wishMapper.getTotalRow(searchVO);
	     return pageHelper.getPageUrl(searchVO, totalRow);
	}
	
}
