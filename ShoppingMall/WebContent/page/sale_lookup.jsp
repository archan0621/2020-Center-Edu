<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<h3>통합 매출내역 조회</h3>
<table border="1">
	<tr>
		<td>판매 ID</td>
		<td>상품명</td>
		<td>구매 일자</td>
		<td>총 구매 내역</td>
		<td>구매 개수</td>
	</tr>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
		Statement stmt = conn.createStatement();
		String query = "select SALE.SALE_ID, PRODUCT.NAME, SALE.purchase_date, sale.sale_price,sale.amount FROM SAlE, PRODUCT where sale.product_id = PRODUCT.product_id";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getInt(4) %></td>
			<td><%=rs.getInt(5) %></td>
		</tr><%
		}%></table><%
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>