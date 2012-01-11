package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.*;
import com.mt.services.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class SendRFQforItems extends AuthenticatedAction {

    private int vendorId = 0;
    private String parts;
    private Cart cart;
    private List<CartItem> cartItems;
    private CartService cartService;
    private CartItemService cartItemService;
    private CompanyService companyService;
    private RFQ rfq;
    private RFQService rFQService;
    private String jsonString;
    private RFQItemService rFQItemService;
    private List<Integer> partids;
    private String subject;
    private String message;
    
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

    public void setParts(String parts) {
        this.parts = parts;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String execute() throws Exception {

        partids = new ArrayList<Integer>();
        String ids[] = parts.split(",");
        for (String sid : ids) {
            try {
                int id = Integer.parseInt(sid);
                partids.add(id);
            } catch (Exception e) {
            }
        }


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
        rfq.setTitle(subject);
        rfq.setMessage(message);
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
            if (partids.contains(cartItem.getId())) {
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
        }
        rfq.setItems(rFQItems);
        rFQService.addNew(rfq);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}
