package com.kh.portfolio.member.dao;

import java.sql.Date;
import java.util.List;

import com.kh.portfolio.member.vo.MemberVO;

public interface MemberDAO {
//	회원 등록	joinMember	MemberVO	int
//	회원 수정	modifyMember	MemberVO	int
//	회원 전체조회	selectAllMember		List<MemberVO>
//	회원 개별조회	selectMeMember	ID	MemberVO
//	회원 탈퇴	outMember	ID,PW	int
//	로그인	loginMember	ID,PW	int
//	아이디 찾기	findID	TEL,BIRTH	String
//	비밀번호 변경	changePW	ID,PW	int

	//회원 등록
	int joinMember(MemberVO memberVO);
	//회원 수정
	int modifyMember(MemberVO memberVO);
	//회원 전체 조회
	List<MemberVO> selectAllMember();
	//회원 개별 조회
	MemberVO selectMeMember(String id);
	//회원 탈퇴
	int outMember(String id, String pw);
	//로그인
	MemberVO loginMember(String id, String pw);
	//아이디 찾기
	String findID(String tel, Date birth);
	//비밀번호 변경 대상 찾기
	int findPW(MemberVO memberVO);
	//비밀번호 변경
	int changePW(String id, String pw);
}
