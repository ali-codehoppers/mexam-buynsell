/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions;

import com.mt.hibernate.entities.Address;
import com.mt.services.AddressService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class addressCheck extends ActionSupport {
    private List<Address> addresses;
    private AddressService addressService;

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }


    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }
    
    @Override
    public String execute() throws Exception{
        addresses = new ArrayList<Address>();
        addresses =  addressService.getAll();
           
        return SUCCESS;
    }

    public List<Address> getAddresses() {
        return addresses;
    }



    public AddressService getAddressService() {
        return addressService;
    }
    
    
}
