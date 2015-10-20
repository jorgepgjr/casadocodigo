package br.com.casadocodigo.loja.controllers;

import java.math.BigDecimal;
import java.util.concurrent.Callable;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.dao.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.PaymentData;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.ShoppingItem;

/**
 * Controller of Shopping Cart;
 * 
 * @author Jorge Peres
 *
 */
@Controller
@RequestMapping("/shopping")
public class ShoppingCartController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private ShoppingCart shoppingCart;
	
	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping(method = RequestMethod.POST)
	@Transactional
	public ModelAndView add(Integer productId, @RequestParam BookType bookType) {
		ShoppingItem item = this.createItem(productId, bookType);
		shoppingCart.add(item);
		return new ModelAndView("redirect:/products");
	}

	private ShoppingItem createItem(Integer productId,
			@RequestParam BookType bookType) {
		final Product product = productDAO.find(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);
		return item;
	}
	
	@RequestMapping(value="/checkout", method=RequestMethod.POST)
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

	
	@RequestMapping(method = RequestMethod.GET)	
	public String list(){
		return "shoppingCart/items";
	}
	
}
