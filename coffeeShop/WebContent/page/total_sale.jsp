<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<section>
	<h2>통합매출현황조회</h2>
	<table border=1>
		<tr>
			<td>비번</td>
			<td>상품코드</td>
			<td>판매날짜</td>
			<td>매장코드</td>
			<td>상품명</td>
			<td>판매수량</td>
			<td>총판매액</td>
		</tr>
<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "oracle");
			
			String query = "SELECT SALELIST.SALENO, SALELIST.SCODE, SHOP.SNAME,TO_CHAR(SALELIST.SALEDATE, 'YYYY-MM-DD'), product.PCODE, product.NAME, SALELIST.AMOUNT, TO_CHAR(product.COST * SALELIST.AMOUNT, 'L999,999,999') FROM TBL_PRODUCT_02 product, TBL_SHOP_02 shop, TBL_SALELIST_02 salelist WHERE SALELIST.SCODE = SHOP.SCODE AND product.PCODE = SALELIST.PCODE ORDER BY SALELIST.SALENO";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
			%>
				<tr>
					<td><% out.println(rs.getInt(1)); %></td>
					<td><% out.println(rs.getString(5)); %></td>
					<td><% out.println(rs.getString(4)); %></td>
					<td><% out.println(rs.getString(2)); %></td>
					<td><% out.println(rs.getString(6)); %></td>
					<td><% out.println(rs.getInt(7)); %></td>
					<td><% out.println(rs.getString(8)); %></td>
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