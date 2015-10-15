package br.com.casadocodigo.loja.dao;

import java.util.List;

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
	
	public List<Product> list() {
		return this.entityManager.createQuery("select distinct(p) from Product p join fetch p.prices").getResultList();
	}
}
