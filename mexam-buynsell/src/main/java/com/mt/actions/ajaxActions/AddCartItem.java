/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.*;
import com.mt.services.CartItemService;
import com.mt.services.CartService;
import com.mt.services.InventoryService;
import java.util.List;

public class AddCartItem extends AuthenticatedAction {

    private int inventoryId;
    private int quantity;
    private Cart cart;
    //private CompanyService companyService;
    private CartService cartService;
    private CartItemService cartItemService;
    private CartItem cartItem;
    private InventoryService inventoryService;
    private String message="";

    public void setInventoryId(int inventoryId) {
        this.inventoryId = inventoryId;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    public void setCartItemService(CartItemService cartItemService) {
        this.cartItemService = cartItemService;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String execute() throws Exception {
        //Company myCompany = companyService.getById(getUser().getCompanyId());
        List<Cart> cartList = cartService.findByUser(getUser().getId());
        if (cartList.size() > 0) {
            cart = cartService.findByUser(getUser().getId()).get(0);
        } else {
            cart = new Cart();
            cart.setUser(getUser());
            cartService.addNew(cart);
        }

        Inventory inventory = inventoryService.getById(inventoryId);
        cartItem = new CartItem();
        cartItem.setCart(cart);
        cartItem.setInventory(inventory);
        cartItem.setQuantity(quantity);
        cartItemService.addNew(cartItem);

        message="Item added to cart sucessfully" ;
        
        return SUCCESS;
    }

    public String getJsonString() {
        return message;
    }
}
