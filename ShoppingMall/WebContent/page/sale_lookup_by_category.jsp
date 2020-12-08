<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>카테고리별 매출현황</h3>
<table border="1">
	<tr>
		<td>카테고리 이</td>
		<td>총 판매 금</td>
		<td>판매 개수</td>
	</tr>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
		Statement stmt = conn.createStatement();
		String query = "select category.name, sum(sale.sale_price), sum(sale.amount) from sale, product, category where sale.product_id = product.product_id and category.category_id = product.product_id group by category.category_id, category.name";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getInt(2) %></td>
			<td><%=rs.getInt(3) %></td>
		</tr><%
		}%></table><%
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>