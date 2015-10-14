package br.com.casadocodigo.loja.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Product;

@Repository
public class ProdutoDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public void save(Product product) {
		entityManager.persist(product);
	}
}
