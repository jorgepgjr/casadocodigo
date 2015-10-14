package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.models.Product;

@Controller
public class ProductsController {

	@Autowired
	private ProdutoDAO produtoDAO; 
	
	@RequestMapping("/products/form")
	public String form(){
		return "products/form";
	}
	
	@RequestMapping("/products")
	public String save(Product product){
		System.out.println("Cadastrando o produto " + product);
		produtoDAO.save(product);
		return "products/ok";
	}
}
