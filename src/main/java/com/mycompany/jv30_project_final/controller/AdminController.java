/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.PromotionEntity;
import com.mycompany.jv30_project_final.entities.UserEntity;
import com.mycompany.jv30_project_final.enums.OrderStatus;
import com.mycompany.jv30_project_final.service.OrderDetailService;
import com.mycompany.jv30_project_final.service.OrderService;
import com.mycompany.jv30_project_final.service.PromotionService;
import com.mycompany.jv30_project_final.service.UserRoleService;
import com.mycompany.jv30_project_final.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhLe
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private OrderService orderService;
     @Autowired
    private OrderDetailService orderDetailService;
   
    
    @RequestMapping("/home")
    public String home(Model model) {
      
        model.addAttribute("message", "This is admin home page.");
        return "admin/homeadmin";
        }
   
    @RequestMapping("/list_account")
    public String viewAccount(Model model,
            @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("account", userService.getAccounts());
        model.addAttribute("message", message);
        return "/admin/list_account";
    }
    @RequestMapping("/listPromotion")
    public String viewPromotion(Model model,
            @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("promotion", promotionService.getAllPromotions());
        model.addAttribute("message", message);
        return "/admin/listPromotion";
    }

      @RequestMapping("/edit_account/{userId}")
    public String editAccount(Model model,
            @PathVariable(value = "userId") int userId) {
        model.addAttribute("user", userService.getAccountbyId(userId));
        model.addAttribute("roles", userRoleService.getRoles());
        return "/admin/edit_account";
    }
   

    @InitBinder("user")
    public void dataBinding(WebDataBinder binder) {
        binder.registerCustomEditor(List.class, "userRole", new CustomCollectionEditor(List.class) {
            @Override
            protected Object convertElement(Object element) {
                if (element != null && element instanceof String) {
                    return userRoleService.findRoleById(Integer.parseInt((String) element));
                }
                return null;
            }
        });
    }
     @RequestMapping(value = ("/update_account_result"), method = RequestMethod.POST)
    public String updateAccountResult(Model model,
            @ModelAttribute(value = "user") UserEntity userEntity) {
        UserEntity userResult = userService.saveUser(userEntity);
        if (userResult != null && userResult.getId() > 0) {
            return "redirect:/admin/list_account";
        } else {
            return "redirect:/admin/edit_account" + userEntity.getId();
        }
    }
    @RequestMapping("/addaccount")
    public String addProduct(Model model) {
//        model.addAttribute("account", new UserEntity());
       model.addAttribute("roles", userRoleService.getRoles());
        return "/admin/add_account";
    }
      @RequestMapping("/add-form-promotion")
    public String addPromotion(Model model) {
        model.addAttribute("promotion", new PromotionEntity());
        
        return "/admin/add-form-promotion";
    }
    
     @RequestMapping(value = "/add-form-promotion",
            method = RequestMethod.POST)
    public String addPromotion2 (Model model,
            @ModelAttribute("promotion") PromotionEntity promotionEntity) {
        promotionEntity = promotionService.savePromotion(promotionEntity);
        if (promotionEntity.getId() > 0) {
            return "redirect:/admin/listPromotion?message=Add product is successful"
                    + "&status=success";
        } else {
            return "redirect:/admin/listPromotion?message=Add product is fail"
                    + "&status=fail";
        }
        
    }
 @RequestMapping("/edit_promotion/{promotionId}")
    public String editPromotion(Model model,
            @PathVariable(value = "promotionId") int promotionId) {
        model.addAttribute("promotion", promotionService.findPromotionById(promotionId));
        return "/admin/edit_promotion";
    }
     @RequestMapping(value = ("/update-promotion"), method = RequestMethod.POST)
    public String updateProductResult(Model model,
            @ModelAttribute(value = "promotion") PromotionEntity promotionEntity) {
        PromotionEntity promotionResult = promotionService.savePromotion(promotionEntity);
        if (promotionResult != null && promotionResult.getId() > 0) {
            return "redirect:/admin/listPromotion";
        } else {
            return "redirect:/admin/edit_promotion" + promotionEntity.getId();
        }
    }
    @RequestMapping("list_order")
    public String viewOrder(Model model,
            @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("orders", orderService.getOrders());
        model.addAttribute("status", OrderStatus.values());
//        model.addAttribute("message", message);
        return "/admin/list_order";
    }
    
@RequestMapping(value = "/search1",method = RequestMethod.POST)
    public String viewPromotionSearch(Model model,
            @ModelAttribute("searchTxt1") String searchTxt1){
        List<PromotionEntity> promotions = promotionService.searchPromotion(searchTxt1);
        model.addAttribute("promotions", promotions);
        return "admin/listPromotion";
    }  
    
    
     @RequestMapping(value = ("/view_orderdetail/{orderId}"), method = RequestMethod.GET)
    public String viewOrderDetail(Model model,
            @PathVariable(value = "orderId") int orderId) {
        OrderEntity order = orderService.findOrderById(orderId);
        model.addAttribute("orderdetail", orderDetailService.getByOrder(order));
        return "/admin/view_orderdetail";
    }
    @RequestMapping(value = "/change_status/{orderId}", method = RequestMethod.POST)
    public String updateStatusResult(Model model, @PathVariable(value = "orderId") int orderId,
            @ModelAttribute(value = "status") OrderStatus status) {
        OrderEntity order = orderService.findOrderById(orderId);
        order.setStatus(status);
        orderService.saveOrder(order);
        return "redirect:/admin/list_order";
    }
     @RequestMapping(value = "/search_account", method = RequestMethod.POST)
    public String searchOrder(Model model,
            @ModelAttribute(value = "searchText") String searchText) {
        model.addAttribute("account", userService.searchByUsername(searchText));
//        model.addAttribute("status", OrderStatus.values());
        return "admin/list_account";
    }
    @RequestMapping(value = "/search_order",method = RequestMethod.POST)
    public String viewOrderByDate(Model model,
            @ModelAttribute("startDate") String start,
            @ModelAttribute("endDate") String end) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = format.parse(start);
        Date endDate = format.parse(end);
        model.addAttribute("orders", orderService.getOrderByDate(startDate, endDate));
        
        model.addAttribute("status", OrderStatus.values());
//        model.addAttribute("message", message);
        return "/admin/list_order";
    }
 
}