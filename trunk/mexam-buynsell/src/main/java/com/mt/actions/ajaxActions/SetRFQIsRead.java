/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.RFQ;
import com.mt.services.RFQService;

public class SetRFQIsRead extends AuthenticatedAction {

    private boolean val;
    private int rfqId;
    private RFQ rfq;
    private RFQService rFQService;

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    public void setRfqId(int rfqId) {
        this.rfqId = rfqId;
    }

    public void setVal(boolean val) {
        this.val = val;
    }

    @Override
    public String execute() throws Exception {
        if (rfqId > 0) {
            rfq = rFQService.getById(rfqId);
            if (rfq.getReceiver().getId() == getUser().getId() || rfq.getSender().getId() == getUser().getId()) {
                if (rfq != null) {
                    rfq.setIsNew(val);
                }
                rFQService.update(rfq);
            }
        }
        return SUCCESS;
    }
}
