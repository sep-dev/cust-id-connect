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
<style type="text/css">

</style>
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
			<td width=20%></td>
			<td align=justify width=20%>氏名</td>
			<td width=10%>:</td>
			<td width=20%><c:out value="${cusdata.name}"></c:out></td>

		</tr>
		<tr>
			<td></td>
			<td align=justify>住所</td>
			<td>:</td>
			<td>${cusdata.address}</td>
		</tr>
		<tr>
			<td></td>
			<td align=justify>電話番号</td>
			<td>:</td>
			<td>${cusdata.tel}</td>
		</tr>
		<tr>
			<td></td>
			<td align=justify>メールアドレス</td>
			<td>:</td>
			<td>${cusdata.mailaddress}</td>
		</tr>
		<tr>
			<td></td>
			<td align=justify>誕生月</td>
			<td>:</td>
			<td>${cusdata.birth}月</td>
		</tr>
		<tr>
			<td></td>
			<td align=justify>性別</td>
			<td>:</td>
			<td>${cusdata.gender}</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td>
			<td><form action="/Cust-id-connect/update">
					<input type="hidden" name="id"
						value='<c:out value="${cusdata.id}"></c:out>' /> <input
						type="submit" value="更新">
				</form></td>
		</tr>
	</table>

	<hr>

	<h2>カード情報</h2>
	<div class="container">

		<table id="example" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align=center>カードナンバー</th>
					<th align=center>ポイント残高</th>


					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${hestialist}" varStatus="status">
					<tr><form:form >
						<td><c:out value="${obj.carddata.cardnumber}"></c:out></td>
						<td><form:input path="point" value="${obj.carddata.point}" style="border:none;" pattern="^[1-9][0-9]+$|0"/>P</td>
					 	<form:hidden path ="cardnumber" value="${obj.carddata.cardnumber}"/>




						<td>

						<input type="submit" name="fuck" value ="更新" onclick="return confirm('ポイント変更しても良いですか？ダメですか？')">
							<form action="/Cust-id-connect/detail" method=post>
								<input type="hidden" name="cardid"
									value='<c:out value="${obj.carddata.cardnumber}"></c:out>' /> <input
									type="hidden" name="cusid"
									value='<c:out value="${obj.customerdata.id}"></c:out>' /> <input
									type=submit name="delete" value="削除"
									onclick="return confirm('削除しても良いですか？')">
							</form>
					</form:form></tr>
				</c:forEach>

			</tbody>
		</table>
		<table>
			<form:form modelAttribute="cardData">
				<tr>
					<td>${fuck}</td>
					<td></td>
				</tr>

				<tr>
					<td><form:input path="cardnumber" placeholder="カードIDを入力"
							size="50" required="required"
							pattern="^[1-9][0-9]{2,4}$"/></td>
					<td><form:input path="point" placeholder="現ポイントを入力" size="50" required="required"
					pattern= "^[1-9][0-9]+$|0" />
					</td>

					<td><input type="submit" name="add" value="登録" /></td>
				</tr>

				<tr>
					<td></td>
				</tr>
			</form:form>
			<tr>
				<td><a href="/Cust-id-connect/list"><input type=button
						value="一覧画面に戻る"></a></td>
				<td><a href="/Cust-id-connect/top"><input type=button
						value="トップ画面に戻る"></a></td>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
		// For demo to fit into DataTables site builder...
		$('#example').removeClass('display').addClass(
				'table table-striped table-bordered');
	</script>
</body>
</html>