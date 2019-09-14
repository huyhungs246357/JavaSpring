/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.PromotionEntity;
import com.mycompany.jv30_project_final.repositories.ColorRepository;
import com.mycompany.jv30_project_final.repositories.PromotionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;
       
     public List<PromotionEntity> getAllPromotions() {
        return (List<PromotionEntity>) promotionRepository.findAll();
    }
         public PromotionEntity findPromotionById(int promotionId) {
        PromotionEntity promotionEntity = promotionRepository.findOne(promotionId);
        if (promotionEntity == null) {
            promotionEntity = new PromotionEntity();
        }
        return promotionEntity;
    }
   public PromotionEntity savePromotion(PromotionEntity promotionEntity) {
        promotionEntity = promotionRepository.save(promotionEntity);
        return promotionEntity;
    }
   public List<PromotionEntity> searchPromotion(String searchTxt1) {
        return promotionRepository.findPromotionByCategory("%" + searchTxt1 + "%");

    }
}
