package com.ds.seat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ds.seat.vo.ReservationChart;
import com.ds.seat.vo.Seat_Member_Reservation;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_Reservation;

public interface SeatShowReservationDAO {

	//공연정보저장 / 수정 
	@Options(useGeneratedKeys=false)
	@Insert({"INSERT INTO SEAT_SHOW_RESERVATION" + 
			"(SSR_PRICE,SSR_DATE,M_NO,SHOW_NO, SSR_SEAT) " + 
			"VALUES" + 
	"(#{ssr_price},NOW(),#{m_no},#{show_no},#{ssr_seat})"})
	public void insertSeatShowReservationOne(Seat_Show_Reservation ssrvo);

	//이미예약된 좌석 검색용
	@Select({"SELECT SSR.SSR_SEAT FROM SEAT_SHOW_RESERVATION SSR RIGHT OUTER JOIN  SHOW_SEAT SS "
			+ "ON SSR.SHOW_NO=SS.SHOW_NO WHERE SSR.SHOW_NO=#{show_no} AND SSR.SSR_PAYSET='Y'"
			+ "GROUP BY SSR.SHOW_NO"})
	public List<Seat_Show_Reservation> selectSeatshowReservationSeatlList(Long show_no);

	//이미예약된 좌석 검색용(결제전)
	@Select({"SELECT SSR.SSR_SEAT FROM SEAT_SHOW_RESERVATION SSR RIGHT OUTER JOIN  SHOW_SEAT SS "
			+ "ON SSR.SHOW_NO=SS.SHOW_NO WHERE SSR.SHOW_NO=#{show_no} AND SSR.SSR_PAYSET='N'"
			+ "GROUP BY SSR.SHOW_NO"})
	public List<Seat_Show_Reservation> selectSeatshowReservationSeatlListPayno(Long show_no);

	//예약된좌석 검색용
	@Select({"SELECT SSR_SEAT FROM SEAT_SHOW_RESERVATION WHERE SHOW_NO=#{show_no}"
			+ " ORDER BY SSR_NO DESC LIMIT 1"})
	public String selectSeatshowReservationSeatList1(Long show_no);

	//결제전 정보
	@Select({"SELECT SSR.SSR_NO, SSR.SSR_PRICE, SSR.SSR_DATE,SSR.M_NO,M.M_ID, M.M_NAME, " + 
			"SH.SHOW_NO, SSR.SSR_SEAT FROM " + 
			"SEAT_SHOW_RESERVATION SSR LEFT OUTER JOIN SEAT_MEMBER M " + 
			"ON SSR.M_NO=M.M_NO LEFT JOIN SEAT_SHOW " + 
			"SH ON SSR.SHOW_NO=SH.SHOW_NO WHERE SH.SHOW_NO=#{show_no} " + 
	"ORDER BY SSR.SSR_NO DESC LIMIT 1"})
	public Map<String, Object> selectSeatshowReservationSeatOne(Long show_no);

	//예약취소
	@Delete({"DELETE FROM SEAT_SHOW_RESERVATION WHERE SSR_NO=#{ssr_no}"})
	public void deleteSeatshowReservation(int ssr_no);


	//결제완료 
	@Update({"UPDATE SEAT_SHOW_RESERVATION SET SSR_PAYSET='Y' WHERE SSR_NO=#{ssr_no}"})
	public void updteSeatShowReservationOne(int ssr_no);


	//차트작성용 공연좌석검색
	@Select({"SELECT SS.SHOW_TITLE AS TITLE, SH.SHOW_ID_NAME, SS.SHOW_ID AS SHOWID, " + 
			"SUM(SS1.SS_SEATROW*SS1.SS_SEATCOL) AS SEATCOUNT, " + 
			"SUM(SS1.SS_SEATROW*SS1.SS_SEATCOL)-SUM(SS1.SS_SEATCOUNT) AS SEATSUMCOUNT " + 
			"FROM SHOW_SEAT SS1 RIGHT OUTER JOIN SEAT_SHOW SS " + 
			"ON SS.SHOW_NO=SS1.SHOW_NO LEFT OUTER JOIN SHOW_HELL SH " + 
			"ON SS.SHOW_ID=SH.SHOW_ID " + 
			"GROUP BY SS.SHOW_TITLE ORDER BY SH.SHOW_ID"})
	public List<ReservationChart> selectSeatshowReservationSeatCount();

	//---------------------hell-----------------------------------------------------------
	@Select({"SELECT * FROM SHOW_HELL"})
	public List<ReservationChart> selectShowHellList();

	/*//차트작성용 공연좌석검색(공연별별)
	@Select({"SELECT SS.SHOW_TITLE AS TITLE, SS.SHOW_ID AS SHOWID," + 
			"SUM(SS1.SS_SEATROW*SS1.SS_SEATCOL) AS SEATCOUNT, " + 
			"SUM(SS1.SS_SEATROW*SS1.SS_SEATCOL)-SUM(SS1.SS_SEATCOUNT) AS SEATSUMCOUNT " + 
			"FROM SHOW_SEAT SS1 LEFT OUTER JOIN SEAT_SHOW SS " + 
	"ON SS.SHOW_NO=SS1.SHOW_NO GROUP BY SS.SHOW_TITLE WHERE SS.SHOW_ID=${showid}"})
	public List<ReservationChart> selectSeatshowReservationSeatCount(@Param("showid") int showid);*/
	
	
	//차트작성용 공연홀별 좌석검색
	@Select({"SELECT SH.SHOW_ID_NAME, SS.SHOW_ID AS SHOWID," + 
			"SUM(SS1.SS_SEATROW*SS1.SS_SEATCOL) AS SEATCOUNT," + 
			"SUM(SS1.SS_SEATROW*SS1.SS_SEATCOL)-SUM(SS1.SS_SEATCOUNT) AS SEATSUMCOUNT " + 
			"FROM SHOW_SEAT SS1 RIGHT OUTER JOIN SEAT_SHOW SS " + 
			"ON SS.SHOW_NO=SS1.SHOW_NO LEFT OUTER JOIN SHOW_HELL SH " + 
			"ON SS.SHOW_ID=SH.SHOW_ID GROUP BY SH.SHOW_ID"})
	public List<ReservationChart> selectSeatshowReservationHellSeatCount();


	//---------------------------mypage-------------------------------------------

	@Select({"SELECT SSR.SSR_NO, SSR.SSR_PRICE, SSR.SSR_PAYSET, SSR.SSR_DATE, M.M_NAME, " + 
			"SH.SHOW_NO, SH.SHOW_TITLE, SSR.SSR_SEAT,SH.SHOW_STARTDATE, SH.SHOW_ENDDATE FROM " + 
			"SEAT_SHOW_RESERVATION SSR LEFT OUTER JOIN SEAT_MEMBER M " + 
			"ON SSR.M_NO=M.M_NO LEFT JOIN SEAT_SHOW " + 
	"SH ON SSR.SHOW_NO=SH.SHOW_NO WHERE M.M_ID=#{m_id}"})
	public List<Seat_Member_Reservation> selectUseSeatshowReservationSeat(String m_id);



	//결제전 정보(결제 하지않은 상태에서 다시 결제하려고 할시 사용자용)
	@Select({"SELECT SSR.SSR_NO, SSR.SSR_PRICE, SSR.SSR_DATE,SSR.M_NO,M.M_ID, M.M_NAME, " + 
			"SH.SHOW_NO, SSR.SSR_SEAT FROM " + 
			"SEAT_SHOW_RESERVATION SSR LEFT OUTER JOIN SEAT_MEMBER M " + 
			"ON SSR.M_NO=M.M_NO LEFT JOIN SEAT_SHOW " + 
	"SH ON SSR.SHOW_NO=SH.SHOW_NO WHERE SSR.SSR_NO=#{ssr_no}"})
	public Map<String, Object> selectSeatshowReservationMemberOne(int ssr_no);


	//---------------------------5분지난결제정보삭제(결제 안할시)-------------------------------------------
	@Select({"SELECT * FROM SEAT_SHOW_RESERVATION"+
			" WHERE SSR_DATE > date_sub(now(),INTERVAL -5 MINUTE)"+ 
	" AND SSR_PAYSET='N'"})
	public List<Seat_Member_Reservation> selectUseSeatshowNotReservationList();
}
