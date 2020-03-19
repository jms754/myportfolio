<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    /* 회원가입 css */
.container {
    display: flex;
    justify-content: center;
}
.content {
    display: flex;
    flex-direction: column;
    width: 300px;
    height: 750px; 
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
  padding:5px;
  padding-left:10px;
  background-color:white;
}
.addressApi div:nth-child(2),
.addressApi div:nth-child(3),
.addressApi div:nth-child(4) {
	margin-bottom: 5px;
	  border:1px solid gray;
  padding:5px;
  padding-left:10px;
  background-color:white;
}
#addressBtn {
    width: 100%;
    height: 34px;
    margin-bottom: 5px;
    font-size: 12px;
    border: 1px solid #444;
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
button,select {
    width: 100%;
}
input {
    width: 250px;
    border: none;
    font-size: 12px;
}
input[type=radio] {
    width: auto;
}
#joinBtn {
    background-color: #333;
    color: #fff;
    /* font-weight: 900; */
    font-size: 12px;
    line-height: 24px;
    border: 1px solid #333;
    padding: 10px;
}
#joinBtn:hover {
	background: white;
	color: #222;
	transition: 0.3s;
}

.fa-envelope, .fa-unlock, .fa-unlock-alt, .fa-mobile-alt{
    padding: 5px 5px;
}
label {
    vertical-align: top;
    color: #333;
    font-size: 12px;
}
#regionn {
    font-size: 12px;
    border: 1px solid gray;
}
.region {
padding: 3px;
border: 1px solid gray;
}
#genderr {
	padding: 5px;
	padding-left: 10px;
	border: 1px solid gray;
}
.errmsg {
    color: red;
    font-Size: 0.7em;
}
/* 비밀번호 찾기 */
.divide-bar {
	vertical-align: middle;
	width: 1px;
	height: 16px;
	display: inline-block;
	background: #dbdbdb;
	margin: 0 10px;
}
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
    </style>
    <script src="<c:url value='/resources/js/mobilemenu.js' />"></script>
    <script src="<c:url value='/resources/js/memberjoin1.js' />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_detailAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_detailAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
 <%@ include file="../header.jsp" %>
            <div class="content">
					<form:form id="form" action="${pageContext.request.contextPath }/member/join" method="post" 
					modelAttribute="mvo">
                <div class="title"><h3 class="notice">REGISTER</h3></div>
                <div><form:label path="id"><span style="font-size:14px; color: tomato;">*</span> ID(E-MAIL)</form:label></div>
                <div><form:input type="text" path="id" placeholder="아이디(이메일) 입력" /><i class="far fa-envelope fa-lg"></i></div>
                <div>
                	<span class="errmsg" id="id_errmsg"></span>
                	<form:errors path="id" cssClass="errmsg" id="id_errmsg"></form:errors>
                	<div style="color:red; font-size: 0.7em">${svr_msg }</div>
                </div>
                
                <div><form:label path="pw"><span style="font-size:14px; color: tomato;">*</span> PASSWORD</form:label></div>
                <div><form:input type="password" path="pw" placeholder="비밀번호 입력" /><i class="fas fa-unlock fa-lg"></i></div>
                <div>
                	<span class="errmsg" id="pw_errmsg"></span> 
                	<form:errors path="pw" cssClass="errmsg" id="pw_errmsg"></form:errors>
                </div>
                
                <div><label for="pwChk"><span style="font-size:14px; color: tomato;">*</span> PASSWORD CHECK</label></div>
                <div><input type="password" id="pwChk" placeholder="비밀번호 확인"><i class="fas fa-unlock-alt fa-lg"></i></div>
                <div><span class="errmsg" id="pwChk_errmsg"></span></div>
                
                <div><form:label path="tel"><span style="font-size:14px; color: tomato;">*</span> MOBILE</form:label></div>
                <div><form:input type="tel" path="tel" placeholder="010-0000-0000" /><i class="fas fa-mobile-alt fa-lg"></i></div>
                <div>
                	<span class="errmsg" id="tel_errmsg"></span>
                	<form:errors path="tel" cssClass="errmsg" id="tel_errmsg"></form:errors>
                </div>
                
                <div><form:label path="nickname"><span style="font-size:14px; color: tomato;">*</span> NAME</form:label></div>
                <div><form:input type="text" path="nickname" placeholder="이름 입력" /><i class="fas fa-user fa-lg"></i></div>
                <div>
                	<span class="errmsg" id="nickname_errmsg"></span>
                	<form:errors path="nickname" cssClass="errmsg" id="nickname_errmsg"></form:errors>
                </div>
                
                <div><form:label path="birth"><span style="font-size:14px; color: tomato;">*</span> BIRTH</form:label></div>
                <div><form:input type="date" path="birth" /><i class="fas fa-birthday-cake fa-lg"></i></div>
                <div>
                	<span class="errmsg" id="birth_errmsg"></span>
                	<form:errors path="birth" cssClass="errmsg" id="birth_errmsg"></form:errors>
                </div>
                <div><form:label path="region"><span style="font-size:14px; color: tomato;">*</span> ADDRESS</form:label></div>
                <div class="addressApi">
								<div><form:input type="button" path="region" id="addressBtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/></div>
                <div><input type="text" name="region" id="sample6_postcode" placeholder="우편번호" readonly="readonly"/></div>
								<div><input type="text" name="region" id="sample6_address" placeholder="주소" readonly="readonly" /></div>
								<div><input type="text" name="region" id="sample6_detailAddress" placeholder="상세주소"/></div>
                </div>
<%--                     <form:select path="region" cssClass="region">
                        <option value="0">= SELECT =</option>
                        <form:options path="region" items="${region }" itemValue="code" itemLabel="label"/>
                    </form:select> --%>
                <div>
                	<span class="errmsg" id="region_errmsg"></span>
                	<form:errors path="region" cssClass="errmsg" id="region_errmsg"></form:errors>
                </div>               
             <div style="margin-top: 5px"><button type="submit" id="joinBtn">J O I N</button></div>
                </form:form>
                <div class="find_info">
                    <a href="<c:url value='/member/findIDForm' />">FORGOT ID</a>
                      <span class="divide-bar">&nbsp;</span>
                    <a href="<c:url value='/member/findPWForm' />">FORGOT PW</a>
                      </div>
                </div>

            </div>
  <%@ include file="../footer.jsp" %>  
</body>
</html>

