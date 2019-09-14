/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.repositories.ProductRepository;
import com.mycompany.jv30_project_final.service.CategoryService;
import com.mycompany.jv30_project_final.service.ColorService;
import com.mycompany.jv30_project_final.service.ImageService;
import com.mycompany.jv30_project_final.service.OrderDetailService;
import com.mycompany.jv30_project_final.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
public class ProductController {
    
 
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private ColorService colorService;

    @RequestMapping(value = {"/", "/home"})
    public String viewProduct(Model model,
            @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("abc", productService.getProductsBySale());
        model.addAttribute("products2", productService.getProductsByLuxury());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("message", message);
        return "index";
    }

    //Product Detail
    @RequestMapping("/detail-product/{productId}")
    public String editProduct(Model model,
            @PathVariable(value = "productId") int productId) {
        //view productdetail
        model.addAttribute("product", productService.findProductById(productId));
        model.addAttribute("categories", categoryService.getCategories());
        
        //view image
        ProductEntity product = productService.findProductById(productId);
        model.addAttribute("images", imageService.getImagesByProduct(product));
    
        return "product_detail";
    }

//    Search All
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchProduct(Model model, HttpServletRequest request,
            @ModelAttribute(value = "searchText") String searchText) {
        model.addAttribute("products", productService.searchCriteria(searchText));
        model.addAttribute("categories", categoryService.getCategories());

        return "show_search";
    }

//    Search By category
    @RequestMapping("/search_product/{categoryId}")
    public String searchCategory(Model model,
            @PathVariable(value = "categoryId") int categoryId) {
//        model.addAttribute("category", categoryService.findCategoryById(categoryId));
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("products", productService.searchCategory(categoryId));
        return "show_search";
    }

//   @RequestMapping(value = "/search_pr", method = RequestMethod.POST)
//    public String searchPr(Model model,
//            @ModelAttribute(value = "searchText") String searchText) {
//        model.addAttribute("product", productService.searchByName(searchText));
//   
//        return "user/list_product";
//    }
}
