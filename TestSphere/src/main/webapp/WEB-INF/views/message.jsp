<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String message = (String) request.getAttribute("message");
if (message != null) {
	out.print("<span >" + message + "</span>");
}
%>