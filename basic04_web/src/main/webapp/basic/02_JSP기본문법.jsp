<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_JSP기본문법.jsp</title>
</head>
<body>

	<h3>JSP 기본문법</h3>
	<hr>
	<h4>대한민국</h4>
	<hr>
	1+2+3
	<hr>
<%
	//한줄주석
	/*여러 줄 주석*/
	/*
		● 스크립트릿(Scriptlet)
		  - JSP 코드 작성 영역
		  - Tomcat WAS에 의해 JSP코드가 해석되고, 결과값을 HTML문서로 변환해서
		  	Frontend단으로 응답해 준다
	*/
	
	out.print("무궁화");
	out.print(123+456);
	out.print(5+7);
	out.print(8.9);
	out.print('X');

	/*
		● 결과확인
		  http://localhost:9090/basic04_web/basic/02_JSP기본문법.jsp
			- http:// 				  프로토콜
			- localhost:9090 		  내컴퓨터:포트번호
			- basic04_web 			  Context root 	프로젝트명
			- basic/02_JSP기본문법.jsp 	  경로명 및 파일명
			
		● Context root 가상의 경로 : basic04_web 
		  basic04_web의 실제 물리적 경로(src/main/webapp)는 외부에서 접근 불가능
		  프로젝트명 basic04_web으로 접근해야 한다
		  에러 http://localhost:9090/src/main/webapp/basic/02_JSP기본문법.jsp
	*/

	//HTML태그를 JSP에서 사용하는 경우 ""안에서 작성
	out.print("<h1>악마</h1>");
	out.print("<img src='../images/new7.jpg'>");
	out.print("<hr>");
%>	
	
<%-- 스크립트릿 주석 Ctrl + Shift + /
<%  
	//스크립트릿은 문서에 여러번 가능하다
	out.println("<style>.txt{color:red}</style>");
	out.println("<span class=txt>오필승코리아</span>");
%>
--%>

</body>
</html>