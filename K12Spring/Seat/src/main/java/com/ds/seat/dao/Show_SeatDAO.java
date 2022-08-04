package com.ds.seat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ds.seat.vo.Show_Seat;


public interface Show_SeatDAO {

	//좌석 저장하기
	@Insert({"INSERT INTO SHOW_SEAT "
			+ "(SS_NO, SHOW_NO, SS_SEATTYPE, SS_SEATPAY, SS_SEATROW, SS_SEATCOL, SS_SEATCOUNT) "
			+ "VALUES (#{ss_no}, CAST(#{show_no} AS  signed integer), "
			+ "#{ss_seattype}, #{ss_seatpay}, #{ss_seatrow}, #{ss_seatcol}, #{ss_seatcount}) "
			+ "ON DUPLICATE KEY UPDATE SS_NO=#{ss_no}, SS_SEATTYPE=#{ss_seattype}, "
			+ "SS_SEATPAY= #{ss_seatpay}, SS_SEATROW=#{ss_seatrow}, "
			+ "SS_SEATCOL=#{ss_seatcol}, SS_SEATCOUNT=#{ss_seatcount}"})
	public int insertShowSeatOne(Show_Seat nbVO);

	//예약시좌석수줄이기
	@Update({"UPDATE SHOW_SEAT SET SS_SEATCOUNT=${seatcount} " + 
	"WHERE SS_SEATTYPE=${seat} AND SHOW_NO=${show_no}"})
	public void updateMinusPlusSeat(@Param("seatcount")int seatcount, @Param("seat")String seat, @Param("show_no")Long show_no );


	//좌석정보삭제
	@Delete({"DELETE FROM SHOW_SEAT WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public void ShowSeatDelete(String show_no);

	//좌석정보
	@Select({"SELECT * FROM SHOW_SEAT WHERE SHOW_NO=CAST(#{show_no} AS  signed integer)"})
	public List<Show_Seat> SelectShowSeatList(Long show_no);


	//좌석과 공연번호당 가격정보
	@Select({"SELECT SS_SEATPAY FROM SHOW_SEAT WHERE " + 
	"SS_SEATTYPE=${seat} AND SHOW_NO=CAST(${no} AS  signed integer)"})
	public int SelectShowSeatType(@Param("seat")String seat, @Param("no")Long no);

	//좌석과 공연번호당 자리수정보
	@Select({"SELECT SS_SEATCOUNT FROM SHOW_SEAT WHERE " + 
	"SS_SEATTYPE=${seat} AND SHOW_NO=CAST(${no} AS  signed integer)"})
	public int SelectShowSeatCount(@Param("seat")String seat, @Param("no")Long no);

}

