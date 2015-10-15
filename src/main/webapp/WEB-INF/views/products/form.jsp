<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Casa do codigo</title>
</head>
<body>
	<h1>Casa do Código</h1>
	<c:url value="/products" var="url"/>
		<form action="${url}" method="post">
		<label for="title">Título</label>
		<input type="text" name="title" id="title"/>
		
		<label for="description">Descrição</label>
		<textarea rows="4" cols="150" name="description" id="description">
		</textarea>
		
		<label for="numberOfPages">Numero de páginas</label>
		<input type="text" name="numberOfPages" id="numberOfPages"/>
		<input type="submit" value="Enviar">

		<div>
		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${bookType}">${bookType}</label>
				<input type="text" name="prices[${status.index}].value" id="price_${bookType}"/>
				
				<input type="hidden"
				name="prices[${status.index}].bookType" 
				value="${bookType}"/>
			</div>
		</c:forEach>
		</div>
	</form>
</body>
</html>