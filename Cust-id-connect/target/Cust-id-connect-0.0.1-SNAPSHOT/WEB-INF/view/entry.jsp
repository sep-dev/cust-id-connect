<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客登録画面</title>
</head>
<body>
	<h1>顧客登録</h1>


	<form:form modelAttribute="customerData">
		<table>

			<tr>
				<td>氏名</td>
				<td><form:input path="name"/></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>

			<tr>
				<td>住所</td>
				<td><form:input path="address" /></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>
			<tr>
				<td>電話番号</td>
				<td><form:input path="tel" /></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>

			<tr>
				<td>メールアドレス</td>
				<td><form:input path="mailaddress" /></td>
			</tr>
			<tr>
				<td>誕生月</td>
				<td><form:select path="birth">
						<option disabled selected>誕生月を入力</option>
						<option value=1>１月</option>
						<option value=2>２月</option>
						<option value=3>３月</option>
						<option value=4>４月</option>
						<option value=5>５月</option>
						<option value=6>６月</option>
						<option value=7>７月</option>
						<option value=8>８月</option>
						<option value=9>９月</option>
						<option value=10>10月</option>
						<option value=11>11月</option>
						<option value=12>12月</option>
					</form:select> 性別 <form:select path="gender">
						<option disabled selected>性別を入力</option>
						<option value="男">男</option>
						<option value="女">女</option>
						<option value="ホモ">他</option>
					</form:select></td>

			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="登録" > <input type="reset" >
					<a href="/Cust-id-connect/list"><input type="button"
						value="一覧画面に戻る" ></a> <a href="/Cust-id-connect/top"><input
						type="button" value="トップ画面に戻る" /></a></td>
			</tr>

		</table>
	</form:form>

</body>
</html>