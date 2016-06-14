<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Refresh" CONTENT="10;URL=/Cust-id-connect/list">
<title>削除エラー</title>
<style type="text/css">
.file {
	font-family: Osaka, Verdana, Arial, Helvetica, sans-serif;
	text-align: center;
	line-height: 150%;
	font-size: 12px;
	color: #333333;
	margin: 70px 0px 0px 0px;
}

.home {
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	font-size: 13px;
	background: black;
	border-top: 2px solid #C00;
	border-left: 2px solid #09C;
	border-right: 2px solid #9C0;
	border-bottom: 2px solid #FC0;
	color: white;
	width: 50px;
	padding: 5px 0;

}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js" charset="UTF-8"></script>
<script type="text/javascript">
function countdown($call, $count) {
  $('#count').text($count);
    if($count) {
      setTimeout(function() {
        $count = $count-1;
        countdown($call, $count);
      }, 1000);
    }else {
      $('body').append($('<scr'+'ipt>'+$call+';<\/scr'+'ipt>'));
  }
}// end function
$(function() {
  countdown('window.location.replace("/Cust-id-connect/list")', 10);
});
</script>
</head>
<body>
	<div class="file">カードを先に削除してください♡</div>
	<div class="file"><span id="count">10</span>秒後に顧客一覧画面に遷移します</div>
<p align=center>
	<a  class="home" href="javascript:history.back()">戻る</a>
</p>


</body>
</html>