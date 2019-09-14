/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.security;


import com.mycompany.jv30_project_final.entities.UserEntity;
import com.mycompany.jv30_project_final.entities.UserRoleEntity;
import com.mycompany.jv30_project_final.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 *
 * @author AnhLe
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService userService;

//    @Override
//    public Authentication authenticate(Authentication a) throws AuthenticationException {
//        String username = a.getName().trim();
//        String password = a.getCredentials().toString().trim();
//        if (username != null && !username.isEmpty()
//                && password != null && !password.isEmpty()) {
//            UserEntity userEntity = userService.findUserByUsernameAndPassword(username, password);
//            if (userEntity != null && userEntity.getId() > 0) {
//                List<GrantedAuthority> authoritys = new ArrayList<>();
//                for (UserRoleEntity userRoleEntity : userEntity.getUserRole()) {
//                    authoritys.add(
//                            new SimpleGrantedAuthority(
//                                    userRoleEntity.getRole().toString().trim()));
//                }
//                return new UsernamePasswordAuthenticationToken(
//                        userEntity, username, authoritys);
//            } else {
//                return null;
//            }
//        } else {
//            return null;
//        }
//    }
    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String username = a.getName().trim();
        String password = a.getCredentials().toString().trim();
        if (!StringUtils.isEmpty(username) 
                && !StringUtils.isEmpty(password)) {
            UserEntity userEntity = userService.findUserByUsernameAndPassword(username, password);
            if (userEntity != null && userEntity.getId() > 0) {
                List<GrantedAuthority> roles = new ArrayList<>();
                for (UserRoleEntity userRoleEntity : userEntity.getUserRole()) {
                    roles.add(
                            new SimpleGrantedAuthority(userRoleEntity.getRole().toString().trim())
                    );
                }
                return new UsernamePasswordAuthenticationToken(userEntity, userEntity.getUsername(), roles);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> type) {
        return type.equals(UsernamePasswordAuthenticationToken.class);
    }

}
