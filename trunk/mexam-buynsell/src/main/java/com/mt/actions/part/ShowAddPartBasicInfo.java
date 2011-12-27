package com.mt.actions.part;

import com.mt.actions.AuthenticatedAction;

public class ShowAddPartBasicInfo extends AuthenticatedAction {

    private String subCatId;

    public void setSubCatId(String subCatId) {
        this.subCatId = subCatId;
    }
    
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    public String getSubCatId() {
        return subCatId;
    }
   
}
