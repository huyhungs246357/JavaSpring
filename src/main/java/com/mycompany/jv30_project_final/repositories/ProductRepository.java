package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {

//   List<ProductEntity> findByName(String proName);
    @Query(value = "Select * From product p "
            + "inner join category c on p.category_id = c.id "
            + "where p.product_name Like ?1 or c.category_name Like ?2 "
            + "order by p.product_id Asc", nativeQuery = true)
    public List<ProductEntity>
            findByNameContaining(String name1, String name2);
    
    
   
    @EntityGraph(value = "product.images")
    List<ProductEntity> findByProNameContainingOrCategoryNameContaining(String proName, String name);

    @EntityGraph(value = "product.images")
    @Query("select p from ProductEntity p where p.category.id like ?1")
    List<ProductEntity> findProductByCategory(int categoryid);

    @EntityGraph(value = "product.images")
    @Query("select p from ProductEntity p where p.available=1 and  p.unitPrice > 10000000 ORDER BY p.unitPrice DESC")         
    //@Query("select p from ProductEntity p where p.available=1 and  p.discount > 100000 ORDER BY p.discount DESC")
  //  @Query("select p from ProductEntity p where p.available=1 and  p.unitPrice > 10000000 ORDER BY p.unitPrice DESC")
        List<ProductEntity> findProductBySale();

    @EntityGraph(value = "product.images")
   @Query("select p from ProductEntity p where p.available=1 and  p.cretedAt =  CURDATE() ORDER BY p.unitPrice DESC")
    List<ProductEntity> findProductByLuxury();

    @EntityGraph(value = "product.images")
    ProductEntity findOne(int id);


}
