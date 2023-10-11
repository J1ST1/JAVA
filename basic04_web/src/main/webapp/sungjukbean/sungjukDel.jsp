<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>sungjukDel.jsp</title>
	<style>
	body{
	  width: 80%;
	  margin:0 auto;
	 }
	th{background-color:hsla(9, 100%, 64%, 0.5);}
	</style>
</head>
<body>

	<h3>* 성적 삭제 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
<%
	
	int sno=Integer.parseInt(request.getParameter("sno"));
	int cnt = dao.delete(sno);
	if(cnt==0){
		out.println("<p>성적 삭제 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('성적이 삭제되었습니다');");
		out.println("	location.href='sungjukList.jsp';");//목록페이지 이동
		out.println("</script>");
	}//if end
%>

</body>
</html>