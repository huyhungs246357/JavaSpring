
package com.mycompany.jv30_project_final.repositories;



import com.mycompany.jv30_project_final.entities.CategoryEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends CrudRepository<CategoryEntity, Integer>{
      
}
