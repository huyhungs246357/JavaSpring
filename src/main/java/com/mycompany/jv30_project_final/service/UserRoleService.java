/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.UserRoleEntity;
import com.mycompany.jv30_project_final.repositories.UserRoleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhLe
 */
@Service
public class UserRoleService {

    @Autowired
    private UserRoleRepository userRoleRepository;


 public UserRoleEntity findRoleById(int roleId) {
        UserRoleEntity userRoleEntity = userRoleRepository.findOne(roleId);
        if (userRoleEntity == null) {
            userRoleEntity = new UserRoleEntity();
        }
        return userRoleEntity;
    }
 
   public List<UserRoleEntity> getRoles() {
        return (List<UserRoleEntity>) userRoleRepository.findAll();
    }
}
