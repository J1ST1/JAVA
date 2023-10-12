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
	<title>travelList.jsp</title>
	<style>
		section{
	  		width: 80%;
	  		margin:0 auto;
	 		}
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
		<h3> 예약내역 조회 </h3>
		<table class="table table-bordered">
		<tr>
			<th>예약번호</th>
			<th>주민번호</th>
			<th>성명</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>여행상품</th>
			<th>상태</th>
			<th>금액</th>
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
		sql.append(" select rno  ");
		sql.append("   ,substr(rjumin, 1, 6) || '-' || substr(rjumin, 7, 13) as juminbno ");
		sql.append("   ,rname ");
		sql.append("   ,substr(rjumin, 7,1) as juminnum ");
		sql.append("   ,rphone1 || '-' || rphone2 || '-' || rphone3 as phone ");
		sql.append("   ,tbl_reserve_01.tcode || '-' || tarea || '-' || tdate || '-' || ttime || '/' || thotel || '/' || tair as tnamecom ");
		sql.append("   , rstat  ");
		sql.append("   , tmoney  ");
		sql.append(" from tbl_reserve_01 inner join tbl_tourcode_02 ");
		sql.append(" on tbl_reserve_01.tcode = tbl_tourcode_02.tcode ");
		sql.append(" order by tbl_reserve_01.rno ");
		
		pstmt=con.prepareStatement(sql.toString());
		rs=pstmt.executeQuery();
		if(rs.next()){
			do{
%>
				<tr>
					<td><%=rs.getString("rno")%></td>
					<td><%=rs.getString("juminbno")%></td>
					<td><%=rs.getString("rname")%></td>
					<td><%
					String jn = rs.getString("juminnum");
					if(jn.equals("1") || jn.equals("3") ){
						out.print("남");
					}else if(jn.equals("2") || jn.equals("4")){
						out.print("여");
					}//if end
					%></td>
					<td><%=rs.getString("phone")%></td>
					<td><%=rs.getString("tnamecom")%></td>
					<td><%
					String rstat = rs.getString("rstat");
					if(rstat.equals("1")){
						out.print("미납");
					}else if(rstat.equals("2")){
						out.print("완납");
					}//if end
					%></td>
					<td>￦<%=String.format("%,d", rs.getInt("tmoney")) %></td>
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
	</section>
	
	<footer>
		<p>
			HRDKOREA Copyright&copy;2018 All rights reserved.
			Human Resources Development Service of Korea
		</p>
	</footer>

</body>
</html>