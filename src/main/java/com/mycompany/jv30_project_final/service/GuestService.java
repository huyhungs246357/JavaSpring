
package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.GuestEntity;
import com.mycompany.jv30_project_final.entities.UserEntity;
import com.mycompany.jv30_project_final.repositories.GuestRepository;
import com.mycompany.jv30_project_final.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestService {
  @Autowired
    private GuestRepository guestRepository;
    @Autowired
   private UserRepository userRepository;
  
     public GuestEntity saveGuest(GuestEntity guestEntity) {
        guestEntity = guestRepository.save(guestEntity);
        if (guestEntity != null && guestEntity.getId() > 0) {
            if (guestEntity.getUser()!= null && guestEntity.getUser().getId() > 0) {
                UserEntity bde = guestEntity.getUser();
                bde.setGuest(guestEntity);
                userRepository.save(bde);
            }
        }
        
        return guestEntity;
    }
     
      public GuestEntity findGuestById(int guestId) {
        GuestEntity guestEntity = guestRepository.findOne(guestId);
        if (guestEntity == null) {
            guestEntity = new GuestEntity();
        }
        return guestEntity;
    }
}
