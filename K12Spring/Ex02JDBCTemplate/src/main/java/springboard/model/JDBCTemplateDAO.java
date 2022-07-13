package springboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

public class JDBCTemplateDAO {
	JdbcTemplate template;

	public JDBCTemplateDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("JDBCTemplateDAO() 생성자호출");

	}

	public void close() {
		// TODO Auto-generated method stub

	}

	public int getTotalCount(Map<String, Object> map) {
		String sql = "SELECT COUNT(*) FROM springboard ";

		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}

		System.out.println("getTotalCount:" + sql);

		return template.queryForObject(sql, Integer.class);
	}

	public ArrayList<SpringBbsDTO> list(Map<String, Object> map) {
		String sql = "" + "SELECT * FROM springboard ";
		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}
		sql += " ORDER BY idx DESC";

		System.out.println("list:" + sql);

		return (ArrayList<SpringBbsDTO>) template.query(sql,
				new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
	}

	// 글쓰기1
	public void write(final SpringBbsDTO springBbsDTO) {

		template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "INSERT INTO springboard (" + " idx, name, title, contents, hits"
						+ " , bgroup, bstep, bindent, pass)" + " VALUES (" + " springboard_seq.NEXTVAL,?,?,?,0,"
						+ " springboard_seq.NEXTVAL,0,0,?)";

				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, springBbsDTO.getName());
				psmt.setString(2, springBbsDTO.getTitle());
				psmt.setString(3, springBbsDTO.getContents());
				psmt.setString(4, springBbsDTO.getPass());

				return psmt;
			}
		});
	}

	// 조회수 증가
	public void updateHit(final String idx) {
		String sql = "UPDATE springboard SET hits=hits+1 WHERE idx=? ";

		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));
			}
		});

	}
	
	public SpringBbsDTO view(String idx) {
		SpringBbsDTO dto = new SpringBbsDTO();
		
		try {
			updateHit(idx);
			
			String sql="SELECT * FROM springboard where idx="+idx;
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<SpringBbsDTO>(
					SpringBbsDTO.class));
		} catch (Exception e) {
			System.out.println("View()예외");

		}
		
		return dto;
	}
	
	
	public int password(String idx, String pass) {
		int retNum =0;

		try {

			String sql="SELECT * FROM springboard where pass="+pass+" and idx="+idx;
			SpringBbsDTO dto = template.queryForObject(sql, new BeanPropertyRowMapper<SpringBbsDTO>(
					SpringBbsDTO.class));
			
			retNum = dto.getIdx();
		} catch (Exception e) {
			System.out.println("password()예외");

		}
		
		return retNum;
	}
	

}
