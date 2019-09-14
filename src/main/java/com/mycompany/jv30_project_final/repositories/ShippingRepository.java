
package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.ShippingInfoEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ShippingRepository extends CrudRepository<ShippingInfoEntity, Integer>{
    
}
