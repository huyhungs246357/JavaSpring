
package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.ColorEntity;
import com.mycompany.jv30_project_final.repositories.ColorRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ColorService {
    @Autowired
    private ColorRepository colorRepository;
       
     public List<ColorEntity> getAllColors() {
        return (List<ColorEntity>) colorRepository.findAll();
    }

}
