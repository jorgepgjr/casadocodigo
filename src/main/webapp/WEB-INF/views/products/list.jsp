<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Casa do codigo</title>
</head>
<body>
	<h1>Casa do Código</h1>
	<div>${sucesso}</div>
	<div>
		<table style="width: 100%">
			<tr>
				<th>Id
				</th>
				<th>Title
				</th>
				<th>Descrição
				</th>
				<th>Numer de Páginas
				</th>
				<th>Data de Lançamento
				</th>
				<th>Caminho do sumário
				</th>
				<th>Preço Ebook
				</th>
				<th>Preço Printed
				</th>
				<th>Preço Combo
				</th>				
			</tr>
			<c:forEach items="${products}" var="product" varStatus="status">
				<tr>
					<td>${product.id}</td>
					<td>${product.title}</td>
					<td>${product.description}</td>
					<td>${product.numberOfPages}</td>
					<td>${product.summaryPath}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy"
							value="${product.releaseDate.time}" /></td>
					<c:forEach items="${product.prices}" var="price">
						<td>${price.value}</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>