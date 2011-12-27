/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Cart;
import com.mt.hibernate.entities.CartItem;
import com.mt.hibernate.entities.Company;
import com.mt.services.CartService;
import com.mt.services.CompanyService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

public class GetCartVendorsList extends AuthenticatedAction {

    private Cart cart;
    private List<Company> allVendors;
    private List<Company> vendors;
    private CompanyService companyService;
    private CartService cartService;
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

    @Override
    public String execute() throws Exception {

        vendors = new ArrayList<Company>();
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

        List<CartItem> cartItems = cart.getItems();
        for (CartItem item : cartItems) {
            if (!vendors.contains(item.getInventory().getCompany())) {
                vendors.add(item.getInventory().getCompany());
            }
        }

        RecordsJson<Company> recordsJson = new RecordsJson<Company>(page, rows, vendors);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}
