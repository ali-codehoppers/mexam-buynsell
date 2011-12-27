package com.mt.actions.Cart;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Cart;
import com.mt.hibernate.entities.CartItem;
import com.mt.services.CartService;
import com.mt.services.CompanyService;
import java.util.List;

public class ShowCart extends AuthenticatedAction {
    
    private String cartJson;
    private List<CartItem> items;
    private Cart cart;    
    private CompanyService companyService;
    private CartService cartService;
    
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }
    
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }
    
    @Override
    public String execute() throws Exception {
        //Company company = companyService.getById(getUser().getCompanyId());
        List<Cart> cartList = cartService.findByUser(getUser().getId());
        if (cartList.size() > 0) {
            cart = cartService.findByUser(getUser().getId()).get(0);
            items = cart.getItems();
        }
        
        cartJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(cart);
        return SUCCESS;
    }

    public String getCartJson() {
        return cartJson;
    }
    

}
