<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>メール送信画面</title>
<script>
function fuck(){
	selindex = document.forms.kanzakiharia.kyurukefontwerupusuto.selectIndex
	if(selindex = 0){
		alert("宛先を設定してくだしあ")
	}}

</script>
<style>
html, body
{
    margin: 0;
    padding: 0;
}
h1{
    /* 余白は適当に調整してください */
    margin: 20px 0 20px 0;
    padding: 0 160px 0 60px;
    /* サイズも適当に調整してください */
    font-size: 32px;
    height: 50px;
    line-height: 50px;

    /* 内容に応じた幅になるよう inline-block を指定する */
    display: inline-block;

    color: white;

    /* 今回の本題とは関係ない。文字を立体的にしているけどあんま効果感じない */
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 1);

    /* ここがステッチになる */
    border-style: dashed none;
    border-width: 1px;
    border-color: #FFFFFF;

    /* relative にしてスタックを生成 */
    position: relative;
    /* before 擬似要素を裏に持っていくために必要 */
    z-index: auto;
}

    body > h1:before
    {
        content: "";

        /* 右側のボーダーだけ透明色とすることでリボンの形を表現 */
        border-style: solid;
        border-color: blue transparent blue blue;
        border-width: 30px;
        height: 0;

        /* 立体感出してるだけ */
        box-shadow: -1px 1px 1px #000000;

        /* 位置の指定 */
        position: absolute;
        left: 0;
        right: -7px;
        top: -5px;
        bottom: 0;

        /* z-index を負の数にして h1 より後ろに持っていく */
        z-index: -1;
    }


.submit{
    border:1px solid #777;
    padding: 4px 10px;
    color: #fff;
    cursor: pointer;
    background: #428ec9;
    border-radius: 5px;

}
.modoru{ border:1px solid #777;
    padding: 4px 10px;
    color: #fff;
    cursor: pointer;
    background: pink;
    border-radius: 5px;}
</style>


</head>
<body>
	<h1>メール送信</h1>
	<form:form modelAttribute = "mailModel" id = "kanzakiharia">
		<table>
			<tr>
				<td>宛先</td>
				<td><div class="drop"><form:select class="select" path = "to"  id = "kyurukefontwerupusuto" required="required">
						<!-- <option value = "gomi" disabled selected>宛先を選択</option> -->
						<option class ="option" value = "all">全員</option>
						<option class ="option"value = "random">ランダム</option>
						<!-- <option value = "tarou8503@gmail.com">プラチナ会員</option> 誕生月とか実装予定-->
						<!-- <option value = "tarou8503@gmail.com">その他</option>ひとまずスルー -->
				</form:select></div></td>
			</tr>



			<tr></tr>
			<tr>
				<td>件名</td>
				<td><form:input path="subject"  placeholder="ここに件名を入力"
					required="required"/></td>
			</tr>
			<tr></tr>
			<tr>
				<td>本文</td>
				<td><form:textarea path="honbun" cols="40" rows="10" required="required"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="送信する" class="submit"onclick="return confirm('送信しても良いですか？')"/></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="/Cust-id-connect/top"><input type="button" class="modoru"
						value="トップ画面に戻る"></a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
