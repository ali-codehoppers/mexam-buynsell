/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Cart;
import com.mt.hibernate.entities.CartItem;
import com.mt.services.CartItemService;
import com.mt.services.CartService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

public class GetCartVendorItemsList extends AuthenticatedAction {

    private int vendorId=0;
    private Cart cart;
    private List<CartItem> cartItems;
    private List<CartItemExtended> cartItemsExtended;
    private CartService cartService;
    private CartItemService cartItemService;
    private String jsonString = "";
    private int rows = 0;
    private int page = 0;
    private String sidx;
    private String sord;
    private String searchField;
    private String searchString;
    private String searchOper;

    public void setRows(int rows) {
        this.rows = rows;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public void setCartItemService(CartItemService cartItemService) {
        this.cartItemService = cartItemService;
    }
    
    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    @Override
    public String execute() throws Exception {

        cartItemsExtended = new ArrayList<CartItemExtended>();
        if (searchField == null) {
            searchField = "name";
            searchOper = "=";
            searchString = "name";
        }

        List<Cart> cartList = cartService.findByUser(getUser().getId());
        if (cartList.size() > 0) {
            cart = cartService.findByUser(getUser().getId()).get(0);
        } else {
            cart = new Cart();
            cart.setUser(getUser());
            cartService.addNew(cart);
        }

        cartItems = cartItemService.findByVendor(cart.getId(), vendorId);
        
        //cartItems = cart.getItems();
        for (CartItem item : cartItems) {
            cartItemsExtended.add(new CartItemExtended(item));
        }

        RecordsJson<CartItemExtended> recordsJson = new RecordsJson<CartItemExtended>(page, rows, cartItemsExtended);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private class CartItemExtended extends CartItem {

        @Expose
        private String partNo;
        @Expose
        private String manufacturer;
        @Expose
        private double price;

        public CartItemExtended(CartItem cartItem) {

            super.setId(cartItem.getId());
            super.setCartId(cartItem.getCartId());
            super.setCart(cartItem.getCart());
            super.setInventoryId(cartItem.getInventoryId());
            super.setInventory(cartItem.getInventory());
            super.setQuantity(cartItem.getQuantity());

            this.partNo = cartItem.getInventory().getPartNo();
            this.manufacturer = cartItem.getInventory().getManufacturer();
            this.price = cartItem.getInventory().getPrice();
        }
    }
}
