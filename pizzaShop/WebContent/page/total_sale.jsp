<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<section>
	<h2>통합매출현황조회</h2>
	<table border=1>
		<tr>
			<td>매출전표번호</td>
			<td>지점</td>
			<td>판매일자</td>
			<td>피자코드</td>
			<td>피자 명</td>
			<td>판매수량</td>
			<td>매출액</td>
		</tr>
<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "oracle");
			
			String query = "SELECT SALELIST.SALENO, SALELIST.SCODE, SHOP.SNAME,TO_CHAR(SALELIST.SALEDATE, 'YYYY-MM-DD'), PIZZA.PCODE, PIZZA.PNAME, SALELIST.AMOUNT, TO_CHAR(PIZZA.COST * SALELIST.AMOUNT, 'L999,999,999') FROM TBL_PIZZA_01 pizza, TBL_SHOP_01 shop, TBL_SALELIST_01 salelist WHERE SALELIST.SCODE = SHOP.SCODE AND PIZZA.PCODE = SALELIST.PCODE ORDER BY SALELIST.SALENO";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
			%>
				<tr>
					<td><% out.println(rs.getInt(1)); %></td>
					<td><% out.println(rs.getString(2)+"-"+rs.getString(3)); %></td>
					<td><% out.println(rs.getString(4)); %></td>
					<td><% out.println(rs.getString(5)); %></td>
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