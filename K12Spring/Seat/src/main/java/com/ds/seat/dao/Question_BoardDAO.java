package com.ds.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ds.seat.vo.Question_Board;


public interface Question_BoardDAO {

	//문의게시판게시판전부불러오기
	@Select({"SELECT * FROM QUESTION_BOARD ORDER BY QB_REF DESC, QB_RESTEP ASC"})
	public List<Question_Board> selectQuestioQBoardList();

	//문의게시판게시판 글보기 및 찾기
	@Select({"SELECT * FROM QUESTION_BOARD WHERE QB_NO=#{qb_no}"})
	public Question_Board selectQuestioQBoardView(int qb_no);

	//문의게시판게시판최대번호알아내기
	@Select({"SELECT MAX(QB_NO) FROM QUESTION_BOARD"})
	public int selectQuestioQBoardMax();

	//문의게시판게시판 저장하기
	@Insert({"INSERT INTO QUESTION_BOARD "
			+ "(QB_NO, QB_WRITER, QB_TITLE, QB_CONTENT, QB_DATE, QB_REF, QB_RESTEP, QB_LEVEL) "
			+ "VALUES (#{qb_no},#{qb_writer}, #{qb_title}, #{qb_content}, NOW(), #{qb_ref}, #{qb_restep}, #{qb_level} )"})
	public int insertQuestioQBoardOne(Question_Board qbVO);

	//문의게시판 저장시 그룹및 레벨 변경하기
	@Update({"UPDATE QUESTION_BOARD SET QB_RESTEP=#{qb_restep}+1 " + 
	"WHERE QB_REF=#{qb_ref} AND QB_RESTEP > #{qb_restep}"})
	public int updateQuestioQBoardStepOne(Question_Board qbVO);


	//문의게시판게시판 글수정저장하기
	@Update({"UPDATE QUESTION_BOARD SET QB_TITLE=#{qb_title}, QB_CONTENT=#{qb_content} " + 
	"WHERE QB_NO=#{qb_no}"})
	public void updateNoticeBoardOne(Question_Board qbVOs);

	//문의게시판게시판 글삭제하기(본글 삭제시 QB_REMOVE를 1로 바꾸게 해서 리스트시 없는글입니다 표시함)
	@Delete({"UPDATE QUESTION_BOARD SET QB_REMOVE=1 WHERE QB_NO=#{qb_no}"})
	public void NotdeleteUpdateQuestioQBoardOne(int qb_no);

	//문의게시판게시판 글삭제하기(답글)
	@Delete({"DELETE FROM QUESTION_BOARD WHERE QB_NO=#{qb_no}"})
	public void deleteQuestioQBoardOne(int qb_no);




}
