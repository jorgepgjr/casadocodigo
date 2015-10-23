package br.com.casadocodigo.loja.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.BookType;
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
	
	public boolean existTitle(Product product) {
		final Query query = this.entityManager.createQuery("select p from Product p where p.title = :title");
				query.setParameter("title", product.getTitle());
				return !query.getResultList().isEmpty();
	}
	
	public Product find(Integer id) {
		Query query = this.entityManager.createQuery("select distinct(p) from Product p join fetch p.prices where p.id =:id");
		query.setParameter("id", id);
		return (Product) query.getSingleResult();
	}
	
	public BigDecimal sumPricesPerType(BookType bookType){
		TypedQuery<BigDecimal> query = entityManager.createQuery(
				"select sum(price.value) from Product p join p.prices price where price.bookType = :bookType",BigDecimal.class);
		query.setParameter("bookType", bookType);
		return query.getSingleResult();
	}

}
