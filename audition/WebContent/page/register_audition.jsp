<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function submit_form() {
	if (document.input_form.artist_id.value === "") {
		alert("참가번호 : 참가번호가 입력되지 않았습니다!");
		document.input_form.artist_id.focus();
		return;
	}
	if (document.input_form.artist_name.value === "") {
		alert("참가자명 : 참가자명이 입력되지 않았습니다!");
		document.input_form.artist_name.focus();
		return;
	}
	if (document.input_form.artist_birth_year.value === "") {
		alert("생년월일 : 생년월일이 입력되지 않았습니다!");
		document.input_form.artist_birth_year.focus();
		return;
	}
	if (document.input_form.artist_birth_month.value === "") {
		alert("생년월일 : 생년월일이 입력되지 않았습니다!");
		document.input_form.artist_birth_month.focus();
		return;
	}
	if (document.input_form.artist_birth_day.value === "") {
		alert("생년월일 : 생년월일이 입력되지 않았습니다!");
		document.input_form.artist_birth_day.focus();
		return;
	}
	if (!(document.input_form.artist_gender.value === "F" || document.input_form.artist_gender.value === "M")) {
		alert("성별 : 성별이 선택되지 않았습니다!");
		document.input_form.artist_gender.focus();
		return;
	}
	if (document.input_form.talent.value <= 0) {
		alert("특기 : 특기가 선택되지 않았습니다!");
		document.input_form.talent.focus();
		return;
	}
	if (document.input_form.agency.value === "") {
		alert("소속사 : 소속사가 입력되지 않았습니다!");
		document.input_form.agency.focus();
		return;
	}
	alert("참가신청이 정상적으로 등록 되었습니다!");
	document.input_form.submit();
}
function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.input_form.reset();
}
</script>
<body>
	<h3 style="text-align: center; ">오디션 등록</h3>
	<form action="action/action_insert_audition.jsp" method="post" name="input_form">
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td><input type="text" name="artist_id" />*참가번호는 (A000)4자리입니다.</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input type="text" name="artist_name" /></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="artist_birth_year" />년
				<input type="text" name="artist_birth_month" />월
				<input type="text" name="artist_birth_day" />일</td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="artist_gender" value="M" /><a>남성</a>
				<input type="radio" name="artist_gender" value="F" /><a>여성</a></td>
			</tr>
			<tr>
				<td>특기</td>
				<td>
					<select name="talent">
						<option value="0">특기선택</option>
						<option value="1">보컬</option>
						<option value="2">댄스</option>
						<option value="3">랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input type="text" name="agency" /></td>
			</tr>
			<tr>
				<td>
				<input type="button" onclick="submit_form()" value="오디션 등록" />
				<input type="button" onclick="reset_form()" value="다시쓰기" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>