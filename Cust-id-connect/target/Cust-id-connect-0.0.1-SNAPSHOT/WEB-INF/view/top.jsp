<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>例の紐プロジェクト</title>
</head>
<body>
	<h1 align=center>顧客ポイントカード管理システム</h1>

	<p>${test}</p>

	<P align=center>
		<a href="/Cust-id-connect/entry"><input type=button value="顧客登録"></a>
		<a href="/Cust-id-connect/list"><input type=button value="顧客一覧"></a>
	</P>
	<p align=center>
		<a href="/Cust-id-connect/list"><input type=button value="カード一覧"></a>
		<a href="/Cust-id-connect/mail"><input type=button value="メール送信"></a>
	</p>

</body>
</html>