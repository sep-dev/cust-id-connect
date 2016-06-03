<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<title>顧客登録画面</title>
<script language="JavaScript">
	function kakunin(frm) {
		alert("登録しました")
		location.reload();
	}
</script>
</head>

<body>

	<h1>顧客登録</h1>

	<form method="post" action="">
		<table>

			<tr>
				<td>氏名</td>
				<td><input type="text" placeholder="ここに氏名を入力" size="50"
					required="required"
					pattern="^[-a-zA-Z0-9ぁ-ゑァ-ヶ一-龠々][-a-zA-Z0-9ぁ-ゑんァ-ヶ一-龠々 　]{0,254}$"
					title="氏名は半角英数字、かな漢字のみで記入してください。" /></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>
			<tr>
				<td>住所</td>
				<td><input type="text" placeholder="ここに住所を入力" size="50"
					required="required"
					pattern="^[-a-zA-Z0-9ぁ-ゑァ-ヶ一-龠々][-a-zA-Z0-9ぁ-ゑんァ-ヶ一-龠々 　]{0,254}$"
					title="住所は半角英数字、かな漢字のみで記入してください。" /></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>
			<tr>
				<td>電話番号</td>
				<td><input type="tel" placeholder="ここに電話番号を入力 " size="50"
					required="required" pattern="\d{1,5}-\d{1,4}-\d{3,5}"
					title="電話番号は、市外局番からハイフン（-）を入れて記入してください。" /></td>
				<td><font color="red">＜"必須"＞</font></td>
			</tr>

			<tr>
				<td>メールアドレス</td>
				<td><input type="email" placeholder="ここにメールアドレスを入力" size="50" /></td>
			</tr>
			<tr>
				<td>誕生月</td>
				<td><select name="month">
						<option disabled selected>誕生月を入力</option>
						<option>１月</option>
						<option>２月</option>
						<option>３月</option>
						<option>４月</option>
						<option>５月</option>
						<option>６月</option>
						<option>７月</option>
						<option>８月</option>
						<option>９月</option>
						<option>10月</option>
						<option>11月</option>
						<option>12月</option>
				</select> 性別 <select name="danjo">
						<option disabled selected>性別を入力</option>
						<option>男</option>
						<option>女</option>
						<option>他</option>
				</select></td>

			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="登録" /> <input type="reset" />
					<a href="/seproject/list"><input type="button" value="一覧画面に戻る" /></a>
					<a href="/seproject/top"><input type="button" value="トップ画面に戻る" /></a></td>
			</tr>

		</table>
	</form>
</body>
</html>
