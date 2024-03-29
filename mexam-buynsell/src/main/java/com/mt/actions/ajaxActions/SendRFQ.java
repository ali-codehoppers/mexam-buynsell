package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Cart;
import com.mt.hibernate.entities.CartItem;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.RFQ;
import com.mt.hibernate.entities.RFQItem;
import com.mt.services.CartItemService;
import com.mt.services.CartService;
import com.mt.services.CompanyService;
import com.mt.services.RFQItemService;
import com.mt.services.RFQService;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class SendRFQ extends AuthenticatedAction {

    private int vendorId = 0;
    private Cart cart;
    private List<CartItem> cartItems;
    private CartService cartService;
    private CartItemService cartItemService;
    private CompanyService companyService;
    private RFQ rfq;
    private RFQService rFQService;
    private String jsonString = "";
    private RFQItemService rFQItemService;

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public void setCartItemService(CartItemService cartItemService) {
        this.cartItemService = cartItemService;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    public void setrFQItemService(RFQItemService rFQItemService) {
        this.rFQItemService = rFQItemService;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Override
    public String execute() throws Exception {

        List<Cart> cartList = cartService.findByUser(getUser().getId());
        if (cartList.size() > 0) {
            cart = cartService.findByUser(getUser().getId()).get(0);
        } else {
            cart = new Cart();
            cart.setUser(getUser());
            cartService.addNew(cart);
        }

        Company receiver = companyService.getById(vendorId);
        cartItems = cartItemService.findByVendor(cart.getId(), vendorId);

        rfq = new RFQ();
        rfq.setTitle("Some Title");
        rfq.setMessage("RFQ Message");
        rfq.setSender(getUser());
        rfq.setId(getUser().getId());
        rfq.setReceiver(receiver);
        rfq.setReceiverId(receiver.getId());
        rfq.setIsNew(true);
        rfq.setIsReplied(false);
        rfq.setCreatedBy(getUser().getId());
        rfq.setCreationDate(new Timestamp(System.currentTimeMillis()));
        rfq.setUpdatedBy(getUser().getId());

        rFQService.addNew(rfq);

        List<RFQItem> rFQItems = new ArrayList<RFQItem>();
        for (CartItem cartItem : cartItems) {
            RFQItem item = new RFQItem();
            item.setInventory(cartItem.getInventory());
            item.setInventoryId(cartItem.getInventoryId());
            item.setRfq(rfq);
            item.setRfqId(rfq.getId());
            item.setQuantity(cartItem.getQuantity());
            item.setCreatedBy(getUser().getId());
            item.setCreationDate(new Timestamp(System.currentTimeMillis()));
            item.setUpdatedBy(getUser().getId());
            rFQItems.add(item);
            rFQItemService.addNew(item);
            cartItemService.delete(cartItem);
        }
        rfq.setItems(rFQItems);
        rFQService.addNew(rfq);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}
