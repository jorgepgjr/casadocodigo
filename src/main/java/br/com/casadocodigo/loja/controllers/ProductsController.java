package br.com.casadocodigo.loja.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.ProductDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.validator.ProductValidator;

/**
 * Controller of Products;
 * @author Jorge Peres
 *
 */
@Controller
@RequestMapping("/products")
public class ProductsController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductValidator validator;
	
	@Autowired
	private FileSaver fileSaver;
	
	@InitBinder
	public void addValidator(WebDataBinder binder){
		binder.addValidators(validator);
	}
	
	@RequestMapping("/form")
	public ModelAndView form(Product product){
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}
	
	@Transactional
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value = "lastProducts", allEntries=true)
	public ModelAndView save(@Valid Product product, BindingResult result, RedirectAttributes ra, MultipartFile summary){
		
		//Verificando se tem erros de validacao
		if (result.hasErrors()) {
			return form(product);
		}

		String filename = fileSaver.write("arquivos", summary);
		product.setSummaryPath(filename);
		System.out.println("Cadastrando o produto " + product);
		productDAO.save(product);
		ra.addFlashAttribute("sucesso", "Produto Cadastrado com Sucesso");
		return new ModelAndView("redirect:/products");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	@Transactional
	@Cacheable("lastProducts")
	public ModelAndView list(){		
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/{id}")
	@Transactional
	public ModelAndView show(@PathVariable("id") Integer id){		
		ModelAndView modelAndView = new ModelAndView("products/show");
		modelAndView.addObject("product", productDAO.find(id));
		return modelAndView;
	}
}
