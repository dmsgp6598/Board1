<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

%>

<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	BoardDAO bdao = new BoardDAO();
	String pass = bdao.getPass(boardbean.getNum());

	if(pass.equals(boardbean.getPassword())) {
		
		bdao.updateBoard(boardbean);
		
		response.sendRedirect("BoardList.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("�н����尡 ��ġ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>

<%		
	}

%>


</body>
</html>