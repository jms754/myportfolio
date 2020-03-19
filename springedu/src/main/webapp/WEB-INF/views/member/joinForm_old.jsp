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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/sibelhomme.css' />">
    <style>
    /* 회원가입 css */
.container {
    display: flex;
    justify-content: center;
}
.content {
    display: flex;
    flex-direction: column;
    width: 300px;
    height: 600px; 
    border-bottom: 2px solid gray;
    padding: 0 0 20px;
}
.content div {
    flex:1 1 300px;
}
.content div:nth-child(3),
.content div:nth-child(6),
.content div:nth-child(9),
.content div:nth-child(12),
.content div:nth-child(15),
.content div:nth-child(18) {
  border:1px solid gray;
  padding:1px;
  padding-left:10px;
  background-color:white;
}
.join-title {
    font-size: 16px;
    color: #333;
    margin: 0 0 20px;
    padding: 0 0 20px;
    text-align: center;
    border-bottom: 2px solid gray;
}
button,select {
    width: 100%;
}
input {
    width: 250px;
    border: none;
}
input[type=radio] {
    width: auto;
}
#joinBtn {
    background-color: #333;
    color: #fff;
    font-weight: 900;
    border: 1px solid bisque;
    padding: 10px;
}

.fa-envelope, .fa-unlock, .fa-unlock-alt, .fa-mobile-alt{
    padding: 5px 5px;
}
label {
    vertical-align: top;
    color: #333;
    font-size: 12px;
}
#region {
    font-size: 12px;
}
.errmsg {
    color: red;
    font-Size: 0.7em;
}
    </style>
    <script src="<c:url value='/resources/js/mobilemenu.js' />"></script>
    <script src="<c:url value='/resources/js/memberjoin1.js' />"></script>
</head>
<body>
 <%@ include file="../header.jsp" %>
					<form action="<c:url value='/member/join'/>" method="post" id="form">
            <div class="content">
                <div><h3 class="join-title">REGISTER</h3></div>
                <div><label for="id">ID(E-MAIL)</label></div>
                <div><input type="text" name="id" id="id" placeholder="아이디(이메일) 입력"><i class="far fa-envelope fa-lg"></i></div>
                <div><span class="errmsg" id="id_errmsg"></span></div>
                
                <div><label for="pw">PASSWORD</label></div>
                <div><input type="password" name="pw" id="pw" placeholder="비밀번호 입력"><i class="fas fa-unlock fa-lg"></i></div>
                <div><span class="errmsg" id="pw_errmsg"></span></div>
                
                <div><label for="pwChk">PASSWORD CHECK</label></div>
                <div><input type="password" id="pwChk" placeholder="비밀번호 확인"><i class="fas fa-unlock-alt fa-lg"></i></div>
                <div><span class="errmsg" id="pwChk_errmsg"></span></div>
                
                <div><label for="tel">MOBILE</label></div>
                <div><input type="tel" name="tel" id="tel" placeholder="010-0000-0000"><i class="fas fa-mobile-alt fa-lg"></i></div>
                <div><span class="errmsg" id="tel_errmsg"></span></div>
                
                <div><label for="nickname">NICKNAME</label></div>
                <div><input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"><i class="fas fa-user fa-lg"></i></div>
                <div><span class="errmsg" id="nickname_errmsg"></span></div>
                
                <div><label for="birth">BIRTH</label></div>
                <div><input type="text" name="birth" id="birth" placeholder="1901-01-01"><i class="fas fa-birthday-cake fa-lg"></i></div>
                <div><span class="errmsg" id="birth_errmsg"></span></div>
                
                <div><label for="region">ADDRESS</label></div>
                <div>
                    <select name="region" id="region">
                        <option value="">= SELECT =</option>
                        <option value="서울">서울</option>
                        <option value="경기">경기</option>
                        <option value="대구">대구</option>
                        <option value="부산">부산</option>
                        <option value="울산">울산</option>
                    </select>
                </div>
                <div><span class="errmsg" id="region_errmsg"></span></div>
                
                <div><label for="gender">GENDER</label></div>
                <div>
                    <input type="radio" name="gender" id="men" value="남"><label for="men">male</label>
                    <input type="radio" name="gender" id="women" value="여"><label for="women">female</label>
                </div>
                <div><span class="errmsg" id="gender_errmsg"></span></div>
                
                <div><button type="submit" id="joinBtn">J O I N</button></div>
                </div>
                </form>
            </div>
  <%@ include file="../footer.jsp" %>  
</body>
</html>

