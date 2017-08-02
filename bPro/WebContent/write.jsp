<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>

<%@ page import="bPro.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 쓰기</title>
</head>

<script type="text/javascript">
	function move(url){
		location.href=url;
	}
	
	function writeCheck(){
		var form = ducument.writeSave;
		return true;
	}
</script>
<body>

	<form name = "writeSave" method="post" action = "writeSave.jsp" onsubmit= "return writeCheck();" >
	<tr>
			<td>
				<div align="center">
					<h3>
						<b>글 쓰기</b>
					</h3>
				</div>
			</td>
		</tr>
		
		<colgroup>
			<col width="20%">
			<col width="80%">
			
		</colgroup>
		<table >
			<tr>
				<td>작성자</td>
				<td><input type="text" name=name size=10 ></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name=title maxlength="80" ></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name = content rows="10" cols="100"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name=password></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><hr size=1></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="저장" onclick="move('list.jsp');">
				<input type="button" value="취소" onclick="move('list.jsp');">
				</td>
			</tr>
		
		</table>
	</form>

</body>
</html>