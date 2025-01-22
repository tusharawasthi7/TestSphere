<%@page import="test.vault.authentication.entities.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Admin admin = (Admin) request.getAttribute("admin");
out.print(admin);
%>