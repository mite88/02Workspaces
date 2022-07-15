package springboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

@Repository
public class JDBCTemplateDAO {
	

	JdbcTemplate template;

	public JDBCTemplateDAO() {
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
		//sql += " ORDER BY idx DESC";
		sql += " ORDER BY bGroup desc, bStep asc";

		System.out.println("list:" + sql);

		return (ArrayList<SpringBbsDTO>) template.query(sql,
				new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
	}

	public ArrayList<SpringBbsDTO> listPage(Map<String, Object> map) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		String sql = "" + "SELECT * FROM (" + "    SELECT Tb.*, rownum rNum FROM ("
				+ "        SELECT * FROM springboard ";
		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}
		sql += " ORDER BY bGroup desc, bStep asc" + "    ) Tb" + ")" + " WHERE rNum BETWEEN " + start + " and " + end;

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

			String sql = "SELECT * FROM springboard where idx=" + idx;
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));
		} catch (Exception e) {
			System.out.println("View()예외");

		}

		return dto;
	}

	public int password(String idx, String pass) {
		int retNum = 0;

		try {

			String sql = "SELECT * FROM springboard where pass=" + pass + " and idx=" + idx;
			SpringBbsDTO dto = template.queryForObject(sql,
					new BeanPropertyRowMapper<SpringBbsDTO>(SpringBbsDTO.class));

			retNum = dto.getIdx();
		} catch (Exception e) {
			System.out.println("password()예외");

		}

		return retNum;
	}

	public void edit(SpringBbsDTO dto) {
		String sql = "update springboard " + "set name=?, title=?, contents=? " + "where idx=? and pass=?";

		/*
		 * template.update(sql, new PreparedStatementSetter() {
		 * 
		 * @Override public void setValues(PreparedStatement ps) throws SQLException {
		 * ps.setString(1, dto.getName()); ps.setString(2, dto.getTitle());
		 * ps.setString(3, dto.getContents()); ps.setInt(4, dto.getIdx());
		 * ps.setString(5, dto.getPass()); } });
		 */

		template.update(sql,
				new Object[] { dto.getName(), dto.getTitle(), dto.getContents(), dto.getIdx(), dto.getPass() });
	}

	public void delete(String idx, String pass) {
		String sql = "delete from springboard where idx=? and pass=? ";

		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, idx);
				ps.setString(2, pass);
			}
		});

	}

	public void reply(SpringBbsDTO dto) {

		String sql = "INSERT INTO springboard (" 
				+ " idx, name, title, contents, pass, "
				+ " bgroup, bstep, bindent)" 
				+ " VALUES (" 
				+ " springboard_seq.NEXTVAL,?,?,?,?,?,?,?)";
		
		template.update(sql, new Object[] {
				dto.getName(), dto.getTitle(), dto.getContents(),
				dto.getPass(), dto.getBgroup(), dto.getBstep()+1, dto.getBindent()+1
		});
		
	}

}
