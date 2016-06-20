<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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