<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String ajaxMsg = request.getParameter("ajaxresult");
System.out.println("ajaxMsg : " + ajaxMsg);

out.println(ajaxMsg);
%>
