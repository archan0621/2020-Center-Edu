<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 style="text-align: center; ">멘토점수조회</h3>
	<table border="1" style="text-align: center;">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>소속사</td>
		</tr>
		<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
				Statement stmt = conn.createStatement();
				String query = "SELECT ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME, " +
						"ARTIST.ARTIST_BIRTH, ARTIST.ARTIST_GENDER, " +
						"ARTIST.TALENT, ARTIST.AGENCY " +
						"FROM tbl_artist_201905 ARTIST " +
						"ORDER BY ARTIST.ARTIST_ID ASC ";
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
					String birthDate = rs.getString(3);
					birthDate = birthDate.substring(0, 4) + "년" + birthDate.substring(4, 6) + "월" + birthDate.substring(6) + "일";
					String gender = rs.getString(4).equals("F") ? "여" : "남";
					String talent = rs.getString(5).equals("1") ? "보컬" : (rs.getString(5).equals("2") ? "댄스" : "랩");
					%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= birthDate %></td>
						<td><%= gender %></td>
						<td><%= talent %></td>
						<td><%= rs.getString(6) %></td>
					</tr>
					<%
				}
				stmt.close();
				conn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>