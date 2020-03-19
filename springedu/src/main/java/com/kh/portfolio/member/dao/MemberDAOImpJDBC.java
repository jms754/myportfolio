package com.kh.portfolio.member.dao;

import java.lang.reflect.Member;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.member.vo.MemberVO;

import oracle.net.aso.o;

@Repository
public class MemberDAOImpJDBC implements MemberDAO {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberDAOImpJDBC.class);
	@Inject
	JdbcTemplate jdbcTemplate;
	
	//회원 등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberDAOImp.joinMember(MemberVO memberVO) 호출됨!");
		logger.info(memberVO.toString());
		int cnt = 0;
		
		//sql문 작성
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO member (id, pw, tel, nickname, gender, region, birth, cdate) ")
		 	 .append("VALUES (?,?,?,?,?,?,?,systimestamp) ");
		
		//sql실행
		cnt = jdbcTemplate.update(
												sql.toString(),
												memberVO.getId(),
												memberVO.getPw(),
												memberVO.getTel(),
												memberVO.getNickname(),
												memberVO.getRegion(),
												memberVO.getBirth());
		return cnt;
	}
	//회원 수정
	@Override
	public int modifyMember(MemberVO memberVO) {
		int cnt = 0;
		StringBuffer sql = new StringBuffer();
		sql.append("update member ")
			 .append("set tel = ?, ")
			 .append("		nickname = ?, ")
			 .append("		gender = ?, ")
		   .append("		region = ?, ")
		   .append("		birth = ?, ")
		   .append("		udate = systimestamp ")
		   .append("where id = ? ");
		
	cnt =	jdbcTemplate.update(
				sql.toString(), 
				memberVO.getTel(),
				memberVO.getNickname(),
				memberVO.getRegion(),
				memberVO.getBirth(),
				memberVO.getId());
		return cnt;
	}
	//회원 전체 조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberDAOImp.selectAllmber() 호출됨!");
		List<MemberVO> list = null;
		StringBuffer sql = new StringBuffer();
		sql.append("select id, pw, tel, nickname, gender, region, birth, cdate, udate ")
		 	 .append("from member ");
		
		list = jdbcTemplate.query(sql.toString(), getRowMapper());
		
		return list;
	}
	//회원 개별 조회
	@Override
	public MemberVO selectMeMember(String id) {
		logger.info("MemberDAOImp.selectMember(String id) 호출됨!");		
		MemberVO memberVO = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select id, pw, tel, nickname, gender, region, birth, cdate, udate ")
		   .append("from member ")
		   .append(" where id = ? ");
		
		memberVO = jdbcTemplate.queryForObject(
				sql.toString(),
				//테이블 컬럼 이름과 자바VO객체 속성이름이 같으면 자동매핑해줌 
				new BeanPropertyRowMapper<MemberVO>(MemberVO.class),
				//테이블 컬럼 이름과 자바VO객체 속성 수동매핑
				//getRowMapper(),
				id);
		return memberVO;
	}
	//회원 탈퇴
	@Override
	public int outMember(String id, String pw) {
		logger.info("MembeDAOImp.outMember(String id, String pw) 호출됨!");
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("delete from member where id = ? and pw = ? ");
		
		cnt = jdbcTemplate.update(sql.toString(), id, pw);
		return cnt;
	}
	//로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberDAOImp.loginMember(String id, String pw) 호출됨!");
		MemberVO memberVO = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select id,pw,tel,nickname,gender,region,birth,cdate,udate ")
			 .append("from member ")
			 .append("where id = ?")
			 .append("and pw = ? ");
		
		memberVO = jdbcTemplate.queryForObject(
												sql.toString(), 
												new BeanPropertyRowMapper<MemberVO>(MemberVO.class),
												id,pw);
		return memberVO;
	}
	//아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("MemberDAOImp.finID(String tel, Date birth) 호출됨!");
		String id = null;
		StringBuffer sql = new StringBuffer();
		sql.append("select id from member where tel = ? and birth = ? ");
		id = jdbcTemplate.queryForObject(sql.toString(), String.class, tel, birth);
		return id;
	}
	//비밀번호 변경
	@Override
	public int changePW(String id, String pw) {
		logger.info("MemberDAOImp.finPW(String id, String pw) 호출됨!");
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("update member set pw = ? where id = ? ");
		
		cnt = jdbcTemplate.update(sql.toString(), pw, id);
		return cnt;
	}
	//비밀번호 변경 대상 찾기
	@Override
	public int findPW(MemberVO memberVO) {
		logger.info("MemberDAOImp.finPW(MemberVO memberVO) 호출됨!");
		int cnt = 0;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select count(id) ")
		   .append("  from member ")
			 .append(" where id = ? and tel = ? and birth = ? ");
		
		cnt = jdbcTemplate.queryForObject(
				sql.toString(), 
				Integer.class, 
				memberVO.getId(),
				memberVO.getTel(),
				memberVO.getBirth());
		return cnt;
	}

	//MEMBER db테이블과 자바객체MemberVO를 수동매핑
	private RowMapper<MemberVO> getRowMapper() {
		RowMapper<MemberVO> rowMapper = new RowMapper<MemberVO>() {
			@Override
			public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberVO memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setPw(rs.getString("pw"));
				memberVO.setTel(rs.getString("tel"));
				memberVO.setNickname(rs.getString("nickname"));
				memberVO.setRegion(rs.getString("region"));
				memberVO.setBirth(rs.getDate("birth"));
				memberVO.setCdate(rs.getTimestamp("cdate"));
				memberVO.setUdate(rs.getTimestamp("udate"));
				return memberVO;
			}
		};
		return rowMapper;
	}
}
