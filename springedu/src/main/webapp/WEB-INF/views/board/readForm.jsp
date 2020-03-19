<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SI BEL HOMME</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/sibelhomme.css' />">
<style>
.contents-inner {
	margin: 0 auto;
	max-width: 1200px;
}

.content {
	height: auto;
}

.title {
	color: #333;
	margin: 0 0 20px;
	padding: 0 0 20px;
	text-align: center;
}

.notice {
	display: inline-block;
	padding: 7px 14px;
	border-bottom: 1px solid #666;
	font-size: 13px;
}

.board-view-head .board-view-title {
	overflow: hidden;
	background: #f7f7f7;
	border-top: 1px solid #dbdbdb;
	/* height: 20px; */
	padding: 15px;
	border-bottom: 1px solid #dbdbdb;
}

.board-title {
	font-size: 13px;
	font-weight: 600;
}

.board-view-info {
	padding: 10px 15px;
	border-bottom: 1px solid #dbdbdb;
	overflow: hidden;
}

.author {
	float: left;
	color: #111;
}

.board-id {
	font-size: 12px;
}

.divide-bar {
	vertical-align: middle;
	width: 1px;
	height: 16px;
	display: inline-block;
	background: #dbdbdb;
	margin: 0 10px;
}

.board-view-info .hit {
	float: right;
}

.board-view-body .textfield {
	border-bottom: 1px solid #dbdbdb;
	padding: 30px 16px;
	line-height: 1.8;
	font-size: 12px;
}

.btns {
	display: flex;
	justify-content: flex-end;
	margin-top: 16px;
	margin-bottom: 16px;
}

#replyBtn {
	background: #222;
	border: 1px solid #222;
	color: #fff;
}

#modifyBtn {
	background: white;
	border: 1px solid #dbdbdb;
	color: #222;
}

#deleteBtn {
	background: #222;
	border: 1px solid #222;
	color: #fff;
}

#listBtn {
	background: white;
	border: 1px solid #dbdbdb;
	color: #222;
}

#replyBtn:hover, #deleteBtn:hover {
	background: white;
	color: #222;
	transition: 0.3s;
}

#modifyBtn:hover, #listBtn:hover {
	border: 1px solid #222;
	transition: 0.3s;
}

#replyBtn1:hover {
	background: #464646;
	transition: 0.3s;
}

.btn {
	margin-right: 5px;
	width: 80px;
	height: 42px;
	line-height: 40px;
	font-size: 11px;
}

.col-1 {
	font-size: 12px;
}

.fileList {
	font-size: 11px;
}

.board-view-comment {
	padding: 15px 0;
}

.reply_comment {
	background-color: #f7f7f7;
}

.comment {
	border-top: 1px solid #dbdbdb;
}

.area-comment {
	position: relative;
	overflow: hidden;
	padding: 15px;
}

.pic {
	float: left;
	max-width: 105px;
	padding: 0 20px 0 0;
	color: #444;
	word-wrap: break-word;
	height: 40px;
}

.recontent {
	width: auto;
	float: none;
	overflow: hidden;
	margin-right: 70px;
	max-width: none;
	font-size: 12px;
}

.reply-btn {
	position: absolute;
	top: 15px;
	right: 15px;
}

.textarea {
	padding: 10px;
	margin-right: 3px;
	border-width: 1px;
	border-style: solid;
	border-color: rgba(139, 139, 139, 0.3);
	background-color: #fff;
}

#rcontent, .rrcontent {
	overflow: hidden;
	line-height: 14px;
	height: 65px;
	width: 100%;
	resize: none;
	font-size: 12px;
	margin-left: 2px;
	
}

table {
	width: 100%;
	padding: 15px;
	background-color: #f7f7f7;
	border-bottom: 1px solid #dbdbdb;
	border-top: 1px solid #dbdbdb;
}

#commentBtn {
	width: 80px;
	height: 67px;
	line-height: 40px;
	font-size: 11px;
	background: #c7c7c7;
	border: 1px solid #c7c7c7;
	color: #fff;
}
/* 공통 */
    .lm-1{ margin-left: 10px; } .lm-2{ margin-left: 20px; } .lm-3{ margin-left: 30px; } .lm-4{ margin-left: 40px; } .lm-5{ margin-left: 50px; }
    .lm-6{ margin-left: 60px; } .lm-7{ margin-left: 38px; padding: 0 15px 15px 0;  } .lm-8{ margin-left: 80px; } .lm-9{ margin-left: 90px; } .lm-10{ margin-left: 100px; }
  
    .fw-1{min-width:10px;} .fw-2{min-width:20px;} .fw-3{min-width:30px;} .fw-4{min-width:40px;} .fw-5{min-width:50px;}
    .fw-6{min-width:60px;} .fw-8{min-width:80px;} .fw-9{min-width:90px;} .fw-10{min-width:100px;} .fw-14{min-width:65px;} 
    .fw-15{min-width:150px;}
    
    .pw-1{width:10%;} .pw-2{width:20%;} .pw-3{width:30%;} .pw-4{width:40%;} .pw-5{width:50%;}
    .pw-6{width:60%;} .pw-7{width:70%;} .pw-8{width:80%;} .pw-9{width:90%;} .pw-10{width:100%;}

    #reply .row, 
    #replyList .row { display:flex; }

    /* 댓글작성 */
    #reply{
     width:100%;
    }
    .write1 {
     padding: 15px; 
    }
    #reply .row{ display:flex; }    
    #reply #rcontent{ width:100%; }
    #replyBtn1, .rreplyBtn, .rreplyModifyBtn { 	
    width: 80px;
		height: 67px;
		margin-left: 5px;
		line-height: 40px;
		font-size: 11px;
		background: #c7c7c7;
		border: 1px solid #c7c7c7;
		color: #fff; }
      
    /* 댓글 목록 */  
    #replyList{
      width:100%;
    }
    #replyList .row { display:flex; }    
    #replyList .row.header .col:nth-child(4){
      display:flex;
      justify-content: flex-end;
    }
    .content-area {
    width: auto;
    float: none;
    overflow: hidden;
    margin-right: 50px;
    max-width: none;
    }
    /* 페이징 */
    #paging {
      border-top: 1px solid #dbdbdb;
      display:flex;
      justify-content: center;
    }
    #paging a {
    	padding:3px;
    	margin:0 3px;
    }
    #paging .active{
    	background-color: #444;
    	color: white;
    }
    .reply-icon {
    	font-size: 13px;
    }
    .reply-icon .votes {
    	color: gray; 
    }
    .replyfont {
     font-size: 14px;
    }
    .reply-count {
    	border-top: 1px solid #dbdbdb;
    	padding:10px 15px;
    }
    .reply-area1 {
    	border-top: 1px solid #dbdbdb;
    	border-bottom: 1px solid #dbdbdb;
    	background: #F8F8F8;
    }
    .replyarea1 {
   	  border-top: 1px solid #dbdbdb;
    	padding: 15px;
    }
    /* fontawesome 아이콘  색지정 */
    .fa-thumbs-up:hover{color:dodgerblue;}
    .fa-thumbs-down:hover{color:Tomato}
    
</style>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script src="<c:url value='/resources/js/mobilemenu.js' />"></script>
<script>
	window.addEventListener("load", init, false);
	function init() {
		/* changeMode(false); */
		<c:if test="${!empty member && boardVO.boardCategoryVO.cname != 'NOTICE' || sessionScope.member.admin == 1}">
		let modifyBtn = document.getElementById('modifyBtn');
		let deleteBtn = document.getElementById('deleteBtn');
		let replyBtn = document.getElementById('replyBtn');
		let listBtn = document.getElementById('listBtn');
		//답글
		replyBtn.addEventListener("click", function(e) {
			e.preventDefault();
			console.log("답글");
			let returnPage = e.target.getAttribute('data-returnPage');
			let bnum = e.target.getAttribute('data-bnum');
			location.href = getContextPath() + "/board/replyForm/" + returnPage
					+ "/" + bnum;
		}, false);
		

		//수정
		<c:if test="${sessionScope.member.id == boardVO.bid || sessionScope.member.admin == 1 }">
		modifyBtn.addEventListener("click", function(e) {
			e.preventDefault();
			console.log("수정");
			let returnPage = e.target.getAttribute('data-returnPage');
			let bnum = e.target.getAttribute('data-bnum');
			location.href = getContextPath() + "/board/modifyForm/"
					+ returnPage + "/" + bnum;
		}, false);
		//삭제
		deleteBtn.addEventListener("click", function(e) {
			e.preventDefault();
			//console.log("삭제"+e.target.getAttribute('data-bnum'));

			if (confirm("삭제하시겠습니까?")) {
				let returnPage = e.target.getAttribute('data-returnPage');
				let bnum = e.target.getAttribute('data-bnum');
				location.href = getContextPath() + "/board/delete/" +"${boardVO.boardCategoryVO.cname}/" 
						+ returnPage + "/" + bnum;
			}
		}, false);
		</c:if>
	 </c:if>
		//목록
		listBtn.addEventListener("click", function(e) {
			e.preventDefault();
			console.log("목록");
			let returnPage = e.target.getAttribute('data-returnPage');
			location.href = getContextPath() + "/board/list/"+"${boardVO.boardCategoryVO.cname }" +"/"+ returnPage;
		}, false);



		//첨부파일 1건 삭제 : Ajax로 구현함.
		let fileList = document.getElementById('fileList');
		if (fileList != null) {
			fileList
					.addEventListener(
							"click",
							function(e) {
								console.log(e.target); //이벤트가 발생된 요소
								console.log(e.currentTarget);//이벤트가 등록된 요소
								console.log(e.target.tagName);
								//선택된 요소가 첨부파일 삭제 아이콘일때만 삭제처리 수행
								if (e.target.tagName != 'I')
									return false;
								if (!confirm('삭제 하시겠습니까?'))
									return false;
								//실제 이벤트가 발생한요소의 data-del_file속성값 읽어오기
								let fid = e.target
										.getAttribute('data-del_file');

								//AJAX 사용
								//1) XMLHttpRequest객체 생성	
								var xhttp = new XMLHttpRequest();

								//2) 서버응답처리
								xhttp.addEventListener("readystatechange",
										ajaxCall, false);
								function ajaxCall() {
									if (this.readyState == 4
											&& this.status == 200) {
										console.log(this.responseText);
										if (this.responseText == "success") {
											console.log('성공!!');
											//삭제대상 요소 찾기
											let delTag = e.target.parentElement.parentElement.parentElement;
											//부모요소에서 삭제대상 요소 제거
											fileList.removeChild(delTag);
										} else {
											console.log('실패!!');
										}
									}
								}

								//post방식
								xhttp.open("DELETE",
										"http://localhost:9080/portfolio/board/file/"
												+ fid, true);
								xhttp.send();
							}, false);
		}
	}

	/* 	//읽기 모드 , 수정모드
	 function changeMode(flag){						
	 let rmodes = document.getElementsByClassName("rmode");
	 let umodes = document.getElementsByClassName("umode");
	 //수정모드	
	 if(flag){
	 //제목변경 => 게시글 보기
	 document.getElementById("title").textContent = '게시글 수정';
	 //분류,필드 제목,내용 필드
	 document.getElementById("boardCategoryVO.cid").removeAttribute("disabled");			
	 document.getElementById("btitle").removeAttribute("readOnly");			
	 document.getElementById("bcontent").removeAttribute("readOnly");		
	 //수정모드버튼 활성화
	 Array.from(rmodes).forEach(e=>{e.style.display="none";});
	 Array.from(umodes).forEach(e=>{e.style.display="block";});
	 //읽기모드	
	 }else{
	 //제목변경 => 게시글 보기
	 document.getElementById("title").textContent = '게시글 보기';
	 //분류,필드 제목,내용 필드
	 document.getElementById("boardCategoryVO.cid").setAttribute("disabled",true);						
	 document.getElementById("btitle").setAttribute("readOnly",true);
	 document.getElementById("bcontent").setAttribute("readOnly",true); 
	 //읽기모드버튼 활성화				
	 Array.from(rmodes).forEach(e=>{e.style.display="block";});
	 Array.from(umodes).forEach(e=>{e.style.display="none";});
	 }
	 } */
		window.addEventListener("load",init2,false);
		//let l_bnum = 2068;		//게시 원글번호
		let l_bnum = ${boardVO.bnum }
		let l_page = 1;				//요청페이지
		let l_id 				= "${sessionScope.member.id}";									//로그인 아이디
		let l_nickname 	= "${sessionScope.member.nickname}";						//로그인 별칭
		let l_url 			= "${pageContext.request.contextPath}/rboard"; 	//공통 URL

		const GOOD = '1', BAD = '2'; //호감'1', 비호감'2'

		// 대댓글 작성 html코드 시작--------------------------------
		let rereply_str = "";
		rereply_str = '<div class="row">┗';
		rereply_str = '<textarea name="rcontent" id="rcontent"></textarea>';
		rereply_str = '<button id="rereplyBtn">등록</button>';
		rereply_str = '</div>';
		// 대댓글 작성 html코드 끝----------------------------------
		
		function init2(){

			//댓글목록 가져오기
			replyList(l_page);  

			//페이지번호 클릭시 이벤트 처리
			paging.addEventListener("click",function(e){
				e.preventDefault();
				if(e.target.tagName == 'A'){
	 				console.log("페이지 클릭됨!!");
	 				l_page = e.target.getAttribute("href");
					replyList(l_page);
				} 
			},false);

			//댓글작성
			replyBtn1.addEventListener("click",function(){
				//console.log("댓글작성버튼 클릭됨!");
				let rcontentTag = document.getElementById("rcontent")
				let rcontent = rcontentTag.value;
				
				let xhttp = new XMLHttpRequest();
				xhttp.addEventListener("readystatechange",function(){
					if(this.readyState == 4 && this.status == 200){
						console.log(this.responseText);
						if(this.responseText == 'success'){
							replyList(l_page);
							rcontentTag.value = "";
							rcontentTag.focus();
						}else{
							console.log('댓글작성오류!!');
						}
					}
				});

			 //전송데이터 json포맷으로 만들기
	     let sendData = {};
	     sendData.bnum  = l_bnum;
	     sendData.rid 	= l_id;
	     sendData.rnickname = l_nickname;
	     sendData.rcontent = rcontent;
	     
	     //자바스크립트 obj => json포맷 문자열 변환
	     let result = JSON.stringify(sendData);
	     //console.log(result);
		     				
	     //post방식
	     xhttp.open("POST",l_url,true);
	     xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
	     xhttp.send(result);				
				
			},false);
			let replyListTag = document.getElementById("replyList");
			replyListTag.addEventListener("click",function(e){
				//댓글목록에서 'I'태그의 자식 태그에서만 반응하기
				if(e.target.tagName != 'I') return false;
				//이벤트가 일어난 지점에서 data-rnum속성을 포함한 요소를 찾아서 data-rnum값을 추출한다.
				let parentTags = parents(e.target);
				let rnumTag    = parentTags.find( tag => {	if(tag.hasAttribute("data-rnum")){
														return tag;
													}});
				let data_rnum =	rnumTag.getAttribute("data-rnum");
				
				   
				if(e.target.classList.contains('replyDeleteBtn')){
					//console.log('삭제버튼 클릭됨'+data_rnum);
					if(confirm('삭제하시겠습니까?')){
						doDelete(e.target, data_rnum);
					}
				}else if(e.target.classList.contains('replyModifyBtn')){
					console.log('수정버튼 클릭됨'+data_rnum);

					doReplyModifyTrigger(replyListTag,'rereplyCancelBtn');
					doReplyModifyTrigger(replyListTag,'replyModifyCancelBtn');
						
					//1) 아이콘 토글
					e.target.classList.toggle("replyModifyBtn");
					e.target.classList.toggle("fa-edit");

					e.target.classList.toggle("replyModifyCancelBtn");
					e.target.classList.toggle("fa-window-close");		 			
					//2) 대댓글수정양식을 대댓글 대상 아래 추가하기 
					console.log(rnumTag);
					console.log(rnumTag.nextElementSibling);
										
					let row_1 = elt("textarea",{name:"rrcontent", class:"rrcontent"});
					let row_2 = elt("button",{class:"rreplyModifyBtn"},"수정");							
					let rreplyModifyForm = elt("div",{class:"row rreplyModify lm-7"},"┗",row_1,row_2);
					 					
					row_2.addEventListener("click",function(){
						//대댓글 수정 처리하기
						doModify(data_rnum,row_1.value);
					},false);
					replyListTag.insertBefore(rreplyModifyForm,rnumTag.nextElementSibling);
					replyListTag.getElementsByClassName("rrcontent")[0].value
						= rnumTag.getElementsByClassName("rcontent")[0].textContent;					
				}else if(e.target.classList.contains('replyModifyCancelBtn')){
					console.log('수정버튼 취소 클릭됨'+data_rnum);

					//1)
					e.target.classList.toggle("replyModifyBtn");
					e.target.classList.toggle("fa-edit");

					e.target.classList.toggle("replyModifyCancelBtn");
					e.target.classList.toggle("fa-window-close");							
					//2) 대댓글입력양식을 제거하기 
					replyListTag.removeChild(rnumTag.nextElementSibling);
					
				}else if(e.target.classList.contains('goodBtn')){
					//console.log('호감버튼 클릭됨'+data_rnum);
					doGoodOrBad(e.target, data_rnum, GOOD);
				}else if(e.target.classList.contains('badBtn')){
					//console.log('비호감버튼 클릭됨'+data_rnum);
					doGoodOrBad(e.target, data_rnum, BAD);
				}else if(e.target.classList.contains('rereplyBtn')){
					console.log('댓글버튼 클릭됨'+data_rnum);
					doReplyModifyTrigger(replyListTag,'rereplyCancelBtn');
					doReplyModifyTrigger(replyListTag,'replyModifyCancelBtn');
					 
					//1) 아이콘 토글
					e.target.classList.toggle("rereplyBtn");
					e.target.classList.toggle("fa-reply");
					e.target.classList.toggle("rereplyCancelBtn");
					e.target.classList.toggle("fa-window-close");
							 			
					//2) 대댓글입력양식을 대댓글 대상 아래 추가하기 
					console.log(rnumTag);
					console.log(rnumTag.nextElementSibling);
					//rnumTag.nextElementSibling.innerHTML = rereply_str;					
					let row_1 = elt("textarea",{name:"rrcontent", class:"rrcontent"}); 
					let row_2 = elt("button",{class:"rreplyBtn"},"등록");							
					let rreplyForm = elt("div",{class:"row rreply lm-7"},"┗",row_1,row_2);
					 	
					row_2.addEventListener("click",function(){
						//대댓글 등록 처리하기
						doReply(data_rnum,row_1.value);
					},false);
					
					replyListTag.insertBefore(rreplyForm,rnumTag.nextElementSibling);
					replyListTag.getElementsByClassName("rrcontent")[0].placeholder
						= rnumTag.getElementsByClassName("rnickname")[0].textContent+"님께 답글쓰기";

				}else if(e.target.classList.contains('rereplyCancelBtn')){
	
					//1) 아이콘 토글
					console.log('댓글버튼 클릭됨'+data_rnum);
					e.target.classList.toggle("rereplyBtn");
					e.target.classList.toggle("fa-reply");

					e.target.classList.toggle("rereplyCancelBtn");
					e.target.classList.toggle("fa-window-close");					
					//2) 대댓글입력양식을 제거하기 
					replyListTag.removeChild(rnumTag.nextElementSibling);
				}
			},false);
		}
		
		//이벤트 트리거
		function doReplyModifyTrigger(i_pnode,i_findClass){
			Array.from(i_pnode.getElementsByClassName(i_findClass))
			 .forEach(item=>{item.click()});
		}
		
		//댓글 수정
		function doModify(i_rnum,i_rcontent){

			let xhttp = new XMLHttpRequest();
			xhttp.addEventListener("readystatechange",function(){
				if(this.readyState == 4 && this.status == 200){
						console.log(this.responseText);
					if(this.responseText == 'success'){
						replyList(l_page);
					}else{
						console.log('대댓글 수정 오류!!');
					}
				}
			});		
			let sendData = {};
			sendData.rnum = i_rnum; 						//수정할 댓글번호
			sendData.rcontent = i_rcontent;			//대댓글내용
			
			let result = JSON.stringify(sendData);
					
		  xhttp.open("PUT",l_url,true);
		  xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
		  xhttp.send(result);			
		}
		//대댓글 등록
		function doReply(i_rnum,i_rcontent){

			let url = l_url+"/reply";
			let xhttp = new XMLHttpRequest();
			xhttp.addEventListener("readystatechange",function(){
				if(this.readyState == 4 && this.status == 200){
						console.log(this.responseText);
					if(this.responseText == 'success'){
						replyList(l_page);
					}else{
						console.log('대댓글 작성 오류!!');
					}
				}
			});		
			let sendData = {};
			sendData.bnum = l_bnum; 						//게시글 원글
			sendData.rid  = l_id;	 							//작성자
			sendData.rnickname = l_nickname;		//별칭
			sendData.rcontent = i_rcontent;			//대댓글내용
			sendData.prnum =	i_rnum;						//부모댓글 
			
			let result = JSON.stringify(sendData);
					
		  xhttp.open("POST",url,true);
		  xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
		  xhttp.send(result);					
		}
		//댓글 삭제
		function doDelete(i_node, i_rnum){
			let url = l_url+"/"+i_rnum;
			let xhttp = new XMLHttpRequest();
			xhttp.addEventListener("readystatechange",function(){
				if(this.readyState == 4 && this.status == 200){
						console.log(this.responseText);
					if(this.responseText == 'success'){
						replyList(l_page);
					}else{
						console.log('삭제오류!!');
					}
				}
			});			

  xhttp.open("DELETE",url,true); 
  xhttp.send();				
		}
		//호감,비호감
		function doGoodOrBad(i_node, i_rnum, i_vote){
			let url = l_url+"/vote";
			let xhttp = new XMLHttpRequest();
			xhttp.addEventListener("readystatechange",function(){
				if(this.readyState == 4 && this.status == 200){
						console.log(this.responseText);
					if(this.responseText == 'success'){
						replyList(l_page);
					}else{
						console.log('호감,비호감 오류!!');
					}
				}
			});			
		 let sendData = {};
		 sendData.rnum = i_rnum; //댓글번호
		 sendData.bnum = l_bnum; //게시글 원글
		 sendData.rid  = l_id;	 //작성자
		 sendData.vote = i_vote; //호감,비호감	

		 let result = JSON.stringify(sendData);
		 		
  xhttp.open("PUT",url,true);
  xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
  xhttp.send(result);				
		}

		/*-----------------------------------------------------------------------*
		 * 노드 생성 함수
		 * 주어진 이름(name)과 속성(attributes), 자식 노드를 포함하는 요소를 만들어서 반환하는 함수
		 *-----------------------------------------------------------------------*/
		function elt(name, attributes) {
			var node = document.createElement(name);
			if( attributes ) {
				for(var attr in attributes) {
					if(attributes.hasOwnProperty(attr)) {
						node.setAttribute(attr,attributes[attr]);
					}
				}
			}
			for(var i=2; i<arguments.length; i++) {
				var child = arguments[i];
				if( typeof child == "string" ) {
					child = document.createTextNode(child);
				}
				node.appendChild(child);
			}
			return node;
		}
				
		/* 특정 노드를 매개값으로 받아서 조상노드를 찾아서 배열에 저장하기 */
		function parents(node) {     
			let current = node,         
			list    = [];     
			while(	current.parentNode != null && 
							current.parentNode != document.documentElement) {
				//존재하는 부모노드를 배열에 추가       
				list.push(current.parentNode);
				//현재노드 갱신     
				current = current.parentNode;    
			}     
			return list;
		}
				
		//댓글목록 가져오기
		function replyList(reqPage){
			let url = l_url+"/"+l_page+"/"+l_bnum;
			
			console.log(url);
			//Ajax Call
			//1)
			let xhttp = new XMLHttpRequest();
			//2)
			xhttp.addEventListener("readystatechange",function(){
				var reply = document.getElementById('reply');
				var sessionId= reply.getAttribute('data-sessionid');
				var sessionAdmin = reply.getAttribute('data-sessionadmin');
				
				if(this.readyState == 4 && this.status == 200){
					console.log(this.responseText);
					let jsObj = JSON.parse(this.responseText);
					let str = "";
					jsObj.list.forEach( e => {
/* 						console.log("rid=" + e.rid + "," + typeof e.rid + " , length="+ e.rid.length);
						console.log("sessionId=" + sessionId +", " + typeof sessionId + ", length="+ sessionId.length); */
/* 						console.log("rnum="+e.rnum);
						console.log("rid="+e.rid);
						console.log("rnickname="+e.rnickname); */

						str += '<div class="row pw-10" data-rnum="'+e.rnum+'" >';
						if(e.rindent == 0){
							str += '  <div class="row pw-10 replyarea1">';
						}else{
							str += '  <div class="row pw-10 replyarea1" style="padding-left: 38px;">┗';
						}
						str += '    <div class="col fw-7"><i class="fas fa-user-circle fa-2x" style="padding: 5px 10px 10px 0px;"></i></div>';
						str += '    <div class="col pw-10">';
						str += '      <div class="row header pw-10">';
						str += '        <div class="col fw-14">';
						str += '					<small><b>'+e.rnickname+'</b></small>';
						str += '					</div>';
						str += '        <div class="col fw-15"><small>'+e.rcdate+'</small></div>';
						str += '        <div class="col"><span class="replyfont"><i class="fas fa-reply rereplyBtn" title="댓글달기"></i></span></div>';
						str += '        <div class="col pw-10">';
						str += '          <div class="row">';
						if(sessionId === e.rid || sessionAdmin == 1){
							str += '            <div class="col" style="padding-right: 5px;"><span class="replyfont"><i class="fas fa-edit replyModifyBtn" title="수정하기"></i></span></div>	';
							str += '            <div class="col" style="padding-right: 5px;"><span class="replyfont"><i class="far fa-trash-alt replyDeleteBtn" title="삭제하기"></i></span></div>';
						}
						str += '          </div>';
						str += '        </div>';
						str += '      </div>';
						str += '      <div class="row body">';
						if(e.rindent == 0){
							str += '  <div class="col"></div>';
						}else{
							str += '  <div class="col fw-5 rm-1" style="color: gray;font-size: 11px;">@'+e.prnickname+'&nbsp;&nbsp;</div>';
						}						
						str += '        <div class="col rcontent replyfont"><p class="content-area">'+e.rcontent+'</p></div>';
						str += '      </div>';
						str += '      <div class="row bottom">';
						str += '        <div class="col fw-5" ><span class="replyfont"><i class="fas fa-thumbs-up goodBtn  title="호감"></i></span>('+e.good+')</div>';
						str += '        <div class="col fw-5" ><span class="replyfont"><i class="fas fa-thumbs-down badBtn title="비호감"></i></span>('+e.bad+')</div>';
						str += '      </div>';
						str += '    </div>';
						str += '  </div>';
						str += '</div>';					

						document.getElementById('replyList').innerHTML = str;

					});//jsObj.list.forEach 
					
					//페이지징
					//이전페이지 여부
					str = "";
					if(jsObj.pc.prev){
						str += '<a href="1">◀</a>';
					  str += '<a href="'+(jsObj.pc.startPage-1)+'">◁</a>';
					}
					//페이지 1~10
					for(let i=jsObj.pc.startPage, end=jsObj.pc.endPage; i<=end; i++){
						//현재 페이지와 요청페이지가 다르면
						if(jsObj.pc.rc.reqPage != i ){
							str += '<a href="'+i+'">'+i+'</a>';
						}else{
							str += '<a href="'+i+'" class="active">'+i+'</a>';
						}
					}

					//다음페이지 여부
					if(jsObj.pc.next){
				    str += '<a href="'+(jsObj.pc.endPage+1)+'">▷</a>';
				    str += '<a href="'+(jsObj.pc.finalEndPage)+'">▶</a>';
					}		
					document.getElementById('paging').innerHTML = str;		
				}
		  },false);
			//3)
			xhttp.open("GET",url,true);
			xhttp.send();
		}
</script>
</head>
<body>

	<%@ include file="../header.jsp"%>
		<div class="content">
			<div class="contents-inner">
			<form:form
				action="${pageContext.request.contextPath }/board/modify/${returnPage }"
				enctype="multipart/form-data" method="post" modelAttribute="boardVO">
				<fmt:formatDate value="${boardVO.bcdate }" pattern="yyyy-MM-dd HH:mm"
					var="cdate" />
				<form:hidden path="bnum" />
				<div class="section">
					<div class="title">
						<h3 class="notice">${boardVO.boardCategoryVO.cname }</h3>
					</div>
					<div class="section-body">
						<div class="board-view">
							<div class="board-view-head">
								<div class="board-view-title">
									<span class="board-id">${boardVO.bnum }</span> <span
										class="divide-bar">&nbsp;</span> <span class="board-id">${boardVO.boardCategoryVO.cname }</span>
									<span class="divide-bar">&nbsp;</span> <span
										class="board-title">${boardVO.btitle }</span>
								</div>
								<div class="board-view-info">
									<div class="author">
										<span class="board-id"> <strong>${boardVO.bnickname }(${boardVO.bid })</strong>
										</span> <span class="divide-bar">&nbsp;</span> <span class="board-id">${cdate }</span>
									</div>
									<div class="hit">
										<span class="board-id"><strong>조회수</strong>
											${boardVO.bhit }</span>
									</div>
								</div>
								<!-- 첨부목록 -->
								<c:if test="${!empty files}">
									<div class="board-view-info">
										<strong class="col-1"><i class="fas fa-paperclip"></i>첨부파일</strong>
										<c:forEach var="file" items="${files }">
											<a class="fileList"
												style="text-decoration: underline; color: #777;"
												href="${pageContext.request.contextPath }/board/file/${file.fid }">@${file.fname }</a>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<div class="board-view-body">
								<div class="textfield">
									<p>${boardVO.bcontent }</p>
								</div>
							</div>
							<!-- <div class="board-view-comment">
								<ul class="reply_comment">
									<li class="comment">
										<div class="area-comment">
											<div class="user-infomation">
												<div class="box-profile">
													<p class="pic"><img src="" alt="사진" /></p>
												</div>
												<span class="reply-nickname">닉네임</span> 
												<span class="reply-cdate">작성일</span> 
												
												<p class="recontent">
													댓글내용입니다<br />반갑습니다<br />잘부탁드립니다<br />좋은하루되세요 ^^
												</p>
											</div>
											<div class="reply-btn">
												<button>수정</button>
												<button>삭제</button>
											</div>
											<div class="good-bad-rereply">
						            <div class="col fw-10"><span><a href="#" class="goodBtn" data-rnum="">선호</a></span>(3)</div>
						            <span><a href="#" class="badBtn" data-rnum="">비선호</a></span>(1)</div>
						            <span class="reply-rereply"><a href="">답글</a></span>
											</div>
										</div>
									</li>
								</ul> -->

								<!-- <table class="reply">
									<tbody>
										<tr>
											<td style="width: 100%">
												<div class="textarea">
													<textarea name="rcontent" id="rcontent"
														placeholder="댓글 내용을 입력하세요."></textarea>
												</div>
											</td>
											<td>
												<button id="commentBtn">등록</button>
											</td>
										</tr>
									</tbody>
								</table> -->
							</div>
						</div>
						<div class="btns">
 							<c:if test="${!empty member && boardVO.boardCategoryVO.cname != 'NOTICE' || sessionScope.member.admin == 1}">
							<form:button class="btn" id="replyBtn"
								data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">답글</form:button>
							<!-- 작성자만 수정,삭제 가능 시작 -->
							<c:if test="${sessionScope.member.id == boardVO.bid || sessionScope.member.admin == 1 }">
								<form:button class="btn" id="modifyBtn"
									data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">수정</form:button>
								<form:button class="btn" id="deleteBtn"
									data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">삭제</form:button>
 							</c:if>
 							</c:if>
							<!-- 작성자만 수정,삭제 가능 끝 -->
							<form:button class="btn" id="listBtn"
								data-returnPage="${returnPage }">목록</form:button>
						</div>
					</div>
	</form:form>
	  	<!-- 댓글 달기 -->
	  	<div class="reply-count"><p><strong>0</strong> 개의 댓글이 있습니다.</p></div>
	  	<div class="reply-area1">
	  	<div class="reply-area">
  <div id="reply" data-sessionid="${sessionScope.member.id}" data-sessionadmin="${sessionScope.member.admin}">
    <div class="row write1" >
      <textarea name="rcontent" id="rcontent" placeholder="댓글 내용을 입력하세요."><c:out value="${content}" /></textarea>
      <button id="replyBtn1">등록</button>
    </div>
  </div>
  <!-- 댓글 목록-->
  <div id="replyList">
    
  </div>
  <!--페이징-->
  <div id="paging">

  </div>
  </div>
  </div>

				</div>
			</div>
	
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>