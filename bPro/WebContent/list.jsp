<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<%@ page import="bPro.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>

<%-- <jsp:useBean id="dao" class="bPro.DAO" /> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>

<script type="text/javascript">
	function move(url) {
		location.href = url;
	}
</script>

<style type="text/css">
	a, a:hover{
		color: black;
		text-decoration: none;
	}
</style>
</head>

<body>
	<%
	//페이지
		int pageNumber = 1; //초기페이지는 1
		//
		if (request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<table width=100%>
		<tr>
			<th width="70">번호</th>
			<th width="380">제목</th>
			<th width="70">작성자</th>
			<th width="150">작성일</th>
			<th width="70">조회수</th>
		</tr>
		<tr>
				<td colspan="5"><hr size=1></td>
			</tr>
		<%
			DAO dao = new DAO(); 
			ArrayList<DTO> list = dao.getList(pageNumber); //현재의 페이지에서 가져온 목록
			for(int i = 0; i<list.size(); i++){
		%>
		<tr>
			<td align="center"><%= list.get(i).getNum()%></td>
			<td><a href="view.jsp?num=<%= list.get(i).getNum() %>"><%= list.get(i).getTitle()%></a></td>
			<td align="center"><%= list.get(i).getName()%></td>
			<td align="center"><%= list.get(i).getDate().substring(0,11)+ list.get(i).getDate().substring(11,13)+"시"+list.get(i).getDate().substring(14,16)+"분"%></td>
			<td align="center"><%=list.get(i).getHitCount()%></td>
		</tr>
		<%} %>
</table>
<br />
<!-- 페이지 부분 -->
	<%
		if(pageNumber !=1){ //페이지 넘버가 2이상인경우
	
	%>
		<a href="list.jsp?pageNumber=<%= pageNumber -1 %>"><input type="button" value="이전"></a>
	<%
		} if(dao.nextPage(pageNumber+1)){ //다음페이지 있을경우
	%>
		<a href="list.jsp?pageNumber=<%= pageNumber +1 %>"><input type="button" value="다음"></a>
	<%
		}
	%>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr align="center">
			<td><input type="button" value="글쓰기"
				onclick="move('write.jsp');" /></td>
		</tr>
	</table>
</body>
</html>
