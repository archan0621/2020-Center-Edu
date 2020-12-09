<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	<section>
	<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
				
		switch(section){
		case "artist_lookup":
			%><%@include file="page/artist_lookup.jsp" %><%
			break;
		case "artist_lookup_by_rank":
		%><%@include file="page/artist_lookup_by_rank.jsp" %><%
			break;
		case "mento_point_lookup":
		%><%@include file="page/member_point_lookup.jsp" %><%
			break;
		case "register_audition":
		%><%@include file="page/register_audition.jsp" %><%
			break;
	 	default:
			%><%@include file="static/index.jsp" %><% 
			}
	%>
	</section>
	<%@include file="static/footer.jsp" %>
</body>
</html>