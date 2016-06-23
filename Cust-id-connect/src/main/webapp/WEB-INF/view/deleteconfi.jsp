<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<link rel="stylesheet" href="<c:url value="/resources/css/super.css"/>"
	media="all">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/notosansjp.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>削除確認</title>
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
			<h1>削除確認</h1>
			<p>以下のデータを削除します</p>
			<br>
			<c:out value="${name.name}" />
			<p>


				<c:forEach var="obj" items="${cards}" varStatus="status">
					<c:if test="${status.index == 0}">所持カード<br>
					</c:if>
					<c:out value="${obj.carddata.cardnumber}" default="無し" />
				</c:forEach>
			</p>
			<form action="/Cust-id-connect/list" method=post>
				<input type="hidden" name="id"
					value='<c:out value="${name.id}"></c:out>' /> <input type=submit
					value="削除">
			</form>
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