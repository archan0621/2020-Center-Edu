<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
		Statement stmt = conn.createStatement();
		String query = "select PRODUCT.NAME, sum(sale.sale_price),sum(sale.amount) FROM SAlE, PRODUCT where sale.product_id = PRODUCT.product_id group by PRODUCT.PRODUCT_ID, PRODUCT.NAME";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getInt(2) %></td>
			<td><%=rs.getInt(3) %></td>
		</tr><%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	%>