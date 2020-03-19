package com.kh.portfolio.member.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.member.vo.MemberVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOImpXMLTest {
	private final static Logger logger = LoggerFactory.getLogger(MemberDAOImpXMLTest.class);
	
	@Inject
	@Qualifier("memberDAOImpXML")
	MemberDAO memberDAO;
	
	@Test
	@DisplayName("회원 등록")
	@Disabled
	void joinMember() {
		MemberVO memberVO = new MemberVO();
//		sql.append("INSERT INTO member (id, pw, tel, nickname, gender, region, birth, cdate) ")
//	 	 .append("VALUES (?,?,?,?,?,?,?,systimestamp) ");
		memberVO.setId("test1@naver.com");
		memberVO.setPw("111111dd");
		memberVO.setTel("010-8977-1769");
		memberVO.setNickname("홍길동");
		memberVO.setRegion("울산");
		memberVO.setBirth(java.sql.Date.valueOf("1993-01-25"));
		int cnt = memberDAO.joinMember(memberVO);
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("회원 정보 수정")
	@Disabled
	void modifyMember() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("test1@naver.com");
		memberVO.setTel("010-8888-1111");
		memberVO.setNickname("홍길구");
		memberVO.setRegion("울산");
		memberVO.setBirth(java.sql.Date.valueOf("1993-01-25"));
		int cnt = memberDAO.modifyMember(memberVO);
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("회원 전체 조회")
	@Disabled
	void selectAllMember() {
		List<MemberVO> list = memberDAO.selectAllMember();
		assertNotNull(list);
		logger.info(list.toString());
	}
	
	@Test
	@DisplayName("회원 개별 조회")
	@Disabled
	void selectMeMember() {
		MemberVO memberVO = memberDAO.selectMeMember("admin94@admin.com");
		assertEquals("admin94@admin.com", memberVO.getId());
		logger.info(memberVO.toString());
	}
	
	@Test
	@DisplayName("회원 탈퇴")
	@Disabled
	void outMember() {
		int cnt = memberDAO.outMember("test@naver.com", "111111dd");
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("로그인")
	@Disabled
	void loginMember() {
		MemberVO memberVO = memberDAO.loginMember("test1@naver.com", "111111dd");
		assertEquals("test1@naver.com", memberVO.getId());
		logger.info(memberVO.toString());
	}
	
	@Test
	@DisplayName("아이디 찾기")
	@Disabled
	void findID() {
		String id = memberDAO.findID("010-8977-1769", java.sql.Date.valueOf("1993-01-25"));
		assertEquals("admin94@admin.com", id);
		logger.info(id);
	}
	@Test
	@DisplayName("비밀번호 변경")
	@Disabled
	void ChangePW() {
		int cnt = memberDAO.changePW("admin94@admin.com", "111111dd");
		assertEquals(1, cnt);
	}
	@Test
	@DisplayName("비밀번호 변경 대상 찾기")
	@Disabled
	void findPW() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("test1@test.com");
		memberVO.setTel("010-8888-7776");
		memberVO.setBirth(java.sql.Date.valueOf("1995-06-01"));
		int cnt = memberDAO.findPW(memberVO);
		assertEquals(1, cnt);
		logger.info(memberVO.toString());
	}
}
