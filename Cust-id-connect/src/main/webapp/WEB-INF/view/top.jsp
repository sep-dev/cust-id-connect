<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<style type="text/css">
body {
	background-color: #FFE4C4;
	color: pink;
}

.btn {
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	font-size: 26px;
	background: #EEE;
	border-top: 5px solid #C00;
	border-left: 5px solid #09C;
	border-right: 5px solid #9C0;
	border-bottom: 5px solid #FC0;
	color: green;
	width: 200px;
	padding: 20px 0;
}

.title2 {
	background: #0000ff;
	border: 1px solid #DDD;
	color: white;
	text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.5), 1px 1px 1px rgba(0, 0, 0, 0.5);
	width:100%;

padding: 10px 0;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>例の紐プロジェクト</title>
</head>
<body>
	<h1 class="title2" align=center>顧客ポイントカード管理システム</h1>

	<p>${test}</p>

	<P align=center>
		<a class="btn" href="/Cust-id-connect/entry">顧客登録</a> <a class="btn"
			href="/Cust-id-connect/list">顧客一覧</a>
	</P>
	<p align=center>
		<a class="btn" href="/Cust-id-connect/cardlist">カード一覧</a> <a
			class="btn" href="/Cust-id-connect/mail">メール送信</a>
	</p>

</body>
</html>