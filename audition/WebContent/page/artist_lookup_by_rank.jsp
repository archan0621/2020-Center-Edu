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
	<h3 style="text-align: center; ">참가자 등수 조회</h3>
	<table border="1" style="text-align: center;">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
				Statement stmt = conn.createStatement();
				String query = "SELECT ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME, " +
						"SUM(POINT.POINT), ROUND(AVG(POINT.POINT), 2) AS pointAvg " +
						"FROM tbl_artist_201905 ARTIST, tbl_point_201905 POINT " +
						"WHERE ARTIST.ARTIST_ID = POINT.ARTIST_ID " +
						"GROUP BY ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME " +
						"ORDER BY pointAvg DESC ";
				ResultSet rs = stmt.executeQuery(query);
				int rank = 0;
				while (rs.next()) {
					double average = rs.getInt(4);
					String modifyAverage = String.format("%.2f", average);
					%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getInt(3) %></td>
						<td><%= modifyAverage %></td>
						<td><%= ++rank %></td>
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