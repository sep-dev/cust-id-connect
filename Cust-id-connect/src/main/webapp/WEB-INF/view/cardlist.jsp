<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
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
	<h1>カード一覧</h1>

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

				<c:forEach var="obj" items="${cardlist}" varStatus="status">
					<tr>
						<td><c:out value="${obj.cardnumber}"></c:out></td>
						<td><c:out value="${obj.point}P"></c:out></td>

						<td>"S{obj.name}"</td>
						<td><form action="/Cust-id-connect/detail">
								<%
								    //ここのidをcusidに直す
								%>
								<input type="hidden" name="id"
									value='<c:out value="${obj.id}"></c:out>' /> <input
									type="submit" value="詳細">
							</form>
						<td>
							<form action="/Cust-id-connect/cardlist" method=post>
								<input type="hidden" name="id"
									value='<c:out value="${obj.id}"></c:out>' /> <input
									type="submit" value="削除"
									onclick="return confirm('削除しても良いですか？')">
							</form>
						<td><form action="/Cust-id-connect/update">
								<%
								    //ここのidをcusidに直す
								%>
								<input type="hidden" name="id"
									value='<c:out value="${obj.id}"></c:out>' /> <input
									type="submit" value="更新">
							</form></td>
					</tr>
				</c:forEach>

				<!-- <tr>
					<td>00002</td>
					<td>2P</td>
					<td>2P</td>
					<td>テスト２ さん</td>
					<td><a href="/Cust-id-connect/detail"><input type=button value="詳細"></a></td>
					<td><input type=button value="削除"
						onclick="kakunin(this.form);return false"></td>
					<td><a href="/Cust-id-connect/update"><input type=button value="更新"></a></td>
				</tr>
				<tr>
					<td>00004</td>
					<td>10000P</td>
					<td>10000P</td>
					<td>テスト さん</td>
					<td><a href="/Cust-id-connect/detail"><input type=button value="詳細"></a></td>
					<td><input type=button value="削除"
						onclick="kakunin(this.form);return false"></td>
					<td><a href="/Cust-id-connect/update"><input type=button value="更新"></a></td>
				</tr> -->
			</tbody>
		</table>
		<a href="/Cust-id-connect/top"><input type=button value="トップ画面に戻る"></a>

	</div>

	<script type="text/javascript">
		// For demo to fit into DataTables site builder...
		$('#example').removeClass('display').addClass(
				'table table-striped table-bordered');
	</script>
</body>
</html>