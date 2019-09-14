/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.service.CategoryService;
import com.mycompany.jv30_project_final.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author KhanLT
 */
@Controller
@RequestMapping("/management")
public class ManagementController {
     @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/")
    public String viewHome(Model model) {
        model.addAttribute("message", "Admin Home Page");
        return "admin/homeadmin";
    }
@RequestMapping("/management/product-form")
    public String viewFormAddProduct(Model model) {
        model.addAttribute("productEntity", new ProductEntity());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("action", "add-product");
        return "/admin/product-form";
    }
    
     @RequestMapping(value = "/add-product",
            method = RequestMethod.POST)
    public String addProduct(Model model,
            @ModelAttribute("productEntity") ProductEntity productEntity) {
        productEntity = productService.saveProduct(productEntity);
        if (productEntity.getId() > 0) {
            return "redirect:/home?message=Add product is successful"
                    + "&status=success";
        } else {
            return "redirect:/home?message=Add product is fail"
                    + "&status=fail";
        }
    }

    @RequestMapping("/update-form/{productEntityId}")
    public String viewFormUpdate(Model model,
            @PathVariable("productEntityId") int productEntityId) {
        model.addAttribute("productEntity", productService.findProductById(productEntityId));
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("action", "update-product");
        return "admin/product-form";
    }

    @RequestMapping(value = "/update-product",
            method = RequestMethod.POST)
    public String updateProduct(Model model,
            @ModelAttribute("productEntity") ProductEntity productEntity) {
        ProductEntity productEntitys = productService.saveProduct(productEntity);
        if (productEntitys.getId() > 0) {
            return "redirect:/home?message=update book is successful"
                    + "&status=success";
        } else {
            return "redirect:/home?message=update book is fail"
                    + "&status=fail";
        }
    }

}
