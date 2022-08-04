package com.ds.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ds.seat.vo.Notice_Board;


public interface Notice_BoardDAO {

	//공지사항게시판전부불러오기
	@Select({"SELECT NB_NO,NB_CATEGORY,NB_TITLE,NB_DATE FROM NOTICE_BOARD"})
	public List<Notice_Board> selectNoticeBoardList();
	
	//공지사항게시판 상위5개 불러오기(메인페이지용)
	@Select({"SELECT NB_NO,NB_CATEGORY,NB_TITLE,NB_DATE FROM NOTICE_BOARD " + 
			"ORDER BY NB_NO DESC LIMIT 5"})
	public List<Notice_Board> selectNoticeBoardListTop5();
		

	//공지사항게시판카테고리별불러오기
	@Select({"SELECT NB_NO,NB_CATEGORY,NB_TITLE,NB_DATE FROM NOTICE_BOARD WHERE NB_CATEGORY=#{nb_category} ORDER BY NB_NO DESC"})
	public List<Notice_Board> selectNoticeBoardCategoryList(String nb_category);

	//공지사항게시판 저장하기
	@Insert({"INSERT INTO NOTICE_BOARD "
			+ "(NB_TITLE, NB_CATEGORY, NB_CONTENT, NB_DATE) "
			+ "VALUES (#{nb_title},#{nb_category}, #{nb_content}, NOW())"})
	public int insertNoticeBoardOne(Notice_Board nbVO);

	//공지사항게시판 글보기
	@Select({"SELECT * FROM NOTICE_BOARD WHERE NB_NO=#{nb_no}"})
	public Notice_Board selectNoticeBoardView(int nb_no);

	//공지사항게시판 글수정저장하기
	@Update({"UPDATE NOTICE_BOARD SET NB_TITLE=#{nb_title}, " + 
			"NB_CATEGORY=#{nb_category}, NB_CONTENT=#{nb_content} " + 
	"WHERE NB_NO=#{nb_no}"})
	public Notice_Board updateNoticeBoardOne(Notice_Board nbVO);

	//공지사항게시판 글삭제하기
	@Delete({"DELETE FROM NOTICE_BOARD WHERE NB_NO=#{nb_no}"})
	public void deleteNoticeBoardOne(int nb_no);

}
