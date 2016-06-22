<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/super.css"/>"
	media="all">

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>カード一覧</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').DataTable({
			"language" : {
				"emptyTable" : "データが登録されていません。",
				"info" : "_TOTAL_ 件中 _START_ 件から _END_ 件までを表示",
				"infoEmpty" : "",
				"infoFiltered" : "(_MAX_ 件からの絞り込み表示)",
				"infoPostFix" : "",
				"thousands" : ",",
				"lengthMenu" : "1ページあたりの表示件数: _MENU_",
				"loadingRecords" : "ロード中",
				"processing" : "処理中...",
				"search" : "検索",
				"zeroRecords" : "該当するデータが見つかりませんでした。",
				"paginate" : {
					"first" : "先頭",
					"previous" : "前へ",
					"next" : "次へ",
					"last" : "末尾"
				}
			}
		});
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

			<h1 class="title2">カード一覧</h1>

			<div class="container">

				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th align=center>カードナンバー</th>
							<th align=center>累計ポイント</th>

							<th align=center>氏名</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="obj" items="${cardlist}">
							<tr>
								<td><c:out value="${obj.carddata.cardnumber}" /></td>
								<td><c:out value="${obj.carddata.point}P" /></td>

								<td><c:out value="${obj.customerdata.name}"></c:out></td>
								<td><form action="/Cust-id-connect/detail">
										<%
										    //ここのidをcusidに直す
										%>
										<input type="hidden" name="id"
											value='<c:out value="${obj.customerdata.id}"></c:out>' /><input
											type="submit" value="詳細">
									</form>
								<td>
									<form action="/Cust-id-connect/cardlist" method=post>
										<input type="hidden" name="id"
											value='<c:out value="${obj.carddata.cardnumber}"></c:out>' />
										<input type="submit" value="削除"
											onclick="return confirm('削除しても良いですか？')">
									</form>
								<td><form action="/Cust-id-connect/update">
										<%
										    //ここのidをcusidに直す
										%>
										<input type="hidden" name="id"
											value='<c:out value="${obj.customerdata.id}"></c:out>' /> <input
											type="submit" value="更新">
									</form></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
				<a class="btn" href="/Cust-id-connect/top">トップ画面に戻る</a>

			</div>
		</div>
		<footer>
			<div id="footer-bk">
				<div id="footer">
					<small>いなげドラモン</small>
				</div>
			</div>
		</footer>
	</div>

	<script type="text/javascript">
		// For demo to fit into DataTables site builder...
		$('#example').removeClass('display').addClass(
				'table table-striped table-bordered');
	</script>
</body>
</html>