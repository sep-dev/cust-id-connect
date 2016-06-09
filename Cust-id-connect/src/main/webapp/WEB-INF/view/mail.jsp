<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>メール送信画面</title>




</head>
<body>
	<h1>メール送信</h1>
	<form:form modelAttribute = "mailModel">
		<table>
			<tr>
				<td>宛先</td>
				<td><form:select path = "to" required="required">
						<option disabled selected>宛先を選択</option>
						<option value = "tarou8503@gmail.com">全員</option>
						<option value = "tarou8503@gmail.com">ランダム</option>
						<option value = "tarou8503@gmail.com">プラチナ会員</option>
						<option value = "tarou8503@gmail.com">その他</option>
				</form:select> <%-- その他：<form:select path = "to" data-placeholder="宛先を選択" style="width: 350px;"
					tabindex="2" >
						<option value=""></option>
						<option value="1">テスト さん</option>
						<option value="2">テスト２ さん</option>
				</form:select> --%></td>
			</tr>



			<tr></tr>
			<tr>
				<td>件名</td>
				<td><form:input path="subject"  placeholder="ここに件名を入力"
					required="required"/></td>
			</tr>
			<tr></tr>
			<tr>
				<td>本文</td>
				<td><form:textarea path="honbun" cols="40" rows="10" required="required"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="送信する" /></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="/Cust-id-connect/top"><input type="button"
						value="トップ画面に戻る"></a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
