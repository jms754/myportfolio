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
#ja, #area {
	width: 100%;
	box-sizing: border-box;
}
#area {
  resize: none;
}

.textfield, #category, #ja, #use {
	line-height: 24px;
}

#category {
	width: 200px;
	padding: 4px;
	box-sizing: border-box;
}

#use {
	width: 200px;
	box-sizing: border-box;
}

.contents-inner {
	margin: 0 auto;
	max-width: 1200px;
}

* {
	margin: 0;
	padding: 0;
}

div {
	display: block;
}

table {
	border-collapse: collapse;
	width: 100%;
}

.tailfield {
	display: flex;
	justify-content: center;
	margin-top: 16px;
}

.tail {
	margin-right: 5px;
	width: 100px;
	height: 42px;
	line-height: 40px;
	font-size: 11px;
}

#writeBtn {
	background: #222;
	border: 1px solid #222;
	color: #fff;
}

#cancelBtn {
	background: #dbdbdb;
	border: 1px solid #dbdbdb;
	color: #222;
}

#listBtn {
	background: white;
	border: 1px solid #dbdbdb;
	color: #222;
}

#writeBtn:hover, #cancelBtn:hover {
	opacity: 0.6;
	transition: .3s;
}

#listBtn:hover {
	border: 1px solid #222;
	transition: .3s;
}

.title {
	color: #333;
	margin: 0 0 20px;
	padding: 0 0 20px;
	text-align: center;
}

.write {
	display: inline-block;
	padding: 7px 14px;
	border-bottom: 1px solid #666;
	font-size: 13px;
}

th {
	padding: 10px;
	color: #777;
	background-color: #f9f9f9;
	border-bottom: 1px solid #dbdbdb;
	font-size: 12px;
}

td {
	padding: 10px;
	border-bottom: 1px solid #dbdbdb;
}

table, th, td {
	border-spacing: 0;
}

.cate {
	border-top: 1px solid #dbdbdb;
}

#cate1 {
	border-top: 1px solid #dbdbdb;
}

.errmsg {
	color: red;
	font-Size: 0.7em;
}
</style>

<script>
	window.addEventListener("load", init, false);
	function init() {
		//등록버튼 클릭시
		writeBtn.addEventListener("click", function(e) {
			e.preventDefault();
			//유효성체크

			//게시글 작성전송
			if(confirm('게시글을 등록하시겠습니까?')){
			document.getElementById("boardVO").submit();
			}
		}, false);
		//취소버튼 클릭시
		cancelBtn.addEventListener("click", function(e) {
			e.preventDefault();
			document.getElementById("boardVO").reset();
		}, false);
		//목록버튼 클릭시
		listBtn.addEventListener("click", function(e) {
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			location.href = getContextPath() + "/board/list/"+returnPage;
		}, false);
	}
</script>
<script src="<c:url value='/resources/js/mobilemenu.js' />"></script>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script src="<c:url value='/resources/ckeditor/ckeditor.js' />"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="content">
		<div class="contents-inner">
			<div class="section m2">
				<div class="section">
					<div class="title">
						<h3 class="write">WRITE</h3>
					</div>
				</div>
				<form:form action="${pageContext.request.contextPath }/board/write/${returnPage }"
					enctype="multipart/form-data" method="post"
					modelAttribute="boardVO">
					<div class="section-body">
						<div class="table1 board-write">
							<table>
								<colgroup>
									<col style="width: 133px;">
								</colgroup>
								<tbody>
									<tr>
										<th class="cate"><form:label path="boardCategoryVO.cid">분류</form:label></th>
										<td class="cate">
											<div class="textfield">
											<select name="boardCategoryVO.cid" id="category">
												<option value="0">====== SELECT ======</option>
												<c:if test="${sessionScope.member.admin == 1 }">
												<option value="1004">NOTICE</option>
												</c:if>
												<option value="1005">Q&A</option>
												<option value="1006">REVIEW</option>
											</select>
												<%-- <form:select path="boardCategoryVO.cid" id="category">
													<option value="0">====== SELECT ======</option>
													<form:options path="boardCategoryVO.cid"
														items="${boardCategoryVO }" itemValue="cid"
														itemLabel="cname" />
												</form:select> --%>
												<div>
													<form:errors cssClass="errmsg" path="boardCategoryVO.cid" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="bid">작성자</form:label></th>
										<td>
											<div class="textfield">
												<input id="use" type="text" readonly="true"
													value="${member.nickname }(${member.id})"></input>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="btitle">제목</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="text" id="ja" path="btitle" />
												<div>
													<form:errors cssClass="errmsg" path="btitle" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="bcontent">내용</form:label></th>
										<td>
											<div class="textfield">
												<form:textarea path="bcontent" id="area" cols="60" rows="18"></form:textarea>
												<script>
													 var ckeditor_config = {
													   resize_enaleb : false,
													   enterMode : CKEDITOR.ENTER_BR,
													   shiftEnterMode : CKEDITOR.ENTER_P,
													   filebrowserUploadUrl : "/admin/goods/ckUpload"
													 };
													 
													 CKEDITOR.replace("area", ckeditor_config);
													</script>
												<div>
													<form:errors cssClass="errmsg" path="bcontent" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="ta"><form:label path="files">첨부파일</form:label></th>
										<td>
											<div class="textfield">
												<form:input type="file" multiple="multiple" path="files" />
												<form:errors path="files" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="textfield">
						<div class="tailfield">
							<form:button class="tail" id="writeBtn" >등록</form:button>
							<form:button class="tail" id="cancelBtn">취소</form:button>
							<form:button class="tail" id="listBtn" data-returnPage="${returnPage }">목록</form:button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>