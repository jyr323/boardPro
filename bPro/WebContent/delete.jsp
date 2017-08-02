<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="bPro.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 삭제</title>

<script type="text/javascript">
	function move(url) {
		location.href = url;
	}

	function deleteCheck() {
		var form = document.deleteForm;
		return true;

	}
</script>
</head>
<body>
	<table>
		<form  name = "deleteForm" method = "post" action = "deleteOk.jsp" 
			onsubmit = "return deleteCheck();">
		<tr>
			<td><b>비밀번호를 입력해 주세요 : </b></td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td><input type="submit" value="삭제완료" />
			<input type="button" value="취소" onclick="history.go(-1)" /></td>
		</tr>


		</form>
	</table>
</body>
</html>