/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.UserRoleEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author AnhLe
 */
@Repository
public interface UserRoleRepository extends CrudRepository<UserRoleEntity, Integer> {
       
}
