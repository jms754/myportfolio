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
    * {box-sizing: border-box;}
        .container{
            display: flex;
            justify-content: center;
            margin-top: 150px;
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
        .login-content input[type=submit] {
            background-color: #333;
            color: #fff;
            font-weight: 900;
            border: 1px solid gray;
            /* padding: 10px; */

        }
        .login-content input[type=checkbox] {
            width: 16px;
            height: 16px;
        }
        .login-title {
            text-align: center;
            font-size: 16px;
            margin: 0 0 20px;
            padding: 0 0 20px;
            color: #333;
            border-bottom: 2px solid gray;
        }
        #loginForm {
            border-bottom: 2px solid gray;
            padding: 10px;
        }
        #id-remember {
            font-size: 14px;
            color: gray;
        }
        
        #id,#pw, #loginBtn {
            width: 100%;
            border: 1px solid gray;
            padding: 5px;
        }
        /* 비밀번호 찾기 */
        .find_info {
            margin-top: 20px;
            font-size: 0.6rem;
            color: gray;
            text-align: center;
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
    <script src="<c:url value='/resources/js/mobilemenu.js' />"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
                <div id="contents">
                    <div class="view">
                        <div class="login-wrapper">
                            <div><h3 class="login-title">ADMIN PAGE</h3></div>
                                <div class="login-content">
                                <div class="find_info">
                                    <div><a href="<c:url value='/admin/memberList' />">MEMBERLIST</a></div>
                                </div>
                                </div>
                        </div>
                    </div>
                </div>        
                </div>
            </div>
<%@ include file="../footer.jsp" %>
