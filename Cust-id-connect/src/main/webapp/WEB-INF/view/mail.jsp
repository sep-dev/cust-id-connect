<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<link rel="stylesheet" href="<c:url value="/resources/css/super.css"/>"
	media="all">

<title>メール送信画面</title>

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
			<h1>メール送信</h1>
			<form:form modelAttribute="mailModel" >
				<table>
					<tr>
						<td>宛先</td>
						<td><div class="drop">
								<form:select class="select" path="to" id="kyurukefontwerupusuto"
									required="required">
									<!-- <option value = "gomi" disabled selected>宛先を選択</option> -->
									<option class="option" value="all">全員</option>
									<option class="option" value="random">ランダム</option>
									<!-- <option value = "tarou8503@gmail.com">プラチナ会員</option> 誕生月とか実装予定-->
									<!-- <option value = "tarou8503@gmail.com">その他</option>ひとまずスルー -->
								</form:select>
							</div></td>
					</tr>



					<tr></tr>
					<tr>
						<td>件名</td>
						<td><form:input path="subject" placeholder="ここに件名を入力"
								required="required" /></td>
					</tr>
					<tr></tr>
					<tr>
						<td>本文</td>
						<td><form:textarea path="honbun" cols="40" rows="10"
								required="required" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="送信する" class="submit"
							onclick="return confirm('送信しても良いですか？')" /></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
			</form:form>
		</div>
		<footer>
			<div id="footer-bk">
				<div id="footer">
					<p>はじめは、ただうち震えていたわ…。私の魔力が、本当に通じるのかどうか（アイドル、本当にできるのか不安でした）</p>
<p>しかし今、茨に足を捕られる恐れより、花園の奥を望む心が強くなった…（でも、すっごく興味が湧いてきて…）</p>
<p>ゆえに、盟約は結ばれた！我をいざなえ、いなげドラゴン（決心がつきました！プロデュース、お願いします！）</p>
				</div>
			</div>
		</footer>
	</div>

</body>
</html>
