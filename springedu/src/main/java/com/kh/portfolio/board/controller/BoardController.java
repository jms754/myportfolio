package com.kh.portfolio.board.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.board.svc.BoardSVC;
import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.RboardVO;
import com.kh.portfolio.member.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger
		= LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardSVC boardSVC;
	
	@ModelAttribute
	public void getBoardCategory(Model model) {
		List<BoardCategoryVO> boardCategoryVO = boardSVC.getCategory();
		model.addAttribute("boardCategoryVO", boardCategoryVO);
	}
	
	//게시글 작성양식
	@GetMapping("/writeForm/{returnPage}")
	public String writeForm(
			@ModelAttribute @PathVariable String returnPage,
			Model model, 
			HttpServletRequest request) {
		//case1)
		model.addAttribute("boardVO",new BoardVO());
		//case2)
		//BoardVO boardVO = new BoardVO();
		//MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		//boardVO.setBid(memberVO.getId());
		//boardVO.setBnickname(memberVO.getNickname());	
		//model.addAttribute("boardVO",boardVO);
		
		return "/board/writeForm";
	}
	
	//게시글 작성
	@PostMapping("/write/{returnPage}")
	public String write(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("boardVO") BoardVO boardVO,
			BindingResult result,
			HttpServletRequest request) {
		logger.info("게시글작성: " + boardVO.toString());
		
		if(result.hasErrors()) {
			return "/board/writeForm";
		}
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		boardVO.setBid(memberVO.getId());
		boardVO.setBnickname(memberVO.getNickname());
		logger.info("게시글작성2: " + boardVO.toString());		
		boardSVC.write(boardVO);
		return "redirect:/board/view/"+returnPage+"/"+boardVO.getBnum();
	}
		
	//목록보기
	@GetMapping({"/list/{boardName}",
							 "/list/{boardName}/{reqPage}",
							 "/list/{boardName}/{reqPage}/{searchType}/{keyword}"
	})
	public String listAll(
			@PathVariable String boardName, 
			@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,
			HttpSession session, 
			Model model) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		if(memberVO != null ) {
//			logger.info("세션있음"+memberVO.toString());
//		}else {
//			logger.info("세션없음");
//		}
//		model.addAttribute("list", boardSVC.list());
		//게시글목록
		model.addAttribute("list", boardSVC.list(boardName, reqPage,searchType,keyword));
		//페이지 제어
		model.addAttribute("pc", boardSVC.getPageCriteria(boardName, reqPage, searchType, keyword));	
		return "board/list";
	}
	
	//게시글보기
	@GetMapping("/view/{returnPage}/{bnum}")
	public String view(
			@ModelAttribute @PathVariable String returnPage,
			@PathVariable String bnum,
			Model model) {
		
		Map<String,Object> map = boardSVC.view(bnum);
		BoardVO boardVO = (BoardVO)map.get("board");
		RboardVO rboardVO = (RboardVO)map.get("rboard");
		logger.info(boardVO.toString());
		List<BoardFileVO> files = null;
		if(map.get("files") != null) {
			files = (List<BoardFileVO>)map.get("files");
		}
		
		model.addAttribute("boardVO", boardVO);		
		model.addAttribute("rboardVO", rboardVO);		
		model.addAttribute("files", files);
//		model.addAttribute("returnPage", returnPage);
		
		return "/board/readForm";
	}
	
	//첨부파일 다운로드
	@GetMapping("/file/{fid}")
	public ResponseEntity<byte[]> getFile(@PathVariable String fid) {
		BoardFileVO boardVoFileVO = boardSVC.fileView(fid);
		logger.info("getFile " + boardVoFileVO.toString());
		
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = boardVoFileVO.getFtype().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(boardVoFileVO.getFsize());
		/* 첨부파일명이 한글일경우 깨짐 방지 */ 
		String filename = null;
		try {
			filename = new String(boardVoFileVO.getFname().getBytes("euc-kr"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		headers.setContentDispositionFormData("attachment", filename);
		/***************************/
		return new ResponseEntity<byte[]>(boardVoFileVO.getFdata(), headers,	HttpStatus.OK);
	}	
	
	//게시글 삭제
	@GetMapping("/delete/{boardName}/{returnPage}/{bnum}")
	public String delete(
			@PathVariable String boardName,
			@PathVariable String returnPage,
			@PathVariable String bnum,
			Model model) {
		
		//1)게시글 및 첨부파일 삭제
		boardSVC.delete(bnum);

		//2)게시글 목록 가져오기
		model.addAttribute("list", boardSVC.list());
		
		return "redirect:/board/list/" + boardName +"/"+	returnPage;
		
	}
	
	//첨부파일 1건 삭제
	@DeleteMapping("/file/{fid}")
	@ResponseBody
	public ResponseEntity<String> fileDelete(
			@PathVariable String fid){
		
		int cnt = boardSVC.fileDelete(fid);
		
		if(cnt == 1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
		}
	}
	//게시글 수정양식
	@GetMapping("/modifyForm/{returnPage}/{bnum}")
	public String modifyForm(
			@ModelAttribute @PathVariable String returnPage,
			@PathVariable String bnum,
			Model model) {
		Map<String,Object> map = boardSVC.view(bnum);
		BoardVO boardVO = (BoardVO)map.get("board");
		model.addAttribute("boardVO", boardVO);
		List<BoardFileVO> files = null;
		if(map.get("files") != null) {
			files = (List<BoardFileVO>)map.get("files");
		}
		model.addAttribute("files", files);

		return "/board/modifyForm";
	}
	//게시글수정
	@PostMapping("/modify/{returnPage}")
	public String modify(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("boardVO") BoardVO boardVO,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/board/modifyForm";
		}
		logger.info("게시글 수정 내용:" + boardVO.toString());
		boardSVC.modify(boardVO);
		return "redirect:/board/view/"+returnPage+"/"+boardVO.getBnum();
	}
	
	//답글양식
	@GetMapping("/replyForm/{returnPage}/{bnum}")
	public String replyForm(
			@ModelAttribute @PathVariable String returnPage,
			@PathVariable String bnum,
			Model model) {
		
		Map<String,Object> map = boardSVC.view(bnum);
		BoardVO boardVO = (BoardVO)map.get("board");
//		List<BoardFileVO> files = null;
//		if(map.get("files") != null) {
//			files = (List<BoardFileVO>)map.get("files");
//		}
		boardVO.setBtitle(boardVO.getBtitle() + "의 답글");
		boardVO.setBcontent("[원글] "+ boardVO.getBcontent());
		model.addAttribute("boardVO", boardVO);
//		model.addAttribute("files", files);
		
		
		return "/board/replyForm";
	}
	
	//답글처리
	@PostMapping("/reply/{returnPage}")
	public String reply(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("boardVO") BoardVO boardVO,
			BindingResult result,
			HttpServletRequest request) {
		logger.info("답글처리 :" + boardVO.toString());
		if(result.hasErrors()) {
			return "/board/replyForm";
		}
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		boardVO.setBid(memberVO.getId());
		boardVO.setBnickname(memberVO.getNickname());
		boardSVC.reply(boardVO);
		
		return "redirect:/board/view/"+returnPage+	"/"+boardVO.getBnum();
	}
	
}







