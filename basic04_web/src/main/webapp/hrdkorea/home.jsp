<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	● 공통페이지 추가
	<%@ include file="" %> 				JSP 디렉티브 (JSP코드가 많을 경우 추천)
	<jsp:include page=""></jsp:include> 액션태그 
--%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		section{
	  		width: 80%;
	  		margin:0 auto;
	 		}
	 	.btn{background-color:#8C8CFF; color:white;}
		header {background:#FF7A85; color:white; text-align:center; height: 60px; line-height: 60px; font-size: 30px;}
		nav	   {padding-left: 50px;}
		footer {background:	#FF848F; color:white; text-align:center; height: 40px; line-height: 40px; font-size: 16px;}
	</style>
</head>
<body>

	<header>여행예약 프로그램 ver2018-12</header>
	
	<nav class="navbar navbar-default">
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	
	<section>
		<!-- 본문시작 -->
			<img src="../images/new7.jpg" width="500px">
		<!-- 본문끝 -->
	</section>
	
	<footer>
		<p>
			HRDKOREA Copyright&copy;2018 All rights reserved.
			Human Resources Development Service of Korea
		</p>
	</footer>

</body>
</html>