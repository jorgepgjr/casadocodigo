package br.com.casadocodigo.loja.controllers;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.dao.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

/**
 * Controller of Products;
 * @author Jorge Peres
 *
 */
@Controller
public class ProductsController {

	@Autowired
	private ProductDAO productDAO; 
	
	@RequestMapping("/products/form")
	public ModelAndView form(){
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}
	
	@RequestMapping("/products")
	@Transactional
	public String save(Product product){
		System.out.println("Cadastrando o produto " + product);
		productDAO.save(product);
		return "products/ok";
	}
}
