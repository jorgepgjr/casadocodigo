<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html class="no-js" lang="pt">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<title>${product.title}</title>
	
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/style.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/layout-colors.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/responsivo-style.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
	<link href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/guia-do-programador-style.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
	<link href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/products.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
</head>

<c:url value="/shopping" var="shoppingCartUrl" />
<body class="product">
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

	<article id="${product.title}" itemscope itemtype="http://schema.org/Book">
		<header id="product-highlight" class="clearfix">
			<div id="product-overview" class="container">
				<img itemprop="image" width="280px" height="395px" src='http://cdn.shopify.com/s/files/1/0155/7645/products/cover-apis-java_large.jpeg?v=1423244220' class="product-featured-image" alt="${product.title}">
				<h1 class="product-title" itemprop="name">${product.title}</h1>
				<p class="product-author">
					<span class="product-author-link"></span>
				</p>

				<p itemprop="description" class="book-description">
					${product.description}<br/>
					 Veja o <a href="<c:url value='/${product.summaryPath}'/>" target="_blank">sum&#225;rio</a> completo do livro!
				</p>
			</div>
		</header>
		
		<section class="buy-options clearfix">
			<form action="${shoppingCartUrl}" method="post" class="container">
				<input type="hidden" value="${product.id}" name="productId"/>
				<ul id="variants" class="clearfix">
					<c:forEach items="${product.prices}" var="price">
						<li class="buy-option">
							<input type="radio" name="bookType" class="variant-radio" id="${product.id}-${price.bookType}"
								value="${price.bookType}" ${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label class="variant-label" for="${product.id}-${price.bookType}"> 
								${price.bookType}
							</label>
							<p class="variant-price">${price.value}</p>
						</li>
					</c:forEach>
				</ul>

				<input type="submit" class="submit-image icon-basket-alt" alt="Compre agora" title="Compre agora '${product.title}'!" value="comprar"/>
			</form>
		</section>

		<div class="container">
			<section class="author product-detail" itemprop="author" itemscope itemtype="http://schema.org/Person">
				<h2 class="section-title" itemprop="name">${product.title}</h2>
				<span itemprop="description">
					<p class="book-description">${product.description}</p>
				</span>
			</section>

			<section class="data product-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>
					Número de paginas: <span itemprop="numberOfPages">${product.numberOfPages}</span>
				</p>

				<p></p>
				<p>
					Encontrou um erro? <a href='/submissao-errata' target='_blank'>Submeta uma errata</a>
				</p>
			</section>
		</div>
	</article>

	<footer id="layout-footer">
		<div class="clearfix container">
			<nav class="breadcrumbs" itemprop="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#"></nav>

			<div id="collections-footer">
				<!-- cdc-footer -->
				<p class="footer-title">Coleções de Programação</p>
				<ul class="footer-text-links">
					<li>
						<a href="/collections/livros-de-java">Java</a>
					</li>
					<li>
						<a href="/collections/livros-desenvolvimento-web">Desenvolvimento Web</a>
					</li>
					<li>
						<a href="/collections/livros-de-mobile">Mobile</a>
					</li>
					<li>
						<a href="/collections/games">Games</a>
					</li>
					<li>
						<a href="/collections/livros-de-front-end">Front End</a>
					</li>
				</ul>
				
				<p class="footer-title">Outros Assuntos</p>
				
				<ul class="footer-text-links">
					<li>
						<a href="/collections/livros-de-agile">Agile</a>
					</li>
					<li>
						<a href="/collections/outros">e outros...</a>
					</li>
				</ul>
			</div>
			
			<div id="social-footer">
				<!-- books-footer -->
				<p class="footer-title">Links da Casa do Código</p>
				<ul class="footer-text-links">
					<li>
						<a href="http://livros.casadocodigo.com.br" rel="nofollow">Meus E-books</a>
					</li>
					<li>
						<a href="/pages/sobre-a-casa-do-codigo">Sobre a Casa do Código</a>
					</li>
					<li>
						<a href="/pages/perguntas-frequentes">Perguntas Frequentes</a>
					</li>
					<li>
						<a href="https://www.caelum.com.br">Caelum - Ensino e Inovação</a>
					</li>
					<li>
						<a href="http://www.codecrushing.com/" rel="nofollow">Code Crushing</a>
					</li>
				</ul>
				
				<p class="footer-title">Redes Sociais</p>
				
				<ul>
					<li class="social-links">
						<a href="http://www.twitter.com/casadocodigo" target="_blank" id="twitter" rel="nofollow">Facebook</a>						
						<a href="http://www.facebook.com/casadocodigo" target="_blank" id="facebook" rel="nofollow">Twitter</a>
					</li>
				</ul>
			</div>
			
			<div id="newsletter-footer">
				<!-- social-footer -->
				<p class="footer-title">Receba as Novidades e Lançamentos</p>
				<div id="form-newsletter">
					<form action="https://docs.google.com/spreadsheet/formResponse?formkey=dFhxZ2tDalFiclU4T2FLZVY4UXVUc2c6MQ&embedded=true&ifq"
						method="POST" id="ss-form" class="form-newsletter">
						<ul>
							<li>
								<input type="hidden" name="pageNumber" value="0">
								<input type="hidden" name="backupCache" value="">
								<input type="email" name="entry.0.single" value="" class="ss-q-short" id="entry_0" placeholder="seu@email.com">
							</li>
							<li>
								<input type="submit" name="submit" value="Quero Receber!" id="submit-newsletter">
							</li>
						</ul>
					</form>
					
					<ul>
						<li class="ie8">
							<a href="https://docs.google.com/spreadsheet/viewform?formkey=dFhxZ2tDalFiclU4T2FLZVY4UXVUc2c6MQ&ifq" rel="nofollow">Receba as Novidades e Lançamentos</a>
						</li>
					</ul>
				</div>
				
				<ul class="footer-payments">
					<li>
						<img class="accepts-paypal" src="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/accepts_paypal.png?58522" border="0" alt="Paypal" width="130" height="80" />
					</li>
					<li>
						<img class="accepts-pagseguro" src="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/logopagseguro.png?58522" border="0" alt="PagSeguro" width="180" height="26" />
					</li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>
