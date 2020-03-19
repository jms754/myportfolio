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
     #id, #pw {box-sizing: border-box;}
        .container{
            display: flex;
            justify-content: center;
        }
        .content {
    display: flex;
    flex-direction: column;
    height: 500px; 
				}
    .login-content>div {
            margin: 10px 0;
        }
        .login-wrapper{
            width: 300px;
        }
        .login-content input{
            width: 100%;
            border: 1px solid gray;
        }
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
        
        #id,#pw {
            width: 100%;
            height: 36px;
            border: 1px solid gray;
            padding: 5px;
            font-size: 12px;
        }
        #loginBtn {
            background-color: #333;
				    color: #fff;
				    /* font-weight: 900; */
				    font-size: 12px;
				    line-height: 24px;
				    border: 1px solid #333;
				    padding: 10px;
        }
        #loginBtn:hover {
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
    </style>
    <script src="<c:url value='/resources/js/login.js' />"></script>
    <script src="<c:url value='/resources/js/mobilemenu.js' />"></script> 
</head>
<body>
<%@ include file="../header.jsp" %>
            <div class="content">
                        <div class="login-wrapper">
                            <!-- <form id="loginForm" action="login" method="post"> -->
                            <form action="<c:url value='/login?reqURI=${reqURI }' />" id="loginForm" method="post" >
                            <div class="title"><h3 class="notice">LOG-IN</h3></div>
                                <div class="login-content">
                                    <div><input type="text" name="id" id="id" value="" placeholder="아이디"></div>
                                    <div><span id="idMsg"></span></div>
                                    <div><input type="password" name="pw" id="pw" placeholder="비밀번호"></div>
                                    <div><span id="pwMsg" class="errmsg"><c:if test="${!empty svr_msg }">${svr_msg }</c:if></span></div>
                                    <div><input type="submit" id="loginBtn" value="L O G I N"></div>
                                </div>
                            </form>
                            <div class="find_info">
                                <a href="<c:url value='/member/findIDForm' />">FORGOT ID</a>
                                <span>|</span>
                                <a href="<c:url value='/member/findPWForm' />">FORGOT PW</a>
                                <span>|</span>
                                <a href="<c:url value='/member/joinForm' />">REGISTER</a>
                            </div>
                        </div>
                </div>
            </div>
<%@ include file="../footer.jsp" %>
