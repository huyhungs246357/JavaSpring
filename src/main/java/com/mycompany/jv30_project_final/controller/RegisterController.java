/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;


import com.mycompany.jv30_project_final.entities.GuestEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.UserEntity;
import com.mycompany.jv30_project_final.service.GuestService;
import com.mycompany.jv30_project_final.service.OrderDetailService;
import com.mycompany.jv30_project_final.service.OrderService;
import com.mycompany.jv30_project_final.service.UserRoleService;
import com.mycompany.jv30_project_final.service.UserService;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author AnhLe
 */
@Controller
public class RegisterController {

    @Autowired
    private UserService userService;
    @Autowired
    private GuestService guestService;
    @Autowired
    JavaMailSender mailSender;
    @Autowired
    private OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new UserEntity());
//        model.addAttribute("accountRole",  )

        return "register";
    }

    @RequestMapping(value = "/register_success", method = RequestMethod.POST)
    public String successResult(Model model, HttpServletRequest request,
            @ModelAttribute(value = "user") UserEntity userEntity) {
        userService.saveUser(userEntity);
        model.addAttribute("action", "user-result");

        try {
            MimeMessage massage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(massage, true);
            helper.setFrom(" <huyhungs246357@gmail.com>");
            helper.setTo(userEntity.getGuest().getEmail());
            helper.setReplyTo(" Shop <huyhungs246357@gmail.com>");
            helper.setSubject("Welcome: " + userEntity.getGuest().getFullName());
            String url = request.getRequestURL().toString().replace("register_success", "home");

            String text = "<img src='https://lh3.googleusercontent.com/97vY23AibUnPa7TQX1FyLKan4rMSn4DwCPHEQHUrwGYPNCYBGboCFHVqVP88PPGEbfGrwASIXc66-hnZG0IfsW1sQ0bKGcLCI5_j0UT3UdgvDM4Sa1dR72xK5Odf3TezgtaYqDy6Q8cErZxLRXdn_boWIxgxDZhWYmUutdxzCoT-A6XL5rBGJhdh-YiMZKbAivLJBmOxv4FANImQIh0rfUuPNwtHzF8j4UbJcVlsFOQ7CplLiLxNLW7sNzPmAlpeDbJrVbp1ASNV0jaOfS8fjSTdgluPPx1fVg8-JKeDt5axdayccpV9MMStqu46qkEGu_ROQDEwo9-2yhaJO-shH0IuXLoZ7esI5_oHX2o2M3yk1QppQer-imyb1ZXjCyfKZoEzCHlUeaFotCvKlNuAHirDFvjT8ybQLRPmkxTA2El4I0TF2uR6d7CHLwBtnBtAM9o4mLektFzC2sj6bpG2C8Vtg_3JdwknJrQ_Mq1MPqUHuBC-JdCULO0_QQ8B8eRZBGBRmxAlp8BwisOqv_tZ_TWJF-BUmJhE09A2AfywnGhjh4SBejjqxpl0WNRnBAcmSSMlxOnBPgKhbR1V3vsXyKNE2W2o9iSfIzDmEf-nWbUoGU8XkBgnASn5Int5gT7Hsg77FpFh3oJ3A1Nooczkes3zGFifACs=w500-h131-no'>"
                    +"<h3>Welcome : " + userEntity.getGuest().getFullName() + " shopping at HK-Shop</h3>"
                    + "<br> Thank you for your Registration"
                    + "<br> username:" + userEntity.getUsername()
                    + "<br> password:" + userEntity.getPassword()
                    + "<br> Please click here to continue Shopping " + url;

            helper.setText(text, true);
            massage.setContent(text,"text/html");
            mailSender.send(massage);
        } catch (Exception ex) {
            model.addAttribute("message", "");
        }
        return "login";
    }

    @RequestMapping(value = ("/viewUser"), method = RequestMethod.GET)
    public String viewUser(Model model) {
        Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) principal;
            String userName = userEntity.getUsername();
            UserEntity userEntity1 = userService.findUserByUsername(userName);
            GuestEntity guestEntity = userEntity1.getGuest();
            model.addAttribute("guests", guestEntity);
            model.addAttribute("orderh", orderService.getOrderbyGuest(guestEntity));
        }
        return "viewUser";
    }

    @RequestMapping(value = ("/edit_info"), method = RequestMethod.GET)
    public String editUser(Model model) {
        Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) principal;
            String userName = userEntity.getUsername();
            UserEntity userEntity1 = userService.findUserByUsername(userName);
            GuestEntity guestEntity = userEntity1.getGuest();
            model.addAttribute("guests", guestEntity);

        }
        return "edit_info";
    }

    @RequestMapping(value = ("/update_info_result"), method = RequestMethod.POST)
    public String updateInfoResult(Model model,
            @ModelAttribute(value = "guests") GuestEntity guestEntity) {
        guestService.saveGuest(guestEntity);

        return "redirect:/viewUser";

    }

    @RequestMapping(value = ("/change_password"), method = RequestMethod.GET)
    public String changePass(Model model) {
        Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) principal;

            model.addAttribute("roles", userRoleService.getRoles());
            model.addAttribute("user", userEntity);

        }
        return "change-password";
    }

    @RequestMapping(value = ("/update_password_result"), method = RequestMethod.POST)
    public String updateAccountResult(Model model, @RequestParam(value = "password1", required = false) String password1,
            @ModelAttribute(value = "user") UserEntity userEntity,RedirectAttributes redirectAttributes) {
        Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity oldPass = (UserEntity) principal;
            if (userEntity.getPassword().equals(oldPass.getPassword())) {
                userEntity.setPassword(password1);
                userService.saveUser(userEntity);
                model.addAttribute("message", "Change password success. Please login again with new password");
                return "login";
            } else {
                	redirectAttributes.addFlashAttribute("message","Current password incorrect");
//                model.addAttribute("error", "Current password incorect");
                 return "redirect:/change_password";
            }
        }
        return "login";
    }

    @RequestMapping(value = ("/view_orderdetail/{orderId}"), method = RequestMethod.GET)
    public String viewOrderDetail(Model model,
            @PathVariable(value = "orderId") int orderId) {
        OrderEntity order = orderService.findOrderById(orderId);
        model.addAttribute("orderdetail", orderDetailService.getByOrder(order));
        return "/view_orderdetail";
    }

}
