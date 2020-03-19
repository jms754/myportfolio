<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SI BEL HOMME</title>
<style>
	.reply .row:nth-child(2) {
		display: flex;
		justify-content: flex-end;
	}
	.rereplyList row div:nth-child(2){
		display: flex;
	}
	.rereplyList row div:nth-child(2){
		display: flex;
	}
	.rereplyList row div{
		display: flex;
	}
	#rcontent {
		resize: none;
	}
</style>
</head>
<body>

<div class="replyList">
	<div>
		<div class="item">사진</div>
		<div class="item">댓글작성자</div>
		<div class="item">댓글작성일자</div>
		<div class="item">댓글내용</div>
		<div class="item">선호</div>
		<div class="item">비선호</div>
	</div>
</div>
<div data-rnum="">
	<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div>
		<div class="item">사진</div>
		<div class="item">댓글작성자</div>
		<div class="item">댓글작성일자</div>
		<div class="item">댓글내용</div>
		<div class="item">선호</div>
		<div class="item">비선호</div>
	</div>
</div>
<div class="reply">
	<div class="row">
		<textarea name="rcontent" id="rcontent" rows="3" cols="40">
		</textarea>
		<button>등록</button>
	</div>
</div>
</body>
</html>