package com.kh.junit;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.member.dao.MemberDAOImpJDBCTest;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UpdateJdbcTemplateTest {
	private final static Logger logger = LoggerFactory.getLogger(MemberDAOImpJDBCTest.class);
	
	@Inject
	JdbcTemplate jt;
	
	@Test
	void update() {
		StringBuffer sql = new StringBuffer();
		sql.append("update student set name = ?, kor = ?, eng = ?, mat = ? where id= ? ");
		int cnt = jt.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
			PreparedStatement pstmt =	con.prepareStatement(sql.toString());
			pstmt.setString(1, "전길순");
			pstmt.setInt(2, 100);
			pstmt.setInt(3, 80);
			pstmt.setInt(4, 100);
			pstmt.setString(5, "id1");
				return pstmt;
			}
		});
		assertEquals(1, cnt);
	}
}
