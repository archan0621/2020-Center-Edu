<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <table border="1">
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
		String query = "select artist_id, artist_name, artist_birth, talent, agency from tbl_artist_201905";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			String talent = null;
			switch(rs.getString(5)){
			case "1":
				talent = "보컬";
				break;	
			case "2":
				talent = "댄스";
				break;
			case "3":
				talent = "랩";
				break;
			}
		
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4).equals("F") ? "여" : "남" %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<% }
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>