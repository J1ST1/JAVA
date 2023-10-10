<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_배열.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
.table{
	  width: 80%;
	  margin:0 auto;
	 }
</style>

<body>

	<h3>배열</h3>
<%
	String[] uname= {"라일락","진달래","개나리","무궁화","홍길동"};
	int[] kor= {100, 50, 95, 80, 60};
	int[] eng= {100, 55, 95, 85, 40};
	int[] mat= {100, 60, 35, 90, 30};
	int size=uname.length;

	//평균구하기
	int[]aver = new int[5];
			
	for(int i=0; i<size; i++) {
		aver[i] = (kor[i]+eng[i]+mat[i])/3;
	}//for end
	
	
	//등수구하기 (평균을 기준으로)
	int[]rank = {1, 1, 1, 1, 1};
	for(int i=0; i<size; i++) {
	    for(int b=0; b<size; b++) {
	        if(aver[i]<aver[b]) {
	           rank[i] = rank[i] + 1; //rank[i]++
	           }//if end
	    }//for end
	}//for end
%>

	<!-- 출력 -->
	<table class="table table-hover">
	<thead>
		<tr class="success">
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>평균</th>
			<th>등수</th>
			<th>결과</th>
		</tr>
	</thead>
	<tbody>
	<%
		for(int i=0; i<size; i++){
	%>
			<tr class="info">
				<td><%=uname[i]%></td>
				<td><%=kor[i]%></td>
				<td><%=eng[i]%></td>
				<td><%=mat[i]%></td>
				<td><%=aver[i]%></td>
				<td><%=rank[i]%></td>
				<td>
	<%
		if(aver[i]>=70) {
			if(kor[i]<40||eng[i]<40||mat[i]<40) {
				out.print(" 재시험 ");
			}else {
				out.print(" 합격 ");
			}//if end
			}else {
				out.print(" 불합격 ");
			}//if end
		
		for(int star=0; star<aver[i]/10; star++) {
			out.print("★");
		}//for end
		
		//평균 95점 이상이면 장학생(진하게, 빨강색)
		if(aver[i]>=95) {
			out.print("<span style='color:red; font-weight:bold;'>");
			out.print("장학생");
			out.print("</span>");
		}
	
	%>
				</td>
			</tr>
	<%
		}//for end
	%>
	</tbody>
	</table>




</body>
</html>