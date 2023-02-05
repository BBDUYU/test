package com.jang.cap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jang.cap.model.AttFileVO;
import com.jang.cap.model.BoardVO;
import com.jang.cap.model.ReplyVO;
import com.jang.cap.model.SearchVO;

@Mapper
public interface BoardMapper {
	
	 int getTotalRow(SearchVO searchVO);//전체글 수 조회

   
   List<BoardVO> getBoardList( SearchVO searchVO ); //글 목록조회
   StringBuffer getPageUrl( SearchVO searchVO);  // 페이지 표시작성  메서드 추가 
   
	
	int writeArticle(BoardVO board);  //글 저장
	int updateArticle(BoardVO board); //글 수정
	int deleteArticle(int bno);//글 삭제

    int insertFile(AttFileVO fileVO);//첨부파일 저장
    BoardVO getArticle(int bno);//글조회
    
    int incrementReplyCnt(int bno);//댓글수 증가

    List<AttFileVO> getFileList(int bno);//첨부파일 목록조회
    
    String getFileName(int fno); //첨부 파일 이름 조회
    int deleteFile(int fno);//첨부 파일삭제
    int deleteFileBybno(int bno);//원본소속된 첨부파일수
    
    List<ReplyVO> getReplyList(int bno);//댓글 목록
    ReplyVO getReply(int bno);//댓글조회
    
    int writeReply(ReplyVO reply);//댓글 저장
    int updateReply(ReplyVO reply);//댓글 수정
    int deleteReply(int rno);//댓글 삭제
    int deleteReplyBybno(int bno);//원글에 소속된 댓글수
    
    
}

