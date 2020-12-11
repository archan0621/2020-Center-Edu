<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>

<%@ include file="static/header.jsp"%>
<%@ include file="static/nav.jsp"%> 

<%
	switch(section){
		case "insert_sale":
			%><%@ include file="page/insert_sale.jsp"%><%
			break;
		case "total_sale":
			%><%@ include file="page/total_sale.jsp"%><%
			break;
		case "section_sale":
			%><%@ include file="page/section_sale.jsp"%><%
			break;
		case "product_sale":
			%><%@ include file="page/product_sale.jsp"%><%
			break;
		default :
			%><%@ include file="static/index.jsp"%><%
			break;
	}
%>

<%@ include file="static/footer.jsp"%>