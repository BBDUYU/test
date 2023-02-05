package com.jang.cap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.BoardMapper;
import com.jang.cap.model.AttFileVO;
import com.jang.cap.model.BoardVO;
import com.jang.cap.model.ReplyVO;
import com.jang.cap.model.SearchVO;
import com.jang.cap.utils.PageHelper;


@Service(value = "boardService")

public class BoardServiceImpl implements BoardService {
	

	 @Autowired
	  private BoardMapper boardMapper;
	 
	PageHelper pageHelper = new PageHelper();

		@Override
		public List<BoardVO> getBoardList(SearchVO searchVO) {
		 int currentPage = searchVO.getPage();
	     int startRow = (currentPage - 1) *  pageHelper.getPageSize()+1;
		 int endRow   = currentPage * pageHelper.getPageSize();
			  searchVO.setStartRow(startRow);
			    searchVO.setEndRow(endRow);
			    
			    return this.boardMapper.getBoardList(searchVO);
		}
		

	@Override
	public int writeArticle(BoardVO board) {
		return boardMapper.writeArticle(board);

	}

	@Override
	public int updateArticle(BoardVO board) {
	    return this.boardMapper.updateArticle(board);

	}

	@Override
	public int deleteArticle(int bno) {
	    return this.boardMapper.deleteArticle(bno);

	}

	@Override
	public int insertFile(AttFileVO fileVO) {
		return boardMapper.insertFile(fileVO);

	}

	@Override
	public BoardVO getArticle(int bno) {
		 return this.boardMapper.getArticle(bno);

	}

	@Override
	public int incrementReplyCnt(int bno) {
		return this.boardMapper.incrementReplyCnt(bno);

	}

	@Override
	public List<AttFileVO> getFileList(int bno) {
		return this.boardMapper.getFileList(bno);

	}

	@Override
	public String getFileName(int fno) {
	    return this.boardMapper.getFileName(fno);
	}

	@Override
	public int deleteFile(int fno) {
	    return this.boardMapper.deleteFile(fno);

	}

	@Override
	public int deleteFileBybno(int bno) {
	    return this.boardMapper.deleteFileBybno(bno);

	}

	@Override
	public List<ReplyVO> getReplyList(int bno) {
	    return this.boardMapper.getReplyList(bno);

	}

	@Override
	public ReplyVO getReply(int bno) {
	    return this.boardMapper.getReply(bno);

	}

	@Override
	public int writeReply(ReplyVO reply) {
	    return this.boardMapper.writeReply(reply);

	}

	@Override
	public int updateReply(ReplyVO reply) {
	    return this.boardMapper.updateReply(reply);

	}

	@Override
	public int deleteReply(int rno) {
	    return this.boardMapper.deleteReply(rno);

	}

	@Override
	public int deleteReplyBybno(int bno) {
	    return this.boardMapper.deleteReplyBybno(bno);

	}


	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		 int totalRow = boardMapper.getTotalRow(searchVO);
	     return pageHelper.getPageUrl(searchVO, totalRow);
	}




}
