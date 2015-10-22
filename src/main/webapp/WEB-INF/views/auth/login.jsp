<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<h3>Efetue Login</h3>
	<form:form servletRelativeAction="/login">
		<table>
			<tr>
				<td>Login:</td>
				<td><input type="text" name="username" value="" /></td>
			</tr>
			<tr>
				<td>Senha:</td>
				<td><input type="password" name="password" value="" /></td>
			</tr>
			<tr>
				<td colspan="2"><input name="sbmit" type="submit" value="Logar"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>