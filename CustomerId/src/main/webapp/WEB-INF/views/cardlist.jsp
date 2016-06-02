<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		"language": {
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
					<th align=center>ポイント残高</th>
					<th align=center>氏名</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>00002</td>
					<td>2P</td>
					<td>2P</td>
					<td>テスト２　さん</td>
					<td><input type = button value = "詳細" onclick="location.href ='/ManageCard/detail/'"></td>
					<td><input type = button value = "削除" onclick="kakunin(this.form);return false"></td>
					<td><input type = button value = "更新" onclick="location.href = '/ManageCard/update/'"></td>
				</tr>
				<tr>
					<td>00004</td>
					<td>10000P</td>
					<td>10000P</td>
					<td>テスト　さん</td>
					<td><input type = button value = "詳細" onclick="location.href ='/ManageCard/detail/'"></td>
					<td><input type = button value = "削除" onclick="kakunin(this.form);return false"></td>
					<td><input type = button value = "更新" onclick="location.href = '/ManageCard/update/'"></td>
				</tr>
			</tbody>
		</table>
<input type = button value = "トップ画面に戻る" onclick = "location.href ='/ManageCard/'">

	</div>

	<script type="text/javascript">
	// For demo to fit into DataTables site builder...
	$('#example')
		.removeClass( 'display' )
		.addClass('table table-striped table-bordered');
</script>
</body>
</html>