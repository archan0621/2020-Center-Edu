<%@ page language="java" contentType="text/html; charset=UTF-8"	
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<section>
	<h2>매출전표등록</h2>
	<form action="action/insert_sale.jsp"name="action_form">
	<table border=1>
		<tr>
			<td>비번</td>
			<td><input type="text" name="sale_no"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="text" name="date"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="pcode"></td>
				<%
					try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost/xe", "system", "oracle");
			
					String query = "SELECT product.PCODE, product.NAME FROM tbl_product_02 product";
				
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					 while(rs.next()){
					 }
					stmt.close();
					conn.close();
			
					}catch (Exception e) {
						e.printStackTrace();
					}
				%>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr colspan=2>
			<td>
				<input type="button" onclick="submit_form()" value="전표등록"></input>
				<input type="button" onclick="reset_form()" value="다시쓰기"></input>
			</td>
		</tr>
	</table>
	</form>
</section>

<script>
	function submit_form(){
		if(document.action_form.sale_no.value == ""){
			alert("비번이 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.scode.value == ""){
			alert("상품코드가 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.date.value == ""){
			alert("판매날짜가 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.pcode.selectedIndex === 0){
			alert("매장코드가 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.amount.value == ""){
			alert("판매수량이 입력되지 않았습니다.");
			return;
		}
		alert("매출전표를 등록합니다!");
		document.action_form.submit();
	}
	function reset_form(){
		alert("정보를 지우고 처음부터 다시 입력 합니다!");
		document.action_form.reset();
	}
</script>