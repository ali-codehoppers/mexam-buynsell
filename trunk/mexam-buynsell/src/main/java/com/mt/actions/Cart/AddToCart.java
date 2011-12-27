/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Cart;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Cart;
import com.mt.hibernate.entities.CartItem;
import com.mt.hibernate.entities.Inventory;
import com.mt.services.CartItemService;
import com.mt.services.CartService;
import com.mt.services.CompanyService;
import com.mt.services.InventoryService;
import java.util.List;

public class AddToCart extends AuthenticatedAction {

    private int inventoryId;
    private int quantity;
    private Cart cart;
    private CompanyService companyService;
    private CartService cartService;
    private CartItemService cartItemService;
    private CartItem cartItem;
    private InventoryService inventoryService;

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
        //Company company = companyService.getById(getUser().getCompanyId());

        List<Cart> cartList = cartService.findByUser(getUser().getId());
        if (cartList.size() > 0) {
            cart = cartService.findByUser(getUser().getId()).get(0);
        }
        else
        {
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

        return SUCCESS;
    }
}
