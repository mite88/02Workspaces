package com.ds.seat.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Member_Reservation;

public class MainInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private SeatShowReservationDAO ssrDAOs;

	@Autowired
	private Show_SeatDAO sseatDAOs;
	//컨트롤러 진입전 반응하는 함수
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpsession=request.getSession();

		///home.do?id=3435
		String path=request.getServletPath();

		String query=request.getQueryString();

		path=path.substring(1); // / 뺄려고 첫번째 자르기

		if(query ==null) {
			httpsession.setAttribute("BACK_URL", path);
			System.out.println("MainInterceptor : "+path+"?"+query);
		}
		else {
			httpsession.setAttribute("BACK_URL", path+"?"+query);
			System.out.println("MainInterceptor!! : "+path+"?"+query);
		}


		//예약하고 5분이 지나면 자동으로 예약취소하기위한것!!(전체적용)
		List<Seat_Member_Reservation> ssrVO=new ArrayList<Seat_Member_Reservation>(); //목록받기	
		ssrVO=ssrDAOs.selectUseSeatshowNotReservationList();

		if(!(ssrVO.size()==0)) {
			for (int i = 0; i < ssrVO.size(); i++) {
				System.out.println("ssr_no : "+ssrVO.get(i).getSsr_no());
				int ssr_no=ssrVO.get(i).getSsr_no(); //예약번호
				Long show_no=ssrVO.get(i).getShow_no(); //공연번호

				//예약한 좌석 나누기용
				String[] ssrarray = ssrVO.get(i).getSsr_seat().split(",");	//예약한 좌석 나누기용 


				//자른것중 첫글자를 구분해서 좌석수 변화시키기
				for (int j = 0; j < ssrarray.length; j++) {

					String seat=ssrarray[j].replaceAll("[^a-zA-Z]", "");

					//좌석수 검색해서 좌석수 늘리기
					int seatcount=sseatDAOs.SelectShowSeatCount("\'"+seat+"\'", show_no);
					sseatDAOs.updateMinusPlusSeat(seatcount+1, "\'"+seat+"\'", show_no);

				}	
				ssrDAOs.deleteSeatshowReservation(ssr_no);

			}
		}
		


		return true;
	}


}
