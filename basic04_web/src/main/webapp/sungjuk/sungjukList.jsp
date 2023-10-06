<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>sungjukList.jsp</title>
	<style>
	body{
	  width: 80%;
	  margin:0 auto;
	 }
	.one{background-color: #fffacd;}
	</style>
</head>
<body>

	<h3>* 성적 목록 *</h3>
	<p><a href="sungjukForm.jsp">[성적쓰기]</a></p>

	<table class="table table-bordered">
	<tr class="one">
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>등록일</th>
	</tr>	
<%
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
	
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT sno, uname, kor, eng, mat, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" ORDER BY wdate DESC ");
		
		pstmt=con.prepareStatement(sql.toString());
		rs=pstmt.executeQuery();
		if(rs.next()){
			do{
%>
				<tr>
					<td><a href="sungjukRead.jsp?sno=<%=rs.getInt("sno")%>"><%=rs.getString("uname")%></a></td>
					<td><%=rs.getInt("kor")%></td>
					<td><%=rs.getInt("eng")%></td>
					<td><%=rs.getInt("mat")%></td>
					<td><%=rs.getString("wdate").substring(0, 10)%></td>
				</tr>			
<%			
			}while(rs.next());
		}else{
			out.println("<tr>");
			out.println("	<td colspan='5'>글 없음</td>");
			out.println("</tr>");
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
	</table>

</body>
</html>