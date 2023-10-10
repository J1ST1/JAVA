<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>sungjukUpdate.jsp</title>
	<style>
	body{
	  width: 80%;
	  margin:0 auto;
	 }
	th{background-color:hsla(9, 100%, 64%, 0.5);}
	</style>
</head>
<body>

	<h3>* 성적 수정 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
<%
	//예)수정하고자 하는 글 번호 sungjukUpdate.jsp?sno=21
	//out.print(request.getParameter("sno"));
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		String url      = "jdbc:oracle:thin:@localhost:1521:xe";
		String user     = "system";
		String password = "1234";
		String driver   = "oracle.jdbc.driver.OracleDriver"; 
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
	
		//1)단계. select문을 이용해서 수정할 행을 가져온다(sungjukRead.jsp참조)
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		rs=pstmt.executeQuery();
		if(rs.next()){
			//2)단계. 1)의 내용을 폼에 출력(sungjukForm.jsp참조)
%>
			<form name="sungjukfrm" id="sungjukfrm" method="get" action="sungjukUpdateProc.jsp">
			<!-- 사용자에게는 필요한 값이 아니지만, 프로그램 흐름상 필요한 값은 hidden 속성으로 담아서 넘긴다 -->
			<input type="hidden" name="sno" value="<%=sno%>">
			<table class="table table-bordered">

				<tr>
					<th>이름</th>
					<td><input type="text" class="form-control" name="uname" id="uname" value="<%=rs.getString("uname") %>" maxlength="50" required autofocus></td>
				</tr>	
				<tr>
					<th>국어</th>
					<td><input type="number" class="form-control" name="kor" id="kor" value="<%=rs.getInt("kor") %>" size="5" min="0" max="100" placeholder="국어점수"></td>
				</tr>	
				<tr>
					<th>영어</th>
					<td><input type="number" class="form-control" name="eng" id="eng" value="<%=rs.getInt("eng") %>" size="5" min="0" max="100" placeholder="영어점수"></td>
				</tr>	
				<tr>
					<th>수학</th>
					<td><input type="number" class="form-control" name="mat" id="mat" value="<%=rs.getInt("mat")%>" size="5" min="0" max="100" placeholder="수학점수"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<% String addr = rs.getString("addr"); %>
						<select name="addr" id="addr">
							<option value="Seoul" <% if(addr.equals("Seoul")) {out.print("selected");} %>>서울</option>
							<option value="Jeju"  <% if(addr.equals("Jeju"))  {out.print("selected");} %>>제주</option>
							<option value="Suwon" <% if(addr.equals("Suwon")) {out.print("selected");} %>>수원</option>
							<option value="Busan" <% if(addr.equals("Busan")) {out.print("selected");} %>>부산</option>
						</select>		
					</td>
				</tr>
				<tr>
				    <td colspan="2" align="center">
						<input type="submit" value="수정" class="btn btn-default">
						<input type="reset"  value="취소" class="btn btn-default">
					</td>
				</tr>
			</table>
		</form>
<%
		}else{
			out.println("해당 글 없음");
		}//if end
	
	}catch (Exception e){
		out.println("오라클 DB 연결 실패 :" + e);
	}finally { //자원반납(순서주의)
		try{
			if(rs!=null) {rs.close();}
		}catch (Exception e) {}
		try{
			if(pstmt!=null) {pstmt.close();}
		}catch (Exception e) {}
		try {
			  if(con!=null) {con.close();}
		}catch (Exception e) {}
	}//end

%>

</body>
</html>