<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<section>
	<h2>지점별 매출 현황</h2>
	<table border=1>
		<tr>
			<td>지점 코드</td>
			<td>지점 명</td>
			<td>총매출액</td>
		</tr>
<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "oracle");
			
			String query = "SELECT SHOP.SCODE,SHOP.SNAME,TO_CHAR(SUM(PIZZA.COST * SALELIST.AMOUNT), 'L999,999,999') FROM TBL_PIZZA_01 PIZZA, TBL_SHOP_01 SHOP, TBL_SALELIST_01 SALELIST WHERE SHOP.SCODE = SALELIST.SCODE AND PIZZA.PCODE = SALELIST.PCODE GROUP BY SHOP.SNAME, SHOP.SCODE ORDER BY SHOP.SCODE";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
			%>
				<tr>
					<td><% out.println(rs.getString(1)); %></td>
					<td><% out.println(rs.getString(2)); %></td>
					<td><% out.println(rs.getString(3)); %></td>
				</tr>
			<%
			}
			
			stmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</section>