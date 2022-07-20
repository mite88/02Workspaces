package transaction;

import java.sql.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.*;
import org.springframework.transaction.*;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

public class TicketTplDAO {

	JdbcTemplate template;
	TransactionTemplate transactionTemplate;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}

	public TicketTplDAO() {
		System.out.println("TicketDAO생성자 호출:" + template);
	}

	public boolean buyTicket(final TicketTplDTO dto) {
		System.out.println("buyTicket() 호출");
		
		System.out.println("구매 아이디:" + dto.getCustomerId());
		System.out.println("구매 수량: " + dto.getAmount());
		
		try {
			
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					template.update(new PreparedStatementCreator() {
						@Override
						public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
							String sql = "insert into transaction_pay (customerId, amount) values(?, ?)";
							PreparedStatement pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, dto.getCustomerId());
							pstmt.setInt(2, dto.getAmount() * 1000);
							return pstmt;
						}
					});
					
					
					String sql = "insert into transaction_ticket(customerId, countNum ) values(?, ?)";
					template.update(sql, new PreparedStatementSetter() {
						@Override
						public void setValues(PreparedStatement pstmt) throws SQLException {
							pstmt.setString(1, dto.getCustomerId());
							pstmt.setInt(2, dto.getAmount());
						}
					});
					
					
				}
			});
			
			
			
			
			System.out.println("카드결제와 티켓구매 모두 정상처리됨");
			return true;
		} catch (Exception e) {
			System.out.println("제약조건위배로 카드결제와 티켓구매 취소됨");
			return false;
		}

	} // buyTicket }

}