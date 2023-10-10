<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>03_calc.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script>
	  	function validate() {
			//alert();
			//연산기호 + - */ % 만 입력 가능
			let op = $("#op").val(); //본문에 있는 <input type = text id = op>에 있는 입력값 가져오기
			op = op.trim();
			
			if(!(op=='+' || op=='-' || op=='*' || op=='/' || op=='%')){ // !부정연산자
				alert("연산기호 + - */ % 만 입력 가능합니다");
				return false; //서버로 전송 안 됨
			}//if end
			
			return true;//서버로 전송
		}//validate() end
  	</script>
  	<style>
	body{
	  width: 80%;
	  margin:0 auto;
	 }
	</style>
</head>
<body>

	<h3>* 계산기 연습 *</h3>
	<form name="calcfrm" id="calcfrm" method="get" action="03_dap.jsp" onsubmit="return validate()">
		첫번째 수 : <input type="number" name="num1" id="num1" min="0" max="100" required>
        <hr>
        연산자 :   <input type="text" name="op" id="op" size="3" maxlength="1" required>
        <hr>
        두번쨰 수 : <input type="number" name="num2" id="num2" min="0" max="100" required>
        <hr>  
   		<input type="submit" value="계산">                  
  		<input type="reset"  value="취소">
	</form>



</body>
</html>