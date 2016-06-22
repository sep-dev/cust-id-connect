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

<style type="text/css">
body {
	font-family: Osaka, Verdana, Arial, Helvetica, sans-serif;
	text-align: center;
	line-height: 150%;
	font-size: 12px;
	color: #333333;
	margin: 70px 0px 0px 0px;
}

.404 {
	width: 500px;
	text-align: left;
}

.4042 {
	width: 60px;
	line-height: 170%;
	background: #009900;
	margin: 0 auto;
	padding: 10px;
	font-size: 22px;
	font-weight: bold;
	color: #FFFFFF;
	text-align: center;
}

.file {
	width: 500px;
	margin: 25px auto;
	padding: 10px 0;
	font-size: 24px;
	font-weight: bold;
	text-align: left;
}

.main {
	width: 500px;
	margin: 0 auto;
	padding: 0 0 25px 0;
	text-align: left;
	border-bottom: #999999 1px solid;
}

.home {
	text-align: right;
	margin: 10px 10px 0 0;
}

.foot {
	width: 500px;
	margin: 0 auto;
	padding: 10px 10px 20px 10px;
	text-align: right;
	font-size: 10px;
}

a:link {
	color: #009900;
	text-decoration: none;
}

a:visited {
	color: #009900;
	text-decoration: none;
}

a:hover {
	color: #FF0000;
	text-decoration: underline;
}
</style>
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
				<div id="site_logo"></div>
				<h1>†ポイントカード管理システム†</h1>

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
			<div class="404">
				<div class="4042">登録エラー</div>
			</div>

			<div class="file">そのカード番号は既に使用されております</div>
			<div class="main">
				<span id="count">10</span>秒後に顧客一覧画面に遷移します <br>

				<div class="home">
					<a href="javascript:history.back()">戻る</a>
				</div>
			</div>
			<div class="foot"></div>
		</div>
		<footer>
			<div id="footer-bk">
				<div id="footer">
					<small>いなげドラモン</small>
				</div>
			</div>
		</footer>
	</div>



</body>
</html>