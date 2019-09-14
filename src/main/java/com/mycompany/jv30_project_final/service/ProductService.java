package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.repositories.ProductRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<ProductEntity> getProducts() {
        return (List<ProductEntity>) productRepository.findAll();
    }

    public ProductEntity saveProduct(ProductEntity productEntity) {
        productEntity = productRepository.save(productEntity);
        return productEntity;
    }

    public ProductEntity findProductById(int productId) {
        ProductEntity productEntity = productRepository.findOne(productId);
        if (productEntity == null) {
            productEntity = new ProductEntity();
        }
        return productEntity;
    }

    public void deleteProduct(int productId) {
        productRepository.delete(productId);
    }

    public boolean exitsProduct(int productId) {
        return productRepository.exists(productId);
    }

    public List<ProductEntity> searchCriteria(String searchText) {
        List<ProductEntity> productSearch = (List<ProductEntity>) productRepository.findByProNameContainingOrCategoryNameContaining(searchText, searchText);
        if (productSearch != null && productSearch.size() > 0) {
            return deleteProductExist(productSearch);
        }
        return null;
    }

    public List<ProductEntity> searchCategory(int categoryid) {
        List<ProductEntity> productSearch = (List<ProductEntity>) productRepository.findProductByCategory(categoryid);
        if (productSearch != null && productSearch.size() > 0) {
            return deleteProductExist(productSearch);
        }
        return null;

    }

    public List<ProductEntity> getProductsBySale() {
        List<ProductEntity> productsBySale = (List<ProductEntity>) productRepository.findProductBySale();
        if (productsBySale != null && productsBySale.size() > 0) {
            return deleteProductExist(productsBySale);
        }
        return null;
    }

    public List<ProductEntity> getProductsByLuxury() {
        List<ProductEntity> productByLuxury = (List<ProductEntity>) productRepository.findProductByLuxury();
        if (productByLuxury != null && productByLuxury.size() > 0) {
            return deleteProductExist(productByLuxury);
        }
        return null;
    }

    private List<ProductEntity> deleteProductExist(List<ProductEntity> producs) {
        List<ProductEntity> productReturn = new ArrayList<>();
        for (ProductEntity product : producs) {
            if (productReturn.size() > 0) {
                boolean isExist = true;
                for (ProductEntity productR : productReturn) {
                    if (product.getId() != productR.getId()) {
                        isExist = false;
                    } else {
                        isExist = true;
                        break;
                    }
                }
                if (!isExist) {
                    productReturn.add(product);
                }
            } else {
                productReturn.add(product);
            }
        }
        return productReturn;
    }

//    public List<ProductEntity> searchByName(String proName) {
//        return productRepository.findByName(proName);
//    }
    public List<ProductEntity> searchProductByName(String searchTxt){
        List<ProductEntity> products = productRepository.findByNameContaining("%" + searchTxt + "%",
                "%" + searchTxt + "%");
        return products;
    }
}