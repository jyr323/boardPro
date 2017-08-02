<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="bPro.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
<script type="text/javascript">
	function move(url) {
		location.href = url;
	}
</script>
</head>
<body>
	<%
		int num = 0;
		if(request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		DTO dto = new DAO().getDTO(num); //해당 글 정보담기
		
	%>
	<form name="view" method="post">
		<tr>
			<td>
				<div align="center">
					<h3>
						<b>글 상세보기</b>
					</h3>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<table border="1">
					<tr>
						<td align="center" bgcolor=#dddddd width=10%>작성자</td>
						<td width=30%><%= dto.getName() %></td>
						<td align="center" bgcolor=#dddddd width=20%>등록일시</td>
						<td width=40%><%= dto.getDate().substring(0,11)+ dto.getDate().substring(11,13)+"시"+dto.getDate().substring(14,16)+"분" %></td>
					</tr>
					<tr>
						<td align="center" bgcolor=#dddddd>제목</td>
						<td colspan="3"><%= dto.getTitle() %></td>
					</tr>
					<tr>
						<td align="center" bgcolor=#dddddd>내용</td>
						<td colspan="3"><%= dto.getContent() %></td>
					</tr>
					<tr>
						<td colspan="4" align="right">조회수 :<%= dto.getHitCount() %></td>
					</tr>
				</table>
			</td>
		</tr>
		<br />

		<table >
			<td><input type="button" value="목록" onclick="move('list.jsp');" /></td>
			<td><input type="button" value="수정" onclick="move('modify.jsp?num=<%=num %>');" /></td>
			<td><input type="button" value="답변" onclick="move('#');" /></td>
			<td><input type="button" value="삭제" onclick="move('delete.jsp?num=<%=num %>');" /></td>

		</table>


	</form>
</body>
</html>