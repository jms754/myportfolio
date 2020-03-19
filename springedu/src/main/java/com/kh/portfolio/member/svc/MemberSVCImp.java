package com.kh.portfolio.member.svc;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.portfolio.member.dao.MemberDAO;
import com.kh.portfolio.member.dao.MemberDAOImpJDBC;
import com.kh.portfolio.member.vo.MemberVO;

@Service
public class MemberSVCImp implements MemberSVC {
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberDAOImpJDBC.class);
	@Inject
	@Qualifier("memberDAOImpXML")
	MemberDAO memberDAO; 
	//회원 등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberSVCImp.joinMember(MemberVO memberVO) 호출 됨!");
		return memberDAO.joinMember(memberVO);
	}
	//회원 수정
	@Override
	public int modifyMember(MemberVO memberVO) {
		logger.info("MemberSVCImp.odifyMember(MemberVO memberVO) 호출 됨!");
		return memberDAO.modifyMember(memberVO);
	}
	//회원 전체 조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberSVCImp.selectAllMember() 호출 됨!");
		return memberDAO.selectAllMember();
	}
	//회원 개별 조회
	@Override
	public MemberVO selectMeMember(String id) {
		logger.info("MemberSVCImp.selectMeMember(String id) 호출 됨!");
		return memberDAO.selectMeMember(id);
	}
	//회원 탈퇴
	@Override
	public int outMember(String id, String pw) {
		logger.info("MemberSVCImp.outMember(String id, String pw) 호출 됨!");
		return memberDAO.outMember(id, pw);
	}
	//로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberSVCImp.loginMember(String id, String pw) 호출 됨!");
		return memberDAO.loginMember(id, pw);
	}
	//아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("MemberSVCImp.findID(String tel, Date birth) 호출 됨!");
		return memberDAO.findID(tel, birth);
	}
	//비밀번호 변경
	@Override
	public int changePW(String id, String pw) {
		logger.info("MemberSVCImp.changePW(String id, String pw) 호출 됨!");
		return memberDAO.changePW(id, pw);
	}
	//비밀번호 변경 대상 찾기
	@Override
	public int findPW(MemberVO memberVO) {
		logger.info("MemberSVCImp.findPW(MemberVO memberVO) 호출 됨!");

		return memberDAO.findPW(memberVO);
	}

}
