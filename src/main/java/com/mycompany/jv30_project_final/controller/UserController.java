/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.ImageEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.entities.UserEntity;
import com.mycompany.jv30_project_final.service.CategoryService;
import com.mycompany.jv30_project_final.service.ColorService;
import com.mycompany.jv30_project_final.service.ImageService;
import com.mycompany.jv30_project_final.service.OrderDetailService;
import com.mycompany.jv30_project_final.service.OrderService;
import com.mycompany.jv30_project_final.service.ProductService;
import com.mycompany.jv30_project_final.service.UserService;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private ColorService colorService;
    @Autowired
    private UserService userService;

    @RequestMapping("/home")
    public String home(Model model) {
        Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) principal;

            model.addAttribute("username", userEntity.getUsername());
        }
        model.addAttribute("message", "This is user home page.");
        return "/user/home";
    }


@RequestMapping("/list_product")
    public String viewProduct(Model model,
            @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("message", message);
        return "/user/list_product";
    }

//    @RequestMapping("/addproduct-form")
//    public String addProduct(Model model) {
//        model.addAttribute("product", new ProductEntity());
//        model.addAttribute("categories", categoryService.getCategories());
//        return "/user/addproduct-form";
//    }
//    
//     @RequestMapping(value = "/add-product-post",
//            method = RequestMethod.POST)
//    public String addProduct2 (Model model,
//            @ModelAttribute("product") ProductEntity productEntity) {
//        productEntity = productService.saveProduct(productEntity);
//        if (productEntity.getId() > 0) {
//            return "redirect:/list_product?message=Add product is successful"
//                    + "&status=success";
//        } else {
//            return "redirect:/list_product?message=Add product is fail"
//                    + "&status=fail";
//        }
//        
//    }
//    @RequestMapping("/addproduct-form3")
//    public String viewFormAddProduct(Model model) {
//        model.addAttribute("product", new ProductEntity());
//        model.addAttribute("categories", categoryService.getCategories());
//        model.addAttribute("action", "/add_product_result");
//        return "/user/addproduct-form";
//    }
    @RequestMapping("/addproduct-form3")
    public String addProduct(Model model) {
        model.addAttribute("product", new ProductEntity());
        model.addAttribute("categories", categoryService.getCategories());
        return "/user/addproduct-form";
    }

    @RequestMapping("delete_product/{productId}")
    public String deleteProduct(Model model,
            @PathVariable(value = "productId") int productId) {
        productService.deleteProduct(productId);
        if (productService.exitsProduct(productId)) {
            return "redirect:/user/list_product?message=Delete fail with product id=" + productId;
        } else {
            return "redirect:/user/list_product?message=Delete success with product id=" + productId;
        }
    }

    @RequestMapping(value = "/addproduct-form", method = RequestMethod.POST)
//    public @ResponseBody
    public String addBookResult(Model model, HttpServletRequest request,
            @RequestParam("file") MultipartFile[] files,
            @ModelAttribute(value = "product") ProductEntity productEntity) {

        List<ImageEntity> images = new ArrayList<>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();

                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");

                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);
                // sau khi upload file xong lấy file name ra để insert vào database
                String name = file.getOriginalFilename();
                ImageEntity imageEntity = new ImageEntity();
                imageEntity.setName(name);
                imageEntity.setProduct(productEntity);
                images.add(imageEntity);
                productEntity.setImages(images);
                productEntity = productService.saveProduct(productEntity);

            } catch (Exception e) {
            }
        }
        return "redirect:/user/list_product";
    }

    @RequestMapping("/edit_product/{productId}")
    public String editProduct(Model model,
            @PathVariable(value = "productId") int productId) {
        model.addAttribute("product", productService.findProductById(productId));
        model.addAttribute("categories", categoryService.getCategories());
        return "/user/edit_product";
    }
@RequestMapping(value = ("/edit_photo/{productId}"), method = RequestMethod.GET)
    public String editPhotoProduct(Model model,
            @PathVariable(value = "productId") int productId) {
        ProductEntity product = productService.findProductById(productId);
        model.addAttribute("images", imageService.getImagesByProduct(product));
        return "/user/edit_photo";
    }
    @RequestMapping(value = ("/update-product"), method = RequestMethod.POST)
    public String updateProductResult(Model model,
            @ModelAttribute(value = "product") ProductEntity productEntity) {
        ProductEntity productResult = productService.saveProduct(productEntity);
        if (productResult != null && productResult.getId() > 0) {
            return "redirect:/user/list_product";
        } else {
            return "redirect:/user/edit_product" + productEntity.getId();
        }
    }
    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public String viewProductSearch(Model model,
            @ModelAttribute("searchTxt") String searchTxt){
        List<ProductEntity> products = productService.searchProductByName( searchTxt);
        model.addAttribute("products", products);
        return "user/list_product";
    }
}