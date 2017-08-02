
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bPro.DAO" %>   
<%@page import="java.io.PrintWriter"%>
 
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>

<jsp:useBean id="dto" class="bPro.DTO" scope="page"/>	<!--  DTO속성의 dto를 생성 -->
<jsp:setProperty name="dto" property="*"/>			<!-- dto에 모든값을 담는다. -->


<%
	if(dto.getTitle() == null || dto.getContent() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		DAO dao = new DAO();
		int result = dao.write(dto.getName(), dto.getTitle(), dto.getPassword(), dto.getContent(), dto.getHitCount(), dto.getNewdate(), dto.getAvailable() );
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 실패')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='list.jsp'");
			script.println("</script>");
		}
		
	}
%>
</body>
</html>