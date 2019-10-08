<%@ page language="java" pageEncoding="utf-8" import="java.util.*"%>
<%@ page import="com.game.po.*"%>

<%
	SysAdmin user = (SysAdmin) session.getAttribute("user");
	if (user == null) {
		out.println("<script language='JavaScript'>");
		out.println("window.alert('You have not logged in!')");
		out.println("window.location.href='login.jsp'");
		out.println("</script>");
	}
%>