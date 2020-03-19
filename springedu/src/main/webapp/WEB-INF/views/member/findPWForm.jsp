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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SI BEL HOMME</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/sibelhomme.css' />">
    <style>
    /* 로그인 창 */
    #id,#tel,#birth,#pw,#pwChk {box-sizing: border-box;}
        .container{
            display: flex;
            justify-content: center;
        }
        .content {
    height: 500px; 
}
    .login-content>div {
            margin: 10px 0;
        }
        .login-wrapper{
            width: 300px;
        }
        /* .login-content input{
            width: 100%;
            border: 1px solid gray;
        } */
  
        .login-content input[type=checkbox] {
            width: 16px;
            height: 16px;
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

        #id-remember {
            font-size: 14px;
            color: gray;
        }
	
        table, #id, #tel, #birth, #pw, #pwChk {
            width: 100%;
            height: 36px;
            border: 1px solid gray;
            padding: 5px;
            font-size: 12px;
        }
        #findBtn {
   		      width: 100%;
        		background-color: #333;
				    color: #fff;
				    /* font-weight: 900; */
				    font-size: 12px;
				    line-height: 24px;
				    border: 1px solid #333;
				    padding: 10px;
        }
        #findBtn:hover {
        	background: white;
					color: #222;
					transition: 0.3s;
        }
        /* 비밀번호 찾기 */
        .find_info {
            margin-top: 20px;
            font-size: 0.6rem;
            color: gray;
            text-align: center;
            display: flex;
            justify-content: space-evenly;
        }
        .find_info>a {
            text-decoration: none;
            color: gray;
        }
        .find_info>a:hover {
            text-decoration: underline;
        }
        /* 오류 메세지 */
        .errmsg {
            color: red;
            font-Size: 0.7em;
            /* font-weight: bold; */
        }
                input[type=button] {
            width: 100%;
        }
        table {
            border: none;
        }
        tr.hide {
            display: none;
            color: gainsboro;
        }
    </style>
    <script src="<c:url value='/resources/js/common.js' />"></script>
    <script src="<c:url value='/resources/js/findPW.js' />"></script>
    <script src="<c:url value='/resources/js/mobilemenu.js' />"></script> 
</head>
<body>
<%@ include file="../header.jsp" %>
            <div class="content">
                        <div class="login-wrapper">
                            <!-- <form id="loginForm" action="login" method="post"> -->
                            <div class="title"><h3 class="notice">FORGOT PW</h3></div>
                                <div class="login-content">
																    <table>
																      <tr>
																        <th style="font-size: 12px;"><span style="font-size:14px; color: tomato;">*</span>ID</th>
																        <td><input type="text" name="id" id="id" placeholder="아이디"></td>
																      </tr>
																      <tr><td colspan="2" class="errmsg" id="id_errmsg"></td></tr>
																      <tr>
																        <th style="font-size: 12px;"><span style="font-size:14px; color: tomato;">*</span>MOBILE</th>
																        <td><input type="tel" name="tel" id="tel" placeholder="전화번호"></td>
																      </tr>
																      <tr><td colspan="2" class="errmsg" id="tel_errmsg"></td></tr>
																      <tr>
																        <th style="font-size: 12px;"><span style="font-size:14px; color: tomato;">*</span>BIRTH</th>
																        <td><input type="date" name="birth" id="birth"></td>
																      </tr>
																      <tr><td colspan="2" class="errmsg" id="birth_errmsg"></td></tr>
																      <tr class="hide">
																        <th style="font-size: 12px;"><span style="font-size:14px; color: tomato;">*</span>P/W</th>
																        <td><input type="password" name="pw" id="pw"></td>
																      </tr>
																      <tr class="hide"><td colspan="2" class="errmsg" id="pw_errmsg"> </td></tr>
																      <tr class="hide">
																        <th style="font-size: 12px;"><span style="font-size:14px; color: tomato;">*</span>P/W CHECK</th>
																        <td><input type="password" name="pwchk" id="pwChk"></td>
																      </tr>
																      <tr class="hide"><td colspan="2" class="errmsg" id="pwChk_errmsg"> </td></tr>
																      <tr>
																        <td colspan="2"><button id="findBtn">CHANGE PASSWORD</button></td>
																      </tr>
																       
																  </table>
                                </div>
                            <div class="find_info">
                                <a href="<c:url value='/member/findIDForm' />">FORGOT ID</a>
                                <span>|</span>
                                <a href="<c:url value='/member/findPWForm' />">FORGOT PW</a>
                            </div>
                        </div>       
                </div>
            </div>
<%@ include file="../footer.jsp" %>
