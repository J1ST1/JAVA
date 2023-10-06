<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>sungjukForm.jsp</title>
	<style>
	body{
	  width: 80%;
	  margin:0 auto;
	 }
	 .btn{background-color:#e6e6fa;}
	 th{background-color:#fff0f5;}
	</style>
</head>
<body>

	<h3>* 성적 수정 폼 *</h3>
	<p><a href="sungjukList.jsp">[성적목록]</a>
	
	<form name="sungjukfrm" id="sungjukfrm" method="get" action="sungjukIns.jsp">
		<table class="table table-bordered">
		<tr>
			<th>이름</th>
			<td><input type="text" class="form-control" name="uname" id="uname" maxlength="50" required autofocus></td>
		</tr>	
		<tr>
			<th>국어</th>
			<td><input type="number" class="form-control" name="kor" id="kor" size="5" min="0" max="100" placeholder="국어점수"></td>
		</tr>	
		<tr>
			<th>영어</th>
			<td><input type="number" class="form-control" name="eng" id="eng" size="5" min="0" max="100" placeholder="영어점수"></td>
		</tr>	
		<tr>
			<th>수학</th>
			<td><input type="number" class="form-control" name="mat" id="mat" size="5" min="0" max="100" placeholder="수학점수"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<select name="addr" id="addr">
					<option value="Seoul">서울</option>
					<option value="Jeju">제주</option>
					<option value="Suwon">수원</option>
					<option value="Busan">부산</option>
				</select>		
			</td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
				<input type="submit" value="전송" class="btn btn-default">
				<input type="reset"  value="취소" class="btn btn-default">
			</td>
		</tr>
		</table>
	</form>
</body>
</html>