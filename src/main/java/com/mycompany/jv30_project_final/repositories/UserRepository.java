/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.UserEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author AnhLe
 */
@Repository
public interface UserRepository extends CrudRepository<UserEntity, Integer> {
         UserEntity findByUsernameLikeAndPasswordLike(
            String username, String password);
         
    @Query("Select acc From UserEntity acc "
            + "Join fetch acc.userRole "
            + "Where acc.username Like ?1 and "
            + "acc.password Like ?2")    
    UserEntity findByUsernameAndPassword(String username, String password);
    
       UserEntity findByUsername(String username);
       
        List<UserEntity> findByUsernameContaining(String username);
       
}
