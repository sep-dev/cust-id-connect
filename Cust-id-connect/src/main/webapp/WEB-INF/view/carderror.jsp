<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/super.css"/>"
	media="all">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/notosansjp.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Refresh" CONTENT="10;URL=/Cust-id-connect/list">
<title>削除エラー</title>
<style type="text/css">
.file {
	font-family: Osaka, Verdana, Arial, Helvetica, sans-serif;
	text-align: center;
	line-height: 150%;
	font-size: 12px;
	color: #333333;
	margin: 70px 0px 0px 0px;
}

.home {
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	font-size: 13px;
	background: black;
	border-top: 2px solid #C00;
	border-left: 2px solid #09C;
	border-right: 2px solid #9C0;
	border-bottom: 2px solid #FC0;
	color: white;
	width: 50px;
	padding: 5px 0;
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

		<div id="header">
			<div id="site_logo"></div>
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
		<div class="file">カードを先に削除してください♡</div>
		<div class="file">
			<span id="count">10</span>秒後に顧客一覧画面に遷移します
		</div>
		<p align=center>
			<a class="home" href="javascript:history.back()">戻る</a>
		</p>

	</div>
	<div id="footer-bk">
		<div id="footer">
			<small>いなげドラモン</small>
		</div>
	</div>
</body>
</html>