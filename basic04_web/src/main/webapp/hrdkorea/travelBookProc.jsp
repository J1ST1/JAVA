<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>travelBookProc.jsp</title>
</head>
<body>

	<h3>* 예약등록 결과 페이지 *</h3>
	<p><a href="travelBook.jsp">[예약등록]</a></p>
<%
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");

	//사용자가 입력한 정보를 가져와서 변수에 담기
	int rno 	 = Integer.parseInt(request.getParameter("rno").trim());
	String rjumin1 = request.getParameter("rjumin1").trim();
	String rjumin2 = request.getParameter("rjumin2").trim();
	String rjumin 	 = rjumin1+rjumin2;
	String rname = request.getParameter("rname").trim();
	String rphone1 = request.getParameter("rphone1").trim();
	int rphone2  = Integer.parseInt(request.getParameter("rphone2").trim());
	int rphone3  = Integer.parseInt(request.getParameter("rphone3").trim());
	String remail = request.getParameter("remail").trim();
	int rstat  = Integer.parseInt(request.getParameter("rstat"));
	String tcode = request.getParameter("tcode");
	
	//Oracle DB 연결 및 행 추가---------------------------------------------
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try {
		
		String url      = "jdbc:oracle:thin:@localhost:1521:xe";
		String user     = "system";
		String password = "1234";
		String driver   = "oracle.jdbc.driver.OracleDriver"; 
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		//out.println("오라클DB 서버 연결 성공");
		
		StringBuilder sql=new StringBuilder();
		sql.append(" INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode) ");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ");
		
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, rno);
		pstmt.setString(2, rjumin);
		pstmt.setString(3, rname);
		pstmt.setString(4, rphone1);
		pstmt.setInt(5, rphone2);
		pstmt.setInt(6, rphone3);
		pstmt.setString(7, remail);
		pstmt.setInt(8, rstat);
		pstmt.setString(9, tcode);
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0){
			out.println("<p>예약 등록에 실패했습니다</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			out.println("<script>");
			out.println("	alert('예약등록이 완료되었습니다!');");
			out.println("	location.href='travelBook.jsp';");//목록페이지 이동
			out.println("</script>");
		}//if end
		
	}catch (Exception e){
		out.println("오라클 DB 연결 실패 :" + e);
	}finally { //자원반납(순서주의)
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