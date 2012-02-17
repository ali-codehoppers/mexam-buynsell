package com.mt.actions.paypal;

import com.mt.actions.Registration.*;
import com.google.gson.GsonBuilder;
import com.mt.actions.Company.*;
import com.mt.hibernate.entities.Country;
import com.mt.hibernate.entities.LookUp;
import com.mt.hibernate.entities.State;
import com.mt.services.CountryService;
import com.mt.services.LookUpService;
import com.opensymphony.xwork2.ActionSupport;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class ShowPayPayment extends ActionSupport {

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
