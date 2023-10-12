<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>travelBook.jsp</title>
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
	
	<script>
		function validate() { 
			//유효성 검사
			// /form/02_form.jsp 참조
			
			//예약번호
			let rno = document.getElementById("rno").value;
			rno = rno.trim();
			if(rno.length!=8){
				alert("예약번호 8글자 입력해 주세요");
				document.getElementById("rno").focus();
				return false;
			}//if end
			
			//상품코드
			let tcode = document.getElementById("tcode").value;
			tcode = tcode.trim();
			if(tcode.length==0){
				alert("상품코드가 선택되지 않았습니다");
				return false;
			}//if end
			
			//주민번호
			let rjumin1 = document.getElementById("rjumin1").value;
			rjumin1 = rjumin1.trim();
			if(isNaN(rjumin1) || rjumin1.length!=6){
				alert("주민번호 숫자 6글자 입력해 주세요");
				document.getElementById("rjumin1").focus();
				return false;
			}//if end
			
			let rjumin2 = document.getElementById("rjumin2").value;
			rjumin2 = rjumin2.trim();
			if(isNaN(rjumin2) || rjumin2.length!=7){
				alert("주민번호 숫자 6글자 입력해 주세요");
				document.getElementById("rjumin2").focus();
				return false;
			}//if end
			
			//예약자 성명
			let rname = document.getElementById("rname").value;
			rname = rname.trim();
			if(rname.length==0){
				alert("성명을 입력해 주세요");
				document.getElementById("rname").focus();
				return false;
			}//if end
			
			//전화번호 각각 3 4 4 
			let rphone1 = document.getElementById("rphone1").value;
			rphone1 = rphone1.trim();
			if(isNaN(rphone1) || rphone1.length!=3){
				alert("전화번호 숫자 11글자 입력해 주세요");
				document.getElementById("rphone1").focus();
				return false;
			}//if end
			
			let rphone2 = document.getElementById("rphone2").value;
			rphone2 = rphone2.trim();
			if(isNaN(rphone2) || rphone2.length!=4){
				alert("전화번호 숫자 11글자 입력해 주세요");
				document.getElementById("rphone2").focus();
				return false;
			}//if end
			
			let rphone3 = document.getElementById("rphone3").value;
			rphone3 = rphone3.trim();
			if(isNaN(rphone3) || rphone3.length!=4){
				alert("전화번호 숫자 11글자 입력해 주세요");
				document.getElementById("rphone3").focus();
				return false;
			}//if end
			
			//이메일
			let remail = document.getElementById("remail").value;
			remail = remail.trim();
			if(remail.length==0){
				alert("이메일을 입력해 주세요");
				document.getElementById("remail").focus();
				return false;
			}//if end
			
			return true; //onsubmit 이벤트에서 서버로 전송
		}//validate() end
	</script>
</head>
<body>

	<header>여행예약 프로그램 ver2018-12</header>
	
	<nav class="navbar navbar-default">
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
	
	<section>
		<!-- 본문시작 -->
			<h3>예약등록</h3>
			<form name="myform" id="myform" method="post" action="travelBookProc.jsp" onsubmit="return validate()">
				<table class="table table-bordered">
			       <tr>
			           <th>예약번호</th>
			           <td>
			               <input type="text" name="rno" id="rno" size="8" maxlength="8" required>
			           </td>
			           <th> [JJ01] 제주 2018-12-01 09:30(AM) 출발 - 360,000원 (2박3일)</th>
			       </tr>
			       <tr>
			           <th>상품코드</th>
			           <td>
			           	   <select name="tcode" id="tcode">
			           	       <option value="">상품선택</option>
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
		//out.println("오라클DB 서버 연결 성공");
		
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT tcode ");
		sql.append(" , '['||tcode||']' || tarea  ");
		sql.append("     || substr(tdate, 1, 4) || '-' || substr(tdate, 5, 2) || '-' || substr(tdate, 7, 2) ");
		sql.append("     || ' 출발' as tname ");
		sql.append(" FROM tbl_tourcode_02 ");
		sql.append(" ORDER BY tcode ");
		
		pstmt=con.prepareStatement(sql.toString());
		rs=pstmt.executeQuery();
		if(rs.next()){
			do{
				out.println("<option value='" + rs.getString("tcode") + "'>");
				out.println(rs.getString("tname"));
				out.println("</option>");
			}while(rs.next());
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
			           	   </select>
			           </td>
			           <th> [JJ02] 부산 2018-12-02 10:00(AM) 출발 - 280,000원 (2박3일)</th>
			       </tr>
			       <tr>
			           <th>주민번호</th>
			           <td>
			               <input type="text" name="rjumin1" id="rjumin1" size="6" maxlength="6" required>
			               -
			               <input type="text" name="rjumin2" id="rjumin2" size="7" maxlength="7" required>
			           </td>
			           <th> [JJ03] 제주 2018-12-04 10:00(AM) 출발 - 360,000원 (2박3일)</th>
			       </tr>
			       <tr>
			           <th>예약자성명</th>
			           <td>
			               <input type="text" name="rname" id="rname" size="20" maxlength="20" required>
			           </td>
			           <th> [JJ04] 제주 2018-12-07 11:00(AM) 출발 - 420,000원 (3박4일)</th>
			       </tr>
				   <tr>
			           <th>예약자전화</th>
			           <td>
			               <input type="text" name="rphone1" id="rphone1" size="3" maxlength="3" required>
			               <input type="text" name="rphone2" id="rphone2" size="4" maxlength="4" required>
			               <input type="text" name="rphone3" id="rphone3" size="4" maxlength="4" required>
			           </td>
			           <th> [JJ05] 부산 2018-12-09 13:30(AM) 출발 - 260,000원 (2박3일)</th>
			       </tr>
			       <tr>
			           <th>고객이메일</th>
			           <td>
			               <input type="text" name="remail" id="remail" size="30" maxlength="30" required>
			           </td>
			           <th> [JJ06] 제주 2018-12-10 09:30(AM) 출발 - 460,000원 (3박4일)</th>
			       </tr>  
			       <tr>
			           <th>결제상태</th>
			           <td>
			               <input type="radio" name="rstat" id="rstat" value="1" checked>미납
			               <input type="radio" name="rstat" id="rstat" value="2">완납
			           </td>
			       </tr>
			       <tr>
			           <td colspan="3" align="center">
			               <input type="submit" value="예약" class="btn btn-default">
			               <input type="reset"  value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다')" class="btn btn-default">
			           </td>
			       </tr>
       </table>
			</form>
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