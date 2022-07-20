package com.kosmo.transactiontemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import transaction.TicketTplDAO;
import transaction.TicketTplDTO;

@Controller
public class TransactionController {
	private TicketTplDAO daoTpl;
	
	@Autowired
	public void setDaoTpl(TicketTplDAO daoTpl) {
		this.daoTpl = daoTpl;
	}

	@RequestMapping("/transaction/buyTicketTpl.do")
	public String buyTicketTpl() {
		return "08Transaction/buyTicketTpl";
	}
	
	@RequestMapping("/transaction/buyTicketTplAction.do")
	public String buyTicketTplAction(TicketTplDTO ticketDTO, Model model) {
		
		//티켓구매처리를 위한 DAO 호출
		boolean isBool = daoTpl.buyTicket(ticketDTO);
		
		if(isBool == true) {
			model.addAttribute("successOrFail", "티켓정상구매");
		}else {
			
			model.addAttribute("successOrFail", "티켓구매 취소, 다시 시도해주세요");
		}
		
		model.addAttribute("ticketInfo", ticketDTO);
		
		return "08Transaction/buyTicketTplAction";
	}
}
