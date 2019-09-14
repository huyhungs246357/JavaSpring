/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;

import com.mycompany.jv30_project_final.entities.PromotionEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author PC
 */
public interface PromotionRepository extends CrudRepository<PromotionEntity, Integer> {
    @Query("Select p From PromotionEntity p "
            + "Where p.name Like ?1 "
            + "Order By p.id Asc")
    public List<PromotionEntity> findPromotionByCategory(String name);
}
