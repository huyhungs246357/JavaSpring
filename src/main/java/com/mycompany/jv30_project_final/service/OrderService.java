
package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.GuestEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.ShippingInfoEntity;
import com.mycompany.jv30_project_final.repositories.OrderRepository;
import com.mycompany.jv30_project_final.repositories.ShippingRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
     @Autowired
    private OrderRepository orderRepository;
      @Autowired
    private ShippingRepository shippingRepository;
     
    
    public List<OrderEntity> getOrders() {
        return (List<OrderEntity>) orderRepository.findAll();
    }
    public OrderEntity saveOrder(OrderEntity orderEntity) {
        orderEntity = orderRepository.save(orderEntity);
        if (orderEntity != null && orderEntity.getId() > 0) {
            if (orderEntity.getShipping()!= null && orderEntity.getShipping().getId() > 0) {
                ShippingInfoEntity sh = orderEntity.getShipping();
                sh.setOrder(orderEntity);
                shippingRepository.save(sh);
            }
        }
        return orderEntity;
    }    
     public OrderEntity findOrderById(int orderId) {
        OrderEntity orderEntity = orderRepository.findOne(orderId);
        if (orderEntity == null) {
            orderEntity = new OrderEntity();
        }
        return orderEntity;
    }
      public List<OrderEntity> searchByGuestName(String name) {
      return  orderRepository.findByShippingFullNameContaining(name);
    
    }
       public List<OrderEntity> getOrderbyGuest(GuestEntity guestEntity) {
        return (List<OrderEntity>) orderRepository.findByGuest(guestEntity);
    }
public List<OrderEntity> getOrderByDate(Date startDate, Date endDate){
           List<OrderEntity> orders = orderRepository.findOrderByDate(startDate, endDate);
           return orders;
       }
}
