<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SI BEL HOMME</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/sibelhomme.css' />">
    <style>
			table { border-collapse:collapse; }
			table tr td{
				text-align: center;
			}
    </style>
		<script src="<c:url value='/resources/js/mobilemenu.js' />"></script> 
</head>
<body>
<%@ include file="../header.jsp" %>
 <div class="content">
                <div id="contents">
                    <div class="view">
                        <table border="1">
                        
												<caption><h3>회원 목록 리스트</h3></caption>
												<colgroup>
													<col width="15%"/>
													<col width="15%"/>
													<col width="10%"/>
													<col width="5%"/>
													<col width="30%"/>
													<col width="5%"/>
													<col width="5%"/>
													<col width="5%"/>
												</colgroup>
												<thead>
												<tr>
													<th>ID</th>
													<th>PASSWORD</th>
													<th>TEL</th>
													<th>NAME</th>
													<th>REGION</th>
													<th>BIRTH</th>
													<th>CDATE</th>
													<th>UDATE</th>
												</tr>
												</thead>
												<tbody>
												<c:forEach var="rec" items="${memberList }">
												<tr>
													<td>${rec.id}</td>
													<td>${rec.pw}</td>
													<td>${rec.tel}</td>
													<td>${rec.nickname}</td>
													<td>${rec.region}</td>
													<td>${rec.birth}</td>
													<td>${rec.cdate}</td>
													<td>${rec.udate}</td>
												</tr>
												</c:forEach>
												</tbody>
											</table>
                    </div>
                </div>        
                </div>
            </div>
        </div> 
<%@ include file="../footer.jsp" %>
</body>
</html>