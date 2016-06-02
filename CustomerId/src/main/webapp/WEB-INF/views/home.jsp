<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>顧客ポイントカード管理システム</title>

</head>
<body>
	<h1 align=center>顧客ポイントカード管理システム</h1>

	<P align=center>
		<a href="/seproject/entry"><input type=button value="顧客登録"></a>
		<a href="/seproject/list"><input type=button value="顧客一覧"></a>
	</P>
	<p align=center>
		<a href="/seproject/list"><input type=button value="カード一覧"></a>
		<a href="seproject/mail"><input type=button value="メール送信"></a>
	</p>
</body>
</html>
