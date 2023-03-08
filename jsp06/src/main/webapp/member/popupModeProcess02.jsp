<%@page import="com.jjang051.utils.CookieManager"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String sevenDay = request.getParameter("sevenDay");
	if(sevenDay!=null && sevenDay.equals("1")){
		CookieManager.makeCookie(response, "popupCookie02", "off", 60*60*24*7);
	}
	String json ="{name:'장성호'}"; 
	//System.out.println(json);
%>
<%
	out.println("장성호");
%>