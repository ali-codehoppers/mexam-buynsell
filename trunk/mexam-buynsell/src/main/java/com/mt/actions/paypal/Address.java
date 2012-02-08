package com.mt.actions.paypal;

import java.io.Serializable;

public class Address implements Serializable
{
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zipCode;
    private String country;

    public String getAddress1()
    {
        return address1;
    }

    public void setAddress1(String address1)
    {
        this.address1 = address1;
    }

    public String getAddress2()
    {
        return address2;
    }

    public void setAddress2(String address2)
    {
        this.address2 = address2;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getState()
    {
        return state;
    }

    public void setState(String state)
    {
        this.state = state;
    }

    public String getZipCode()
    {
        return zipCode;
    }

    public void setZipCode(String zipCode)
    {
        this.zipCode = zipCode;
    }

    public String getCountry()
    {
        return country;
    }

    public void setCountry(String country)
    {
        this.country = country;
    }

    @Override
    public String toString()
    {
        StringBuilder builder = new StringBuilder();

        builder.append("Address[");
        builder.append("address1: ").append(address1);
        builder.append(", address1: ").append(address1);
        builder.append(", city: ").append(city);
        builder.append(", state: ").append(state);
        builder.append(", zipCode: ").append(zipCode);
        builder.append(", country: ").append(country);
        builder.append("]");

        return builder.toString();
    }
}
