<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>판매 등록</h3>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
		Statement stmt = conn.createStatement();
%>

<form action="action/sale_insert.jsp" method="post" name="action_form">
<table border="1">
	<tr>
		<td>판매한 상품</td>
		<td>
			<select name="product_id">
				<%
				
				String query = "select SALE.SALE_ID, PRODUCT.NAME, SALE.purchase_date, sale.sale_price,sale.amount FROM SAlE, PRODUCT where sale.product_id = PRODUCT.product_id";
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()) {
					%> <option value="<%=rs.getInt(1) %>"> <%=rs.getString(2) %> <%
				}
			 %>
			</select>
		</td>
	</tr>
	<tr>
		<td>수량</td>
		<td><input type="number" name="amount"></td>
	</tr>
	<tr>
		<td>판매 날짜</td>
		<td><input type="date" name="purchase_date"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="등록하기">
			<input type="button" value="다시쓰기" onclick="reset_form()">
		</td>
	</tr>
</table>
</form>

<script>
function reset_form(){
	document.action_form.rest();
}
</script>
<%
	stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	%>