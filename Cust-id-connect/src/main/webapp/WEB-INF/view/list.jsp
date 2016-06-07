<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>顧客一覧検索</title>

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
<script language="JavaScript">
	function kakunin(frm) {
		flag = confirm("本当に削除しますか?");
		if (flag) {
			//frm.submit();
			alert("削除しました");
			location.reload();
		}
	}
</script>
</head>
<body>
	<h1>顧客一覧</h1>
	<div class="container">

		<table id="example" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align=center>氏名</th>
					<th align=center>住所</th>
					<th align=center>電話番号</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="obj" items="${cuslist}" varStatus="status">
					<tr>
					<td><c:out value="${obj.name}"></c:out></td>
					<td><c:out value="${obj.address}"></c:out></td>
					<td><c:out value="${obj.tel}"></c:out></td>
					<td><form action="/Cust-id-connect/detail">
					<input type="hidden" name="id" value='<c:out value="${obj.id}"></c:out>' />
					<input type="submit" value="詳細">
					</form>
					</td>
					<td><input type=button value="削除"
						onclick="kakunin(this.form);return false"></td>
					<td><form action="/Cust-id-connect/update">
					<input type="hidden" name="id" value='<c:out value="${obj.id}"></c:out>' />
					<input type="submit" value="更新">
					</form>
					</td>
					</tr>
				</c:forEach>

				<tr>

					<td>テスト さん</td>
					<td>埼玉県</td>
					<td>0120-117-117</td>
					<td><a href="/Cust-id-connect/detail"><input type=button
							value="詳細"></a></td>
					<td><input type=button value="削除"
						onclick="kakunin(this.form);return false"></td>
					<td><a href="/Cust-id-connect/update"><input type=button
							value="更新"></a></td>

				</tr>
				<tr>
					<td>テスト２ さん</td>
					<td>鳥取県</td>
					<td>0120-828-828</td>
					<td><a href="/Cust-id-connect/detail"><input type=button
							value="詳細"></a></td>
					<td><input type=button value="削除"
						onclick="kakunin(this.form);return false"></td>
					<td><a href="/Cust-id-connect/update"><input type=button
							value="更新"></a></td>
				</tr>
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