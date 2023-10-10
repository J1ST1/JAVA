<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>03_dap.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
	body{
	  width: 80%;
	  margin:0 auto;
	 }
	</style>
</head>
<body>

<h3>* 계산기 결과 *</h3>

<%

	//한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//사용자가 입력 요청한 정보 가져오기
	//예) <input type=number name=num1>
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	String op=request.getParameter("op").trim();
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	
	int res1=0;			//정수형 계산 결과
	double res2=0.0;	//실수형 계산 결과
	
	if(op.equals("+")){
		res1 = num1+num2;
	}else if(op.equals("-")){
		res1 = num1-num2;
	}else if(op.equals("*")){
		res1 = num1*num2;
	}else if(op.equals("/")){
		res2 = (double)num1/num2;
	}else if(op.equals("%")){
		res1 = num1%num2;
	}//if end
%>

	<!-- 출력 -->
	<table>
	<tr>
		<td><%=num1%></td>
		<td><%=op%></td>
		<td><%=num2%></td>
		<td>=</td>
		<td>
<%
			if(op.equals("/")){
				out.print(String.format("%.1f", res2));	//소수점 1자리수로 문자열 출력 "0.6"
			}else{
				out.print(res1);
			}//if end

%>		
		</td>
	</tr>
	</table>



</body>
</html>