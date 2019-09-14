package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.GuestEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer> {

    List<OrderEntity> findByGuest(GuestEntity guestEntity);
    List<OrderEntity> findByShippingFullNameContaining(String fullName);
   
    //-----------------------------------------------------
@Query(value = "select * from orders "
            + "o where o.order_date >= ?1 and o.order_date <= ?2", nativeQuery = true)
    List<OrderEntity> findOrderByDate(Date startDate, Date endDate);
}
