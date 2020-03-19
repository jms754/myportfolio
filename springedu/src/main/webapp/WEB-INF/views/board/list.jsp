<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
td>a:hover {
	text-decoration: underline;
}

.contents-inner {
	margin: 0 auto;
	max-width: 1200px;
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

table {
	width: 100%;
}

table, th, td {
	border-spacing: 0;
	border: 0;
	border-collapse: collapse;
	vertical-align: middle;
}

thead {
	border-top: 1px solid #dbdbdb;
}

th {
	font-size: 12px;
	padding: 10px 0;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
}

.tr-body {
	height: 50px;
}

td {
	border-bottom: 1px solid #dbdbdb;
	font-size: 12px;
	color: #444;
}

.ta-c {
	text-align: center;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

colgroup {
	display: table-column-group;
}

col {
	display: table-column;
}

.btn-area {
	display: flex;
	justify-content: flex-end;
	margin: 12px 0 0;
}

#writeBtn {
	margin-right: 5px;
	width: 100px;
	height: 42px;
	line-height: 40px;
	font-size: 11px;
	background: #222;
	border: 1px solid #222;
	color: #fff;
}

#writeBtn:hover, #searchBtn:hover {
	background: white;
	color: #222;
	transition: 0.3s;
}

nav {
	display: block;
}

.paging {
	padding: 20px 0 0;
	text-align: center;
}

.paging li {
	display: inline-block;
	margin: 0 2px;
}

.paging li a {
	height: 21px;
	text-align: center;
	display: block;
}

.front-paging {
	width: 27px;
	border: 1px solid #e0e0e0;
	text-indent: -9999px;
}

#ll {
	background:
		url("<c:url value='/resources/img/icon_arrow_page_ll.png' />")
		no-repeat center center;
}

#l {
	background:
		url("<c:url value='/resources/img/icon_arrow_page_l.png' />")
		no-repeat center center;
}

#r {
	background:
		url("<c:url value='/resources/img/icon_arrow_page_r.png' />")
		no-repeat center center;
}

#rr {
	background:
		url("<c:url value='/resources/img/icon_arrow_page_rr.png' />")
		no-repeat center center;
}

.paging-number {
	padding: 4px 10px 2px;
	font-size: 12px;
}

.search-area {
	padding: 10px;
	border: 1px solid #e8e8e8;
	border-left: 0;
	border-right: 0;
	background: #f7f7f7;
	margin-top: 30px !important;
	text-align: center;
}

.search-item {
	display: inline-block;
	background: #fff;
	vertical-align: middle;
}

#searchType {
	height: 28px;
	border: 1px solid #d0d0d0;
	font-size: 11px;
}

.search-item-keyword {
	width: 210px;
	height: 26px;
	border: 1px solid #d0d0d0;
}

#keyword {
	width: 100%;
	height: 24px;
	padding: 0;
	border: 1px solid #fff;
	color: #979797;
	line-height: 24px;
	font-size: 11px;
}

#searchBtn {
	width: 50px;
	height: 28px;
	line-height: 26px;
	font-size: 11px;
	background: #222;
	border: 1px solid #222;
	color: #fff;
}

#pagingnumber {
	border: 1px solid #3e3d3c;
}

.prev-next {
	padding: 0 0 6px;
}
</style>
<script src="<c:url value='/resources/js/mobilemenu.js' />"></script>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script>
	window.addEventListener("load", init, false);

	function init() {
		//글쓰기 버튼 클릭시
		<c:if test="${!empty member && boardName != 'NOTICE' || sessionScope.member.admin == 1 }">
		writeBtn.addEventListener("click",
				function(e) {
					e.preventDefault();
					let returnPage = e.target.getAttribute('data-returnPage');
					location.href = getContextPath() + "/board/writeForm/"
							+ returnPage;
				}, false);
	 </c:if>
		//검색버튼 클릭시
		searchBtn.addEventListener("click", function(e) {
			e.preventDefault();
			//console.log("검색!!");
			// 검색어 입력값이 없으면
			if (keyword.value.trim().length == 0) {
				alert('검색어를 입력하세요!');
				keyword.value = "";
				keyword.focus();
				return false;
			}

			let stype = searchType.value; //검색유형
			let kword = keyword.value.trim(); //검색어

			location.href = getContextPath() + "/board/list/"+"${boardName}" +"/1/" + stype + "/"
					+ kword;
		}, false);
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="content">
		<div class="contents-inner">
			<div class="section m2">
				<div class="section">
					<div class="title">
						<h3 class="notice">${boardName }</h3>
					</div>
				</div>
				<table>
					<colgroup>
						<col style="width: 80px" />
						<col style="width: 150px" />
						<col />
						<col style="width: 120px" />
						<col style="width: 150px" />
						<col style="width: 80px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:forEach var="rec" items="${list }">
						<fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd HH:mm"
							var="cdate" />
						<tbody>
							<tr class="tr-body">
								<td class="ta-c">${rec.bnum }</td>
								<td class="ta-c">${rec.boardCategoryVO.cname }</td>
								<td><c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach>
									<c:if test="${rec.bindent > 0 }">
										<i class="fas fa-reply"></i>
									</c:if> <a
									href="${pageContext.request.contextPath }/board/view/${pc.rc.reqPage }/${rec.bnum }">
										${rec.btitle } <c:if test="${rec.hasPicture eq 1}"><i class="fas fa-paperclip"></i></c:if> 
										</a></td>

								<td class="ta-c">${rec.bnickname }</td>
								<td class="ta-c">${cdate }</td>
								<td class="ta-c">${rec.bhit }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<div class="btn-area">
				<c:if test="${!empty member && boardName != 'NOTICE' || sessionScope.member.admin == 1 }">
					<button id="writeBtn" data-returnPage="${pc.rc.reqPage }">
						WRITE</button>
				</c:if>
				</div>
			</div>
			<nav>
				<ul class="paging">
					<!-- 처음페이지 / 이전페이지 이동 -->
					<c:if test="${pc.prev }">
						<li class="front-paging" id="ll"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/1"> <img
								src="<c:url value='/resources/img/icon_arrow_page_ll.png' />"
								alt="" />
						</a></li>
						<li class="front-paging" id="l"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/${pc.startPage-1}">
								<img
								src="<c:url value='/resources/img/icon_arrow_page_l.png' />"
								alt="" />
						</a></li>
					</c:if>

					<c:forEach var="pageNum" begin="${pc.startPage }"
						end="${pc.endPage }">
						<!-- 현재페이지와 요청페이지가 다르면 -->
						<c:if test="${pc.rc.reqPage != pageNum }">
							<li><a class="paging-number"
								href="${pageContext.request.contextPath }/board/list/${boardName }/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a></li>
						</c:if>
						<!-- 현재페이지와 요청페이지가 같으면 -->
						<c:if test="${pc.rc.reqPage == pageNum }">
							<li id="pagingnumber"><a class="paging-number"
								href="${pageContext.request.contextPath }/board/list/${boardName }/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a></li>
						</c:if>
					</c:forEach>
					<!-- 다음페이지 / 최종페이지 이동 -->
					<c:if test="${pc.next }">
						<li class="front-paging" id="r"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/${pc.endPage+1}">
								<img
								src="<c:url value='/resources/img/icon_arrow_page_r.png' />"
								alt="" />
						</a></li>
						<li class="front-paging" id="rr"><a class="prev-next"
							href="${pageContext.request.contextPath }/board/list/${boardName }/${pc.finalEndPage}">
								<img
								src="<c:url value='/resources/img/icon_arrow_page_rr.png' />"
								alt="" />
						</a></li>
					</c:if>
				</ul>
			</nav>
			<form>
				<div class="search-area">
					<div class="search-item">
						<select name="searchType" id="searchType">
							<option value="TC"
								<c:out value="${pc.fc.searchType == 'TC' ? 'selected':'' }"/>>제목+내용</option>
							<option value="T"
								<c:out value="${pc.fc.searchType == 'T' ? 'selected':'' }"/>>제목</option>
							<option value="C"
								<c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }"/>>내용</option>
							<option value="N"
								<c:out value="${pc.fc.searchType == 'N' ? 'selected':'' }"/>>작성자</option>
							<option value="I"
								<c:out value="${pc.fc.searchType == 'I' ? 'selected':'' }"/>>아이디</option>
						</select>
					</div>
					<div class="search-item">
						<div class="search-item-keyword">
							<input type="search" name="keyword" id="keyword"
								value="${pc.fc.keyword }" />
						</div>
					</div>
					<div class="search-item">
						<button id=searchBtn>검색</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>