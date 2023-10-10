<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_ok.jsp</title>
</head>
<body>

	<h3>* request 내장객체의 다양한 메소드 결과 *</h3>

<%
	//1) 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//2) 사용자가 입력한 정보를 가져오기
	out.print(request.getParameter("uid"));
	out.print("<hr>");
	
	/*
		● 톰캣 IPv4 지정
        IP주소 6자리 -> 4자리변경
        이클립스 Run -> Run Configurations -> Tomcat Server -> (x)=Arguments -> VM arguemnts에 아래와 같이 추가
              -> 공백1칸 주고 -Djava.net.preferIPv4Stack=true 추가
              -> Apply
	*/
	
	//3) 요청한 사용자의 다양한 정보
	out.print(request.getRemoteAddr());//사용자PC의 IP주소
	out.print("<hr>");
	out.print(request.getRemoteHost());
	out.print("<hr>");
	out.print(request.getRemotePort());
	out.print("<hr>");
	/////////////////////////////////////////////
	
	// /basic04_web 해당 프로젝트 이름
	out.print(request.getContextPath());
	out.print("<hr>");
	
	// 사용자가 요청한 전체 경로의 페이지명 또는 명령어
	// http://localhost:9090/basic04_web/form/04_ok.jsp
	out.print(request.getRequestURL());
	out.print("<hr>");
	
	// 사용자가 요청한 페이지명 또는 명령어
	// /basic04_web/form/04_ok.jsp
	out.print(request.getRequestURI());
	out.print("<hr>");
	//////////////////////////////////////////
	
	//내부변수 ★★★
	//request.setAttribute("변수명", 값);
	//request.getAttribute("변수명");
	request.setAttribute("user", "KOREA");
	out.print(request.getAttribute("user"));
	
	Object obj = request.getAttribute("user");
	String str = (String)obj;   //형변환, 다형성
	out.print(str);
	out.print("<hr>");
	//////////////////////////////////////////
	
	// 내컴퓨터 입장에서 /images 폴더의 실제 물리적 경로
	// 첨부된 파일을 서버에 저장하는 경우 사용함
	//out.print(request.getRealPath("/images")); 	   // 비추천 주의) Tomcat 10에서는 삭제된 메소드
	out.print("<hr>");
	
	out.print(application.getRealPath("/images")); // 추천
	out.print("<hr>");
	
	/*
		아래 경로는 이클립스에서 톰캣서버를 실행한 경우
		D:\java202307\workspace
					 \.metadata
					 \.plugins
					 \org.eclipse.wst.server.core
					 \tmp0
					 \wtpwebapps
					 \basic04_web
					 \images
	*/
	
%>
</body>
</html>