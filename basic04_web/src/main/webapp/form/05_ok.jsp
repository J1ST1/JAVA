<%@page import="java.awt.Window.Type"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>05_ok.jsp</title>
</head>
<body>

	<h3>* 다양한 폼 컨트롤 요소들 결과 *</h3>

<%
	//Tomcat 10버전에서는 생략 가능
	//request.setCharacterEncoding("UTF-8");
	
	String uid 		=request.getParameter("uid");
	String upw 		=request.getParameter("upw");
	String uname 	=request.getParameter("uname");
	String content 	=request.getParameter("content");
	
	out.print(uid + "<hr>");
	out.print(upw + "<hr>");
	out.print(uname + "<hr>");
	out.print(content + "<hr>");
	
	//<textarea>값은 엔터를 <br> 치환해서 출력
	content = content.replaceAll("\n", "<br>");
	out.print(content + "<hr>");
	
	//공백을 특수문자로 치환
	content = content.replaceAll(" ", "&nbsp;");
	out.print(content + "<hr>");
	
	//name이 동일한 값을 request객체에서 가져오기
	//<input type="text" name="num">이 3개인 경우
	String[] num = request.getParameterValues("num");
	for(int i=0; i<num.length; i++){
		out.print(num[i] + "<br>");
	}//for end

	out.print("<hr>");
	out.print("성별 : " + request.getParameter("gender"));
	
	out.print("<hr>");
	out.print("약관동의 : " + request.getParameter("agree"));
	
	//<input type="checkbox" name="agree" value="Y">
	//체크를 하면 Y, 체크하지 않으면 null
	if(request.getParameter("agree")==null){
		out.print("약관 동의하지 않음");
	}else{
		out.print("약관 동의함");
	}//if end
	
	//type=radio 또는 type=checkbox에 value가 없는 경우
	//체크를 하면 on, 체크하지 않으면 null
	out.print("<hr>");
	out.print("SMS : " + request.getParameter("sms"));
	
	out.print("<hr>");
	out.print("통신회사 : " + request.getParameter("telecom"));
	
	out.print("<hr>");
	out.print("페이지 : " + request.getParameter("page"));
	
	out.print("<hr>");
	out.print("첨부파일 : " + request.getParameter("attach"));
	/*
		첨부된 파일을 가져오려면 다른 방식으로 request객체에 접근해야 한다.
	    request.getParameter("attach")는 실제 파일을 가지고 있는 것이
	    아니라 단순 파일명이 출력됐을 뿐이다.
	*/
	
	
	
%>

</body>
</html>