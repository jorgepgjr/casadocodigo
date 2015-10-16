package br.com.casadocodigo.loja.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.casadocodigo.loja.dao.ProductDAO;
import br.com.casadocodigo.loja.models.Product;

@Component
public class ProductValidator implements Validator {

	@Autowired
	private ProductDAO productDAO; 
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Product product = (Product) target;
		if(productDAO.existTitle(product)){
			errors.rejectValue("title", "title.unique");
		}
	}
}
