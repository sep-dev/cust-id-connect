<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/super.css"/>" media="all">
	<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/notosansjp.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>削除確認</title>
</head>
<body>
<h1>削除確認</h1>
<p>以下のデータを削除します</p>
<br>
<c:out value="${name.name}"/>
<p>


<c:forEach var="obj" items="${cards}"  varStatus="status">
<c:if test="${status.index == 0}">所持カード<br></c:if>
<c:out value="${obj.carddata.cardnumber}" default = "無し"/>
</c:forEach>
</p>
<form action="/Cust-id-connect/list" method=post>
								<input type="hidden" name="id"
									value='<c:out value="${name.id}"></c:out>' /> <input
									type=submit value="削除" >
							</form>
</body>
</html>