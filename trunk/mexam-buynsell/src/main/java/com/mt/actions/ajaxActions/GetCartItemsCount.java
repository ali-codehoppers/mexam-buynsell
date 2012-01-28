/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Cart;
import com.mt.services.CartService;
import java.util.List;

public class GetCartItemsCount extends AuthenticatedAction {

    private Cart cart;
    //private CompanyService companyService;
    private CartService cartService;
    private int itemCount=0;

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }
    @Override
    public String execute() throws Exception {
        //Company myCompany = companyService.getById(getUser().getCompanyId());
        List<Cart> cartList = cartService.findByUser(getUser().getId());
        if (cartList.size() > 0) {
            cart = cartService.findByUser(getUser().getId()).get(0);
            itemCount = cart.getItems().size();
        }
        return SUCCESS;
    }

    public String getJsonString() {
        return ""+itemCount;
    }
}
