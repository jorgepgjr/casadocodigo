package br.com.casadocodigo.loja.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Product;

/**
 * {@link Product}  DAO
 * @author Jorge Peres
 *
 */
@Repository
public class ProductDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public void save(Product product) {
		entityManager.persist(product);
	}
}
