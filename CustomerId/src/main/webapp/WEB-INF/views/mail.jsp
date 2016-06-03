<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>メール送信画面</title>
<link rel="stylesheet" href="chosen.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script src="chosen.jquery.js"></script>
<script>
	$(".chosen-select").chosen()
</script>

</head>
<body>
	<h1>メール送信</h1>
	<form method="post" action="">
		<table>
			<tr>
				<td>宛先</td>
				<td><select name=title required="required">
						<option disabled selected>宛先を選択</option>
						<option>全員</option>
						<option>ランダム</option>
						<option>プラチナ会員</option>
						<option>その他</option>
				</select> その他：<select data-placeholder="宛先を選択" class="chosen-select"
					style="width: 350px;" tabindex="2">
						<option value=""></option>
						<option value="1">テスト さん</option>
						<option value="2">テスト２ さん</option>
				</select></td>
			</tr>


			<tr>
				<td>例文</td>
				<td><select name="example" onChange=>
						<option disabled selected>例文を選択</option>
						<option value="サンプル1">お知らせ</option>
						<option value="サンプル2">すごいお知らせ</option>
						<option value="サンプル3">ヤバイお知らせ</option>
				</select></td>
			</tr>
			<tr></tr>
			<tr>
				<td>件名</td>
				<td><input type=text placeholder="ここに件名を入力" required="required"></td>
			</tr>
			<tr></tr>
			<tr>
				<td>本文</td>
				<td><textarea cols=40 rows=10 required="required"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input type=submit value="送信する"></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="/seproject/top"><input type="button"
						value="トップ画面に戻る"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>
