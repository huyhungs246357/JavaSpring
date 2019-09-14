
package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.ImageEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer> {
     List<ImageEntity> findByProduct(ProductEntity product);
}
