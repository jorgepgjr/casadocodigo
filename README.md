#Set up
 - create a Mysql db: 
 mysql -u root 
 create database casadocodigo

#Notes 

##Metodos de requisição
- GET    -> consulta
- POST   -> inserção	
- DELETE -> exclusão
- PUT    -> atualização total
- PATCH  -> atualização parcial
<br>
Unicos methodos que os Browser entendem: GET e POST
 
##Forward e Redirect
- Diferenças: http://www.javapractices.com/topic/TopicAction.do?Id=181

- Boas práticas, SEMPRE que fizer um POST, faça um redirect para evitar que o refresh da página envie o formulário novamente pro servidor; 
 
- Flash Scope: Dura apenas duas requisições. Usado por exemplo depois de cadastrar algo no BD e dar um redirect para outra action, conseguir pegar um parametro do primeiro request; 
 
##Validação
- http://www.devmedia.com.br/bean-validation-1-1-validando-dados-com-anotacoes/30070
- Usando o @Valid dentro do objeto que recebos no controller;
ex: <code>	@RequestMapping(method=RequestMethod.POST)
	public String save(@Valid Product product, BindingResult result, RedirectAttributes ra){
		//Verificando se tem erros de validacao
		if (result.hasErrors()) {
			return "products/form";
		}
</code>




  