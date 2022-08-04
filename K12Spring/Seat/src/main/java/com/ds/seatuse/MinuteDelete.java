package com.ds.seatuse;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Member_Reservation;

public class MinuteDelete {
	private SeatShowReservationDAO ssrDAO;
	private Show_SeatDAO sseatDAO;

	public void SeatDel() {
		List<Seat_Member_Reservation> ssrVO=new ArrayList<Seat_Member_Reservation>(); //목록받기
		ssrVO=ssrDAO.selectUseSeatshowNotReservationList();
		System.out.println("ssrDAO : "+ssrVO.get(0).toString());
		
		
		/*SimpleDateFormat f = new SimpleDateFormat("HH:mm:ss", Locale.KOREA);
		Date d1 = f.parse(ssr.get);
		Date d2 = f.parse("01:05:07");
		long diff = d1.getTime() - d2.getTime();
		long sec = diff / 1000;
		System.out.println(sec);*/

		/*for (int i = 0; i < ssrVO.size(); i++) {
			System.out.println("ssr_no : "+ssrVO.get(i).getSsr_no());
			int ssr_no=ssrVO.get(i).getSsr_no(); //예약번호
			Long show_no=ssrVO.get(i).getShow_no(); //공연번호

			//예약한 좌석 나누기용
			String[] ssrarray = ssrVO.get(i).getSsr_seat().split(",");	//예약한 좌석 나누기용 
			

			//자른것중 첫글자를 구분해서 좌석수 변화시키기
			for (int j = 0; j < ssrarray.length; j++) {

				String seat=ssrarray[j].replaceAll("[^a-zA-Z]", "");

				//좌석수 검색해서 좌석수 늘리기
				int seatcount=sseatDAO.SelectShowSeatCount("\'"+seat+"\'", show_no);
				sseatDAO.updateMinusPlusSeat(seatcount+1, "\'"+seat+"\'", show_no);

			}	
			ssrDAO.deleteSeatshowReservation(ssr_no);

		}*/
	}
}
