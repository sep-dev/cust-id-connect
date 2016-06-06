<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>詳細</title>

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
			alert("削除しました");
			location.reload();
		}
	}
	function tuika(frm) {
		alert("追加しました")
		location.reload();
	}
</script>
</head>
<body>
	<h1>顧客詳細</h1>
	<table>

		<tr>
			<td align=right>氏名：</td>
			<td>テスト さん</td>
		</tr>
		<tr>
			<td align=right>住所：</td>
			<td>埼玉県</td>
		</tr>
		<tr>
			<td align=right>電話番号：</td>
			<td>0120-117-117</td>
		</tr>
		<tr>
			<td align=right>メールアドレス：</td>
			<td>y.maeda@haru-house.com</td>
		</tr>
		<tr>
			<td align=right>誕生月：</td>
			<td>4月</td>
		</tr>


	</table>
	<a href="/Cust-id-connect/update"><input type=button
			value="更新"></a>
	<hr>

	<h2>カード情報</h2>
	<div class="container">

		<table id="example" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align=center>カードナンバー</th>
					<th align=center>累計ポイント</th>
					<th align=center>ポイント残高</th>

					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>00001</td>
					<td>100P</td>
					<td>0P</td>

					<td><input type=button value="削除"
						onclick="kakunin(this.form);return false"></td>

				</tr>
				<tr>
					<td>00004</td>
					<td>10000P</td>
					<td>10000P</td>

					<td><input type=button value="削除"
						onclick="kakunin(this.form);return false"></td>
			</tbody>
		</table>
		<br>
		<form:form modelAttribute="cardData">
			<br>
			<form:input path="cardnumber" placeholder="カードIDを入力" size="50" />
			<form:input path="point" placeholder="現ポイントを入力" size="50" />
			<input type="submit" value="登録" />
			<br>
			<br>
		</form:form>
		<br> <a href="/Cust-id-connect/list"><input type=button
			value="一覧画面に戻る"></a> <a href="/Cust-id-connect/top"><input
			type=button value="トップ画面に戻る"></a>
	</div>

	<script type="text/javascript">
		// For demo to fit into DataTables site builder...
		$('#example').removeClass('display').addClass(
				'table table-striped table-bordered');
	</script>
</body>
</html>