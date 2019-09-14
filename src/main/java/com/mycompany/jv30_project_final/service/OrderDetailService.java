package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.entities.PromotionEntity;
import com.mycompany.jv30_project_final.enums.Color;
import com.mycompany.jv30_project_final.repositories.OrderDetailRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<OrderDetailEntity> getOrderDetails() {
        return (List<OrderDetailEntity>) orderDetailRepository.findAll();
    }

    public OrderDetailEntity saveOrder(OrderDetailEntity orderDetailEntity) {
        orderDetailEntity = orderDetailRepository.save(orderDetailEntity);
        return orderDetailEntity;
    }

    public List<OrderDetailEntity> getByOrder(OrderEntity order) {
        return (List<OrderDetailEntity>) orderDetailRepository.findByOrder(order);
    }
    public OrderDetailEntity setDetailEntity(OrderEntity order, ProductEntity product) {
        OrderDetailEntity detailEntity = new OrderDetailEntity();
        detailEntity.setColor(Color.black);
        detailEntity.setDiscount(product.getDiscount());
        detailEntity.setOrder(order);
        detailEntity.setQuantity(1);
        detailEntity.setProduct(product);
        return detailEntity;
    }

}
