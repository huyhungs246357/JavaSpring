/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.ShippingInfoEntity;
import com.mycompany.jv30_project_final.repositories.ShippingRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class ShippingService {
        @Autowired
    private ShippingRepository shippingRepository;
       
     public List<ShippingInfoEntity> getAllShipping() {
        return (List<ShippingInfoEntity>) shippingRepository.findAll();
    
}
}
