/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.RFQ;
import com.mt.hibernate.entities.RFQItem;
import com.mt.services.RFQItemService;

/**
 *
 * @author Muaz
 */
public class UpdateRFQ extends AuthenticatedAction {

    private int id;
    private int price;
    private int quantity;
    private RFQItemService rFQItemService;

    public void setPrice(int price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setrFQItemService(RFQItemService rFQItemService) {
        this.rFQItemService = rFQItemService;
    }

    @Override
    public String execute() throws Exception {
       RFQItem rfqItem = rFQItemService.getById(id);
       rfqItem.setPrice(price);
       rfqItem.setQuantity(quantity);
       
       rFQItemService.update(rfqItem);
        return SUCCESS;
    }
}
