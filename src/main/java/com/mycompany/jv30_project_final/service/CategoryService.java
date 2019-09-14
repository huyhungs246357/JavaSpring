
package com.mycompany.jv30_project_final.service;



import com.mycompany.jv30_project_final.entities.CategoryEntity;
import com.mycompany.jv30_project_final.repositories.CategoryRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
    
    @Autowired
    private CategoryRepository categoryRepository;
    
    public List<CategoryEntity> getCategories(){
        List<CategoryEntity> categories =(List<CategoryEntity>) categoryRepository.findAll();
                if(categories==null){
                    categories = new ArrayList<>();
                }
                return categories;
    }
    
     public  CategoryEntity findCategoryById(int categoryId){
        CategoryEntity categoryEntity = categoryRepository.findOne(categoryId);
        if (categoryEntity==null){
            categoryEntity = new CategoryEntity();
        }
        return categoryEntity;
    }
     
   
}
