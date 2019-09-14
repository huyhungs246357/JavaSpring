package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.ImageEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.repositories.ImageRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public List<ImageEntity> getImagesByProduct(ProductEntity product) {
        return (List<ImageEntity>) imageRepository.findByProduct(product);
    }
}
