#Set up
 - create a Mysql db: 
 mysql -u root 
 create database casadocodigo
 
-Criando usuários com senha 123456

```SQL
 insert into Role values('ROLE_ADMIN');
insert into Role values('ROLE_COMPRADOR');
insert into User(login,name,password) values('comprador@gmail.com','Comprador','$2a$10$3Qrx0rv8qSmZ8s3RlD5qE.upleP7.Qzbg5EoIAm62evEkY4c023TK');
insert into User(login,name,password) values('admin@casadocodigo.com.br','Administrador','$2a$10$3Qrx0rv8qSmZ8s3RlD5qE.upleP7.Qzbg5EoIAm62evEkY4c023TK');
insert into User_Role(User_login,roles_name) values('comprador@gmail.com','ROLE_COMPRADOR');
insert into User_Role(User_login,roles_name) values('admin@casadocodigo.com.br','ROLE_ADMIN');
```

# Notes 

### Metodos de requisição
- GET    -> consulta
- POST   -> inserção	
- DELETE -> exclusão
- PUT    -> atualização total
- PATCH  -> atualização parcial
<br>
Unicos methodos que os Browser entendem: GET e POST
 
### Forward e Redirect
- Diferenças: http://www.javapractices.com/topic/TopicAction.do?Id=181

- Boas práticas, SEMPRE que fizer um POST, faça um redirect para evitar que o refresh da página envie o formulário novamente pro servidor; 
 
- Flash Scope: Dura apenas duas requisições. Usado por exemplo depois de cadastrar algo no BD e dar um redirect para outra action, conseguir pegar um parametro do primeiro request; 
 
### Validação
- http://www.devmedia.com.br/bean-validation-1-1-validando-dados-com-anotacoes/30070
- Usando o @Valid dentro do objeto que recebemos no controller;
```java
@RequestMapping(method=RequestMethod.POST)
public String save(@Valid Product product, BindingResult result, RedirectAttributes ra){
	//Verificando se tem erros de validacao
	if (result.hasErrors()) {
		return "products/form";
}
```
- As mensagens de erro podem ficar em um arquivo .properties, configurado no Spring11.

### Upload de arquivo
- Colocamos na assinatura do metodo do Controler o MultipartFile summary que conterá o file.
```java
@RequestMapping(method=RequestMethod.POST)
	public ModelAndView save(@Valid Product product, BindingResult result, RedirectAttributes ra, MultipartFile summary){
```
 - No form colocamos o enctype:
```html 
 <form:form action="${spring:mvcUrl('PC#save').build()}" method="post"
		commandName="product" enctype="multipart/form-data">
```
 - Em configurações, precisamos configurar o MultipartResolver nas configurações do Spring
```java
	@Bean
	public MultipartResolver multipartResolver(){
		return new StandardServletMultipartResolver();
	}
```
- Precisamos registrar também na nossa configuração 
```java
	@Override
	protected void customizeRegistration(Dynamic registration) {
		registration.setMultipartConfig(new MultipartConfigElement(""));
	}
```

### Requisições Assíncrinas

- A Servlet do Spring MVC já vem preparada para trabalhar de modo assíncrono, usando Callable.
```java
public Callable<String> checkout(){
		return () -> {
			BigDecimal total = shoppingCart.getTotal();
						
			String uriToPay =
					"http://book-payment.herokuapp.com/payment";
			try{
				String response = restTemplate.postForObject(uriToPay, new PaymentData(total), String.class);
				System.out.println(response);
				return "redirect:/products";				
			} catch (HttpClientErrorException exception){
				System.out.println("Ocorreu um erro ao criar o Pagamento: " + exception.getMessage());
				return "redirect:/shopping";
			}
		};
	}
```
- Precisamos falar para o Spring que vamos usar o RestTemplate
```java
	@Bean
	public RestTemplate restTemplate(){
		return new RestTemplate();
	}
```

### Cache
- Alguns gerenciadoes de cache:
	* guava
	* ehcache
	* mencahce
	* coherence

-Precisamos avisar o Spring que vamos usar cache, colcando a anotação @EnableCaching na nossa classe de configuração (AppWebConfiguration.java). Também precisamos colocar o bean nessa configuração:
```java
	@Bean
	public CacheManager cacheManager(){
		return new ConcurrentMapCacheManager();			
	}
```

- Para cachear o ModelAndView usamos a anotação @Cacheable junto com uma chave para esse cache
```java
	@Cacheable("lastProducts")
	public ModelAndView list(){
```

- Para invalidar esse cache, usamos o @CacheEvict
```java
	@CacheEvict(value = "lastProducts", allEntries=true)
	public ModelAndView save(@Valid Product product, BindingResult result, RedirectAttributes ra, MultipartFile summary){
```
### Respondendo em mais de um formato

-Configuramos mais de um ViewResolver para dizer pro Spring que podemos responder em varios formatos. Vamos usar o contentNegotiatingViewResolver configurado em AppWebConfiguration.
```java
	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager){
		List<ViewResolver> resolvers = new ArrayList<ViewResolver>();
		resolvers.add(internalResourceViewResolver()); //Resolver padrão JSP
		resolvers.add(new JsonViewResolver());   //Resolver para Json
		resolvers.add(new XmlViewResolver());	 //Resolver para XML
		
		ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
		resolver.setViewResolvers(resolvers);
		resolver.setContentNegotiationManager(manager);
		return resolver;
	}
```

#### 
Setup my project