<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/super.css"/>"
	media="all">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>例の紐プロジェクト</title>
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

			<table class="table">
				<tr>
					<th><a href="/Cust-id-connect/entry" class="link"><img
							src="./resources/img/kawaiiranko.jpg" width="100%"></a></th>
					<th><a href="/Cust-id-connect/list" class="link"><img
							src="./resources/img/smileranko.jpg" width="100%"></a></th>
					<th><a href="/Cust-id-connect/cardlist" class="link"><img
							src="./resources/img/damaraseruranko.jpg" width="100%"></a></th>
					<th><a href="/Cust-id-connect/mail" class="link"><img
							src="./resources/img/totemokawaiiranko.jpg" width="100%"></a></th>
				</tr>
				<tr>
					<td>顧客の新規登録ができます</td>
					<td>顧客一覧を確認できます</td>
					<td>カード一覧を確認できます</td>
					<td>メール送信ができます</td>
				</tr>
				<tr>
					<td>名前、住所、電話番号の他、メアド、誕生月、性別を任意登録できます</td>
					<td>顧客情報更新、顧客詳細情報、<strong>カードの登録</strong>もこちらから
					</td>
					<td>カード所持者情報、カードポイント更新はこちらから</td>
					<td>メールアドレスが登録された会員全員、もしくは幸運な一人に送れます</td>
				</tr>
			</table>


		</div>
		<footer>
			<div id="footer-bk">
				<div id="footer">
					<small>ククク、我が名は神崎蘭子。私の才能を見抜くとは、貴方も「瞳」の持ち主のようね。運命の扉は、今開かれたわ！（神崎蘭子です。これからプロデュース、お願いします！）</small>
				</div>
			</div>
		</footer>
	</div>

</body>
</html>