
package com.mycompany.jv30_project_final.repositories;




import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Integer>{
     List<OrderDetailEntity> findByOrder(OrderEntity order);
}
