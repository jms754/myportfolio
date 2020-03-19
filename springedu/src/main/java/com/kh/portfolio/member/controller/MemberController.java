package com.kh.portfolio.member.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.common.Code;
import com.kh.portfolio.member.dao.MemberDAOImpJDBC;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberDAOImpJDBC.class);
	
	@Inject
	MemberSVC memberSVC;
	
	@ModelAttribute
	public void initData(Model model) {

	}
	//회원가입양식
	@RequestMapping("/joinForm")
	public String memberJoinForm(Model model) {
		model.addAttribute("mvo",new MemberVO());
		return "member/joinForm";
	}
	//회원등록
	@RequestMapping("/join")
	public String memberJoin(
			@Valid @ModelAttribute("mvo") MemberVO memberVO,
			BindingResult result,
			Model model) {
		logger.info(memberVO.toString());
		// 1) 유효성 오류체크 중 오류가 발견되면 회원 가입 페이지로 이동
		if(result.hasErrors()) {
			return "member/joinForm";
		}
		// 2) 회원 중복체크
		if(memberSVC.selectMeMember(memberVO.getId()) != null) {
			model.addAttribute("svr_msg", "이미 등록된 아이디(이메일) 입니다. 다른 아이디를 입력해 주세요.");
			return "member/joinForm";
		}
		// 3) 회원 가입처리
		int cnt = memberSVC.joinMember(memberVO);
		if(cnt == 1) {
			return "member/loginForm";			
		} else {
			return "redirect:/";
		}
	}
	//회원수정 양식
	@GetMapping("/modifyForm/{id:.+}")
	public String modifyForm(@PathVariable String id, Model model) {
		
		//1) 현재 로그인한 회원정보 읽어오기
		MemberVO memberVO = memberSVC.selectMeMember(id);
		logger.info("memberVO : " + memberVO);
		memberVO.setPw(null);
		model.addAttribute("mvo", memberVO);
		return "member/modifyForm";
		
	}
	
	//회원수정
	@PostMapping("/modify")
	public String modify(
			@Valid @ModelAttribute("mvo") MemberVO memberVO,
			BindingResult result,
			HttpSession session,
			Model model
			) {
		//유효성 체크
		if(result.hasErrors()) {
			memberVO.setPw(null);
			return "member/modifyForm";
		}
		logger.info("memberVO-->" + memberVO.toString());
		String aaa = memberVO.getRegion1();
		aaa += ","+memberVO.getRegion2();
		aaa += ","+memberVO.getRegion3();
    memberVO.setRegion(aaa);
		//회원정보 수정
		int cnt = memberSVC.modifyMember(memberVO);
		logger.info("수정처리결과 : " + cnt);
		
//		//수정 후 회원정보 읽어오기
//		memberVO = memberSVC.selectMeMember(memberVO.getId());
		//세션정보 수정
		session.removeAttribute("member");
		memberVO = memberSVC.selectMeMember(memberVO.getId());
		session.setAttribute("member", memberVO);
//		model.addAttribute("memberVO", memberVO);
		return "redirect:/";
	}
	
	//회원 탈퇴양식
	@GetMapping("/outForm")
	public String outForm() {
		
		return "member/outForm";
	}
	
	//회원 탈퇴 처리
	@PostMapping("/out")
	public String out(
			@RequestParam("id") String id, 
			@RequestParam("pw") String pw,
			HttpSession session,
			Model model) {
		
		int cnt = memberSVC.outMember(id, pw);
		if(cnt == 1) {
			session.invalidate();
			return "redirect:/";
		}
		
		model.addAttribute("svr_msg", "비밀번호가 잘못 되었습니다.");
		return "member/outForm";
	}
	
	//아이디 찾기 양식
	@GetMapping("/findIDForm")
	public String findIDForm() {
		
		return "member/findIDForm";
	}
	//아이디 찾기 post방식
	@PostMapping(value = "/id", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map> findId(
			@RequestBody MemberVO memberVO
			) {			
		ResponseEntity<Map> res = null;
		String findId = null;
		logger.info("tel : " + memberVO.getTel());
		logger.info("birth : " + memberVO.getBirth());
		
		//java.sql.Date타입으로 변환
		memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));
		//아이디 찾기 service 호출
		findId = memberSVC.findID(memberVO.getTel(), memberVO.getBirth());
		Map<String, Object> map = new HashMap();
		if(findId != null) {
			map.put("success", true);
			map.put("id", findId);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);					// 200
		}else {
			map.put("success", false);
			map.put("id", findId);
			map.put("msg", "찾고자하는 아이디가 없습니다.");
			res = new ResponseEntity<Map>(map, HttpStatus.OK);	// 400
		}
		return res;
	}
	//아이디 찾기 get방식
//	@GetMapping(value = "/id/{tel}/{birth}", produces = "application/json")
//	@ResponseBody
//	public ResponseEntity<String> findId(
//			@PathVariable("tel") String tel,
//			@PathVariable("birth") String birth
//			) {			
//		ResponseEntity<String> res = null;
//		String findId = null;
//		logger.info("tel : " + tel);
//		logger.info("birth : " + birth);
//		
//			findId = memberSVC.findID(tel, java.sql.Date.valueOf(birth));
//			if(findId != null) {
//				res = new ResponseEntity<String>(findId, HttpStatus.OK);					// 200
//			}else {
//				res = new ResponseEntity<String>("찾고자하는 아이디가 없습니다.", HttpStatus.BAD_REQUEST);	// 400
//			}
//		return res;
//	}
	
//비밀번호 변경화면
	@GetMapping("/findPWForm")
	public String findPWForm() {
		
		return "member/findPWForm"; 
	}	
	//비밀번호변경 대상 찾기
	@PostMapping(value="/findPW", produces = "application/json;charset=utf-8")
	@ResponseBody             //뷰말고 데이터 던져줌
	public ResponseEntity<Map> findPW(
			@RequestBody MemberVO memberVO){
		ResponseEntity<Map> res = null;
		logger.info("비밀번호 변경 대상 찾기 요청:"+memberVO);
		
		//2)비밀번호변경 대상 찾기
		memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));
		int cnt = memberSVC.findPW(memberVO);
		Map<String,Boolean> map = new HashMap<>();		
		if(cnt==1) {
			map.put("success", true);
			res = new ResponseEntity<Map>(map,HttpStatus.OK);
		}else {
			map.put("success", false);
			res = new ResponseEntity<Map>(map,HttpStatus.OK);
		}
		return res;
	}
	//비밀번호 변경
	@PostMapping(value = "/changePW", produces = "application/json;charset=utf-8")
	@ResponseBody //데이터만보냄
	public ResponseEntity<Map> changePW(
			@RequestBody MemberVO memberVO
			){
		ResponseEntity<Map> res = null;
		int cnt = memberSVC.changePW(memberVO.getId(), memberVO.getPw());
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(cnt == 1) {
			map.put("success", true);
			res = new ResponseEntity<Map>(map,HttpStatus.OK);
		}else {
			map.put("success", false);
			res = new ResponseEntity<Map>(map,HttpStatus.OK);			
		}
		return res;
	}
	
}
