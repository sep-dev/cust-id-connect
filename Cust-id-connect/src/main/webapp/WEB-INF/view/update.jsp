<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<title>顧客情報更新画面</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<style>
.hoge {
	border: 0;
	padding: 3px;
	font-size: 10;
	font-family: Arial, sans-serif;
	color: #aaa;
	border: solid 1px #ccc;
	margin: 0 0 10px;
	width: 300px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 5px;
}

input:focus, select:focus, textarea:focus {
	outline: 2px #EEA34A solid;
}
.piyo{
padding :5px 10px;
background-color:powderblue;
color: #fff;
border-style:none;}
</style>
</head>

<body>

	<h1>顧客情報更新</h1>

	<form:form modelAttribute = "customerData">
		<table>

			<tr>
				<td>氏名</td>
				<td><form:input path = "name"  class ="hoge" placeholder="ここに氏名を入力" size="50" value="${iddata.name}" />
				 	<!-- required="required"
					pattern="^[-a-zA-Z0-9ぁ-ゑァ-ヶ一-龠々][-a-zA-Z0-9ぁ-ゑんァ-ヶ一-龠々 　]{0,254}$"
					title="氏名は半角英数字、かな漢字のみで記入してください。"  /> --></td>

				<td><font color="red">＜"必須"＞</font></td>
			</tr>
			<tr>
				<td>住所</td>
				<td><form:input path="address" class ="hoge"  placeholder="ここに住所を入力" size="50" value="${iddata.address}"/>
					<%-- required="required"
					pattern="^[-a-zA-Z0-9ぁ-ゑァ-ヶ一-龠々][-a-zA-Z0-9ぁ-ゑんァ-ヶ一-龠々 　]{0,254}$"
					title="住所は半角英数字、かな漢字のみで記入してください。" --%></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>
			<tr>
				<td>電話番号</td>
				<td><form:input path="tel" class ="hoge"  placeholder="ここに電話番号を入力 " size="50" value="${iddata.tel}"/>
					<%-- required="required" pattern="\d{1,5}-\d{1,4}-\d{3,5}"
					title="電話番号は、市外局番からハイフン（-）を入れて記入してください。" --%></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>

			<tr>
				<td>メールアドレス</td>
				<td><form:input path="mailaddress" class ="hoge"  placeholder="ここにメールアドレスを入力" size="50" value="${iddata.mailaddress}"/></td>
			</tr>
			<tr>
				<td>誕生月</td>
				<td><form:select path="birth">
						<option disabled selected>誕生月を入力</option>
						<option value = 1>１月</option>
						<option value = 2>２月</option>
						<option value = 3>３月</option>
						<option value = 4>４月</option>
						<option value = 5>５月</option>
						<option value =6>６月</option>
						<option value =7>７月</option>
						<option value =8>８月</option>
						<option value =9>９月</option>
						<option value =10>10月</option>
						<option value =11>11月</option>
						<option value =12>12月</option>
				</form:select> 性別 <form:select path ="gender">
						<option disabled selected>性別を入力</option>
						<option value = "男">男</option>
						<option value = "女">女</option>
						<option value = "他">他</option>
				</form:select></td>

			</tr>
			<tr><td>　</td></tr>
			<tr>
				<td>
				<input type="hidden" name="id" value="${iddata.id}" /></td>
				<td><input type="submit" class="piyo"value="更新" /> <input type="reset"class="piyo" />
					<a href="/Cust-id-connect/list"><input type="button" class="piyo" value="一覧画面に戻る" /></a>
					<a href="/Cust-id-connect/top"><input type="button" class="piyo" value="トップ画面に戻る" /></a></td>
			</tr>

		</table>
	</form:form>
</body>
</html>
