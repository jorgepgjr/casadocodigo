<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Casa do codigo</title>
</head>
<body>
	<h1>Casa do Código</h1>
<%-- 	<c:url value="/products" var="url"/> --%>
<%-- 		<form:form action="${url}" method="post" commandName="product"> --%>
		<form:form action="${spring:mvcUrl('PC#save').build()}" method="post" commandName="product">
		<label for="title">Título</label>
		<form:errors path="title"/>
		<form:input type="text" path="title" id="title"/>
		<br/>
		<label for="description" >Descrição</label>
		<form:errors path="title"/>
		<form:textarea rows="4" cols="150" path="description" id="description"/>
		
		<label for="numberOfPages">Numero de páginas</label>
		<form:errors path="numberOfPages"/>
		<form:input type="text" path="numberOfPages"/>

		<div>
			<c:forEach items="${types}" var="bookType" varStatus="status">
				<div>
					<label for="price_${bookType}">${bookType}</label> <form:input
						type="text" path="prices[${status.index}].value"
						id="price_${bookType}" /> <form:input type="hidden"
						path="prices[${status.index}].bookType" value="${bookType}" />
				</div>
			</c:forEach>
		</div>
		<input type="submit" value="Enviar">
	</form:form>
</body>
</html>