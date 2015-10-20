<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Carrinho de Compras</title>
	
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/cssbase-min.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/fonts.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/fontello-ie7.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/fontello-embedded.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/fontello.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
    <link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/book-collection.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
    <link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/style.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/layout-colors.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/responsivo-style.css?1463716112737630901" rel="stylesheet" type="text/css"  media="all"  />
</head>

<body class="cart">
	<header id="layout-header">
		<div class="clearfix container">
			<a href="/" id="logo"></a>
			<div id="header-content">
				<nav id="main-nav">
					<ul class="clearfix">
						<li>
							<a href="${shoppingCartUrl}" rel="nofollow">Seu carrinho (${shoppingCart.quantity})</a>
						</li>
						<li>
							<a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre nós</a>
						</li>
						<li>
							<a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas Frequentes</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

	<nav class="categories-nav">
		<ul class="container">
			<li class="category">
				<a href="http://www.casadocodigo.com.br">Home</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-agile">Agile</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-front-end">Front End</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-games">Games</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-java">Java</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-mobile">Mobile</a>
			</li>
			<li class="category">
				<a href="/collections/livros-desenvolvimento-web">Web</a>
			</li>
			<li class="category">
				<a href="/collections/outros">Outros</a>
			</li>
		</ul>
	</nav>

	<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras</h2>
		<table id="cart-table">
			<colgroup>
				<col class="item-price-col">
				<col class="item-quantity-col">
				<col class="line-price-col">
			</colgroup>
			<thead>
				<tr>
					<th width="70%">Item</th>
					<th width="10%">Preço</th>
					<th width="10%">Quantidade</th>
					<th width="10%">Total</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${shoppingCart.list}" var="item">
					<tr>
						<td class="item-title">${item.product.title}-${item.bookType}</td>
						<td class="numeric-cell">${item.price}</td>
						<td class="quantity-input-cell">${shoppingCart.getQuantity(item)}</td>
						<td class="numeric-cell">${shoppingCart.getTotal(item)}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<c:url value="/shopping/checkout" var="checkoutUrl"/>
						<form:form action="${checkoutUrl}" method="post">
							<input type="submit" class="checkout" name="checkout" value="Finalizar compra" id="checkout" />
						</form:form>
					</td>
					<td></td>
					<td class="numeric-cell">${shoppingCart.total}</td>
				</tr>
			</tfoot>
		</table>
	</section>
</body>
</html>