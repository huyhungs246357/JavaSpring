/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.GuestEntity;
import com.mycompany.jv30_project_final.entities.UserEntity;
import com.mycompany.jv30_project_final.repositories.GuestRepository;
import com.mycompany.jv30_project_final.repositories.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhLe
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private GuestRepository guestRepository;

    public UserEntity findUserByUsernameAndPassword(String username, String password) {
        return userRepository.findByUsernameAndPassword(username, password);
    }

    public UserEntity findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

      public List<UserEntity> searchByUsername(String name) {
      return  userRepository.findByUsernameContaining(name);
    
    }
    public UserEntity saveUser(UserEntity userEntity) {

        userEntity = userRepository.save(userEntity);
        if (userEntity != null && userEntity.getId() > 0) {
            if (userEntity.getGuest() != null && userEntity.getGuest().getId() > 0) {
                GuestEntity gu = userEntity.getGuest();
                gu.setUser(userEntity);
                guestRepository.save(gu);
            }
        }

        return userEntity;
    }

    public List<UserEntity> getAccounts() {
        return (List<UserEntity>) userRepository.findAll();
    }
    public UserEntity getAccountbyId(int userId) {
          UserEntity userEntity = userRepository.findOne(userId);
        if (userEntity == null) {
            userEntity = new UserEntity();
        }
        return userEntity;
    }
    
     public UserEntity saveUser2(UserEntity userEntity) {
        userEntity = userRepository.save(userEntity);
        return userEntity;
    }
    
}
