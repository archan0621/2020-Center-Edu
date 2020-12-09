<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String artist_id = request.getParameter("artist_id");
String artist_name = request.getParameter("artist_name");
String artist_birth_year = request.getParameter("artist_birth_year");
String artist_birth_month = request.getParameter("artist_birth_month");
artist_birth_month = artist_birth_month.length() == 1 ? "0" + artist_birth_month : artist_birth_month;
String artist_birth_day = request.getParameter("artist_birth_day");
artist_birth_day = artist_birth_day.length() == 1 ? "0" + artist_birth_day : artist_birth_day;
String artist_birth = artist_birth_year + artist_birth_month + artist_birth_day;
String artist_gender = request.getParameter("artist_gender");
String talent = request.getParameter("talent");
String agency = request.getParameter("agency");
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	Statement stmt = conn.createStatement();
	
	String query = "INSERT INTO tbl_artist_201905 " +
			"(artist_id, artist_name, artist_birth, " +
			"artist_gender, talent, agency) " +
			"VALUES('%s', '%s', '%s', '%s', '%s', '%s') ";
	
	ResultSet rs = stmt.executeQuery(String.format(query, artist_id, artist_name, artist_birth, artist_gender, talent, agency));
	
	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../index.jsp");
%>