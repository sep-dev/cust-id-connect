<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!-- Copyright (C) Net Mania. All Rights Reserved. http://www.netmania.jp/ -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value="/resources/css/super.css"/>"
	media="all">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/notosansjp.css">

<!-- 以下転送処理・URLを変更しましょう！数字は転送までの時間です。 -->
<META HTTP-EQUIV="Refresh" CONTENT="10;URL=/Cust-id-connect/list">

<title>被り</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js" charset="UTF-8"></script>
<script type="text/javascript">
	function countdown($call, $count) {
		$('#count').text($count);
		if ($count) {
			setTimeout(function() {
				$count = $count - 1;
				countdown($call, $count);
			}, 1000);
		} else {
			$('body').append($('<scr'+'ipt>' + $call + ';<\/scr'+'ipt>'));
		}
	}// end function
	$(function() {
		countdown('window.location.replace("/Cust-id-connect/list")', 10);
	});
</script>
</head>

<body>
	<div id="container">

		<header>
			<div id="header">
				<img src="./resources/img/minikuroranko.png" width="100%" id="site_logo">
				<h1><a href="/Cust-id-connect/top" class="link">†ポイントカード管理システム†</a></h1>
			</div>
			<div id="menu">
				<table>
					<tr>
						<td><a href="/Cust-id-connect/entry" class="link">顧客登録</a></td>
						<td><a href="/Cust-id-connect/list" class="link">顧客一覧</a></td>
						<td><a href="/Cust-id-connect/cardlist" class="link">カード一覧</a></td>
						<td><a href="/Cust-id-connect/mail" class="link">メール送信</a></td>
					</tr>
				</table>

			</div>
		</header>
		<div id="main">
			<div id="error"><h2>カード登録エラー</h2>
			<p>同じカード番号が登録されています</p>
			<span id="count">10</span>秒後に顧客一覧画面に遷移します
			</div>

		</div>
		<footer>
			<div id="footer-bk">
				<div id="footer">
					<small>愛する使徒達よ、闇に飲まれよ！（お疲れ様でした！）</small>
				</div>
			</div>
		</footer>
	</div>



</body>
</html>