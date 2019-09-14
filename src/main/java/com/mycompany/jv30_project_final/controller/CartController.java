package com.mycompany.jv30_project_final.controller;


import com.mycompany.jv30_project_final.entities.GuestEntity;
import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.entities.PromotionEntity;
import com.mycompany.jv30_project_final.entities.ShippingInfoEntity;
import com.mycompany.jv30_project_final.entities.UserEntity;
import com.mycompany.jv30_project_final.enums.Color;
import com.mycompany.jv30_project_final.enums.OrderStatus;
import com.mycompany.jv30_project_final.service.CategoryService;
import com.mycompany.jv30_project_final.service.GuestService;
import com.mycompany.jv30_project_final.service.OrderDetailService;
import com.mycompany.jv30_project_final.service.OrderService;
import com.mycompany.jv30_project_final.service.ProductService;
import com.mycompany.jv30_project_final.service.PromotionService;
import com.mycompany.jv30_project_final.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

@Controller
@RequestMapping(value = "cart")
public class CartController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private GuestService guestService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private UserService userService;
    @Autowired
    private PromotionService promotionService;
      @Autowired
    private JavaMailSender mailSender;
    
       

  

     @RequestMapping("view-cart")
    public String viewCart(Model model, HttpSession session) {
        model.addAttribute("categories", categoryService.getCategories());
        OrderEntity order = (OrderEntity) session.getAttribute("order");
//         model.addAttribute("color", Color.values());
        if (order != null) {
            model.addAttribute("order", order);
            model.addAttribute("color", Color.values());
        }
        return "shopping-cart";
    }

    @RequestMapping(value = "add/{productId}", method = RequestMethod.GET)
    public String addtoCart(Model model, HttpSession session, @PathVariable("productId") int productId)
          {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        ProductEntity product = productService.findProductById(productId);
        if (product != null && product.getId() > 0) {
            List<OrderDetailEntity> detailEntitys = new ArrayList<>();
            if (order != null) {
                if (order.getOrderDetails() != null && order.getOrderDetails().size() > 0) {
                    boolean isExist = false;
                    double totalPrice = order.getTotalPrice();
                    for (OrderDetailEntity orderDetail : order.getOrderDetails()) {
                        if (orderDetail.getProduct().getId() == product.getId()
                          //  orderDetail.getProduct().getId() == product.getId()   
                           ) 
                 
                        {
                            //orderDetail.setQuantity(product);
                            orderDetail.setProduct(product);
                            orderDetail.setQuantity(orderDetail.getQuantity() + 1);
                           //orderDetail.setQuantity(1);
                         //   orderDetail.setQuantity(quantity));
                            //orderDetail.setQuantity(orderDetail.getQuantity() + orderDetail.getQuantity())       ;
                            order.setTotalPrice(totalPrice + product.getUnitPrice() - product.getDiscount());
                            isExist = true;
                            break;
                        } else {
                            isExist = false;
                        }
                    }
                    
                    if (!isExist) {
                        detailEntitys.add(orderDetailService.setDetailEntity(order, product));
                        order.getOrderDetails().add(orderDetailService.setDetailEntity(order, product));
                        order.setTotalPrice(totalPrice + product.getUnitPrice() - product.getDiscount());

                    }
                } else {
                    order.setTotalPrice(product.getUnitPrice() - product.getDiscount());
                    detailEntitys.add(orderDetailService.setDetailEntity(order, product));
                    order.setOrderDetails(detailEntitys);
                }
            } else {
                order = new OrderEntity();
                order.setOrderDate(new Date());
                order.setStatus(OrderStatus.NEW);
                order.setTotalPrice(product.getUnitPrice() - product.getDiscount());

                detailEntitys.add(orderDetailService.setDetailEntity(order, product));
                order.setOrderDetails(detailEntitys);
               

            }
        }
        session.setAttribute("order", order);
        return "redirect:/cart/view-cart";
    }

    @RequestMapping(value = "update-quantity/{productId}", method = RequestMethod.POST)
    public String updateQuantity(Model model, HttpServletRequest request,
            HttpSession session, @PathVariable("productId") int productId,
            @ModelAttribute("quantity") int quantity) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        ProductEntity product = productService.findProductById(productId);
        if (order != null) {
            double totalPrice = order.getTotalPrice();
            int oldQuantity = 0;
            for (OrderDetailEntity orderDetail : order.getOrderDetails()) {
                if (orderDetail.getProduct().getId() == productId) {
                    oldQuantity = orderDetail.getQuantity();
                    orderDetail.setQuantity(quantity);
                    order.setTotalPrice(totalPrice + (orderDetail.getQuantity() * product.getUnitPrice() - orderDetail.getQuantity() * product.getDiscount())
                            - (oldQuantity * product.getUnitPrice() - oldQuantity * product.getDiscount()));
                    break;
                }
            }
            session.setAttribute("order", order);
            model.addAttribute("order", order);
        }
        return "redirect:/cart/view-cart";
    }

    @RequestMapping(value = "update-color/{productId}", method = RequestMethod.POST)
    public String updateColor(Model model, HttpServletRequest request,
            HttpSession session, @PathVariable("productId") int productId,
            @ModelAttribute("color") Color color) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        ProductEntity product = productService.findProductById(productId);
        if (order != null) {
            for (OrderDetailEntity orderDetail : order.getOrderDetails()) {
                if (orderDetail.getProduct().getId() == productId) {
                    orderDetail.setColor(color);
                    break;
                }
            }
            session.setAttribute("order", order);
            model.addAttribute("order", order);
        }
        return "redirect:/cart/view-cart";
    }

    @RequestMapping(value = "remove/{productId}", method = RequestMethod.GET)
    public String viewRemove(Model model, HttpSession session, @PathVariable("productId") int productId) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        ProductEntity product = productService.findProductById(productId);
        if (order != null) {
            double totalPrice = order.getTotalPrice();
            int oldQuantity = 0;
            for (OrderDetailEntity orderDetail : order.getOrderDetails()) {
                if (orderDetail.getProduct().getId() == productId) {
                    order.getOrderDetails().remove(orderDetail);
                    order.setTotalPrice(totalPrice - (product.getUnitPrice() * orderDetail.getQuantity() - product.getDiscount() * orderDetail.getQuantity()));
                    break;
                }
            }
            session.setAttribute("order", order);
            model.addAttribute("order", order);
        }
        return "redirect:/cart/view-cart";
    }
  @RequestMapping("/checkout")
    public String checkoutForm(Model model, HttpSession session) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");

        Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) principal;
            String userName = userEntity.getUsername();
            UserEntity userEntity1 = userService.findUserByUsername(userName);
            GuestEntity guestEntity = userEntity1.getGuest();
            model.addAttribute("guestEntity", guestEntity);

        }
        session.setAttribute("order", order);
        model.addAttribute("order", order);
        model.addAttribute("shipping", new ShippingInfoEntity());
        model.addAttribute("categories", categoryService.getCategories());
        return "checkout";
    }
    
@RequestMapping(value = "/success", method = RequestMethod.POST)
    public String viewCheckout(Model model, HttpSession session, HttpServletRequest request,
            @ModelAttribute(value = "shipping") ShippingInfoEntity ShippingInfoEntity) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");

        Object principal
                = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) principal;
            String userName = userEntity.getUsername();
            UserEntity userEntity1 = userService.findUserByUsername(userName);
            GuestEntity guestEntity = userEntity1.getGuest();
            order.setGuest(guestEntity);

        }
        order.setShipping(ShippingInfoEntity);
        orderService.saveOrder(order);

        session.removeAttribute("order");
        model.addAttribute("order", order);
        model.addAttribute("categories", categoryService.getCategories());

        try {
            MimeMessage massage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(massage, true);
            helper.setFrom(" <huyhungs246357@gmail.com>");
            helper.setTo(ShippingInfoEntity.getEmail());
            helper.setReplyTo(" Shop <huyhungs246357@gmail.com>");
            helper.setSubject("Order of: " + ShippingInfoEntity.getFullName());
            String url = request.getRequestURL().toString().replace("cart/success", "viewUser");

            String text ="<img src='https://lh3.googleusercontent.com/97vY23AibUnPa7TQX1FyLKan4rMSn4DwCPHEQHUrwGYPNCYBGboCFHVqVP88PPGEbfGrwASIXc66-hnZG0IfsW1sQ0bKGcLCI5_j0UT3UdgvDM4Sa1dR72xK5Odf3TezgtaYqDy6Q8cErZxLRXdn_boWIxgxDZhWYmUutdxzCoT-A6XL5rBGJhdh-YiMZKbAivLJBmOxv4FANImQIh0rfUuPNwtHzF8j4UbJcVlsFOQ7CplLiLxNLW7sNzPmAlpeDbJrVbp1ASNV0jaOfS8fjSTdgluPPx1fVg8-JKeDt5axdayccpV9MMStqu46qkEGu_ROQDEwo9-2yhaJO-shH0IuXLoZ7esI5_oHX2o2M3yk1QppQer-imyb1ZXjCyfKZoEzCHlUeaFotCvKlNuAHirDFvjT8ybQLRPmkxTA2El4I0TF2uR6d7CHLwBtnBtAM9o4mLektFzC2sj6bpG2C8Vtg_3JdwknJrQ_Mq1MPqUHuBC-JdCULO0_QQ8B8eRZBGBRmxAlp8BwisOqv_tZ_TWJF-BUmJhE09A2AfywnGhjh4SBejjqxpl0WNRnBAcmSSMlxOnBPgKhbR1V3vsXyKNE2W2o9iSfIzDmEf-nWbUoGU8XkBgnASn5Int5gT7Hsg77FpFh3oJ3A1Nooczkes3zGFifACs=w500-h131-no'>"
                    + "<h3> Thank you for your shopping at HK-Shop</h3>"
                   + "<br> Your order_detail:" 
                    + "<br> Total-price:" + order.getTotalPrice()
                    + "<br> Shipping-ddress:" + ShippingInfoEntity.getAddress()
                    + "<br> Phonenumber:" + ShippingInfoEntity.getPhoneNumber()
                    + "<br> Please click here to follow your order: " + url;

            helper.setText(text, true);
             massage.setContent(text,"text/html");
            mailSender.send(massage);
        } catch (Exception ex) {
         
        }

        return "success";
    }

}
