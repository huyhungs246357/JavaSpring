/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhLe
 */
@Controller
public class HomeController {

   @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/home2"})
    public String homePage(Model model) {
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model,
            @RequestParam(value = "error", required = false) String error) {
        if (error != null && !error.isEmpty()) {
            model.addAttribute("message", "username or password incorrect.");
        }
        return "login";
    }

}
