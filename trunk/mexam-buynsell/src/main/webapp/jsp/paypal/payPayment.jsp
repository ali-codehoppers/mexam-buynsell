<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="errortags" prefix="ch"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />

        <script language="JavaScript">
            
            
            function generateCC(){
                var cc_number = new Array(16);
                var cc_len = 16;
                var start = 0;
                var rand_number = Math.random();
		
                //switch(document.payAmount.creditCardType.value)
                var selectedVal = $("#creditCardType").val();
                switch(selectedVal)
                {
                    case "Visa":
                        cc_number[start++] = 4;
                        break;
                    case "Discover":
                        cc_number[start++] = 6;
                        cc_number[start++] = 0;
                        cc_number[start++] = 1;
                        cc_number[start++] = 1;
                        break;
                    case "MasterCard":
                        cc_number[start++] = 5;
                        cc_number[start++] = Math.floor(Math.random() * 5) + 1;
                        break;
                    case "Amex":
                        cc_number[start++] = 3;
                        cc_number[start++] = Math.round(Math.random()) ? 7 : 4 ;
                        cc_len = 15;
                        break;
                }
                        
                for (var i = start; i < (cc_len - 1); i++) {
                    cc_number[i] = Math.floor(Math.random() * 10);
                }
                		
                var sum = 0;
                for (var j = 0; j < (cc_len - 1); j++) {
                    var digit = cc_number[j];
                    if ((j & 1) == (cc_len & 1)) digit *= 2;
                    if (digit > 9) digit -= 9;
                    sum += digit;
                }
                		
                var check_digit = new Array(0, 9, 8, 7, 6, 5, 4, 3, 2, 1);
                cc_number[cc_len - 1] = check_digit[sum % 10];
                		
                $("#creditCardNumber").val("");
                for (var k = 0; k < cc_len; k++) {
                    $("#creditCardNumber").val($("#creditCardNumber").val() + cc_number[k]);
                }
            }	
	
        </script>
        <%
            String error = "";
            if(request.getParameterMap().containsKey("error")){ 
                error = request.getParameter("error").toString();             
            }
        %>

        <script type="text/javascript">
            var error = "<%=error%>";           
            $(document).ready(function () {
                if(error == "paymenterror"){
                    jQuery("#errorMsg").html("Invalid Credit Card Number or Credit Card Verification Code.");
                    jQuery('#messageContainer').show();
                }
                else if(error == "null"){
                    jQuery("#errorMsg").html("Sorry! We are unable to make a connection, Please try again Later");
                    jQuery('#messageContainer').show();
                }
                $('input:radio[name=membershipType]').click(function() {
                    var val = $('input:radio[name=membershipType]:checked').val();
                    //                    $("#amount").val(val+".00");
                    switch(val)
                    {
                        case "1":
                            $("#amount").val("5.00");
                            break;
                        case "3":
                            $("#amount").val("10.00");
                            break;
                        case "12":
                            $("#amount").val("25.00");
                            break;
                    }
                });
            });
            function copyAddress(obj){
                if(obj.checked){
                    jQuery("#shippingAddress1").val(jQuery("#billingAddress1").val());
                    jQuery("#shippingAddress2").val(jQuery("#billingAddress2").val());
                    jQuery("#shippingCity").val(jQuery("#billingCity").val());
                    jQuery("#shippingZip").val(jQuery("#billingZip").val());
                    //jQuery("#shippingAddress2").val(jQuery("#billingAddress2"));
                }
                else{
                    jQuery("#shippingAddress1").val("");
                    jQuery("#shippingAddress2").val("");
                    jQuery("#shippingCity").val("");
                    jQuery("#shippingZip").val("");
                    //jQuery("#shippingAddress2").val(jQuery("#billingAddress2"));
                }
                
            }
        
            function submitForm()
            {
                $("#payAmount").submit();
            }
            
        </script>

        <title>JSP Page</title>
    </head>
    <body> 

        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="sell"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Premium Membership Payment</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="formContainder">
                    <div id="messageContainer" style="margin: auto;display:none">
                        <table id="messageError" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="6%" align="right"><img src="images/error_left.jpg" alt="" width="38" height="34" /></td>
                                <td id="errorMsg" width="88%" align="left" class="error_msg"></td>
                                <td width="5%" align="right" class="error_msg"><a href="#"><img src="images/error_cross.jpg" alt="" width="18" height="18" border="0" onclick="jQuery('#messageContainer').hide()"/></a></td>
                                <td width="1%" align="left"><img src="images/error_right.jpg" alt="" width="6" height="34" /></td>
                            </tr>
                        </table>
                    </div>
                    <form id ="payAmount" method="POST" action="payAmount">

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Membership Type:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;">      
                                <div style="float: left;">    
                                    <input type="radio" name="membershipType" value="1" /> 1 Month ($5.0)
                                    <input type="radio" name="membershipType" value="3" checked/> 3 Months ($10.0)
                                    <input type="radio" name="membershipType" value="12"/> 1 Year ($25.0)
                                </div>
                                <div style="float: left;" class="fieldError">  
                                    <ch:errortag name="paypal_membershipType"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                First Name:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;">      
                                <div style="float: left;">    
                                    <input type="text" size="30" maxlength="32" name="firstName" value="" class="field_big"/>
                                </div>
                                <div style="float: left;" class="fieldError">  
                                    <ch:errortag name="paypal_firstName"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Last Name:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="30" maxlength="32" name="lastName" value="" class="field_big"/>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_lastName"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>


                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Payment Types:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;">   
                                <div style="float: left;">    
                                    <select id="creditCardType" name="creditCardType" onChange="javascript:generateCC(); return false;" class="field_big">
                                        <option value="Visa">Visa</option>
                                        <option value="MasterCard">MasterCard</option>
                                        <option value="Discover">Discover</option>
                                        <option value="Amex">American Express</option>
                                    </select>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_creditCardType"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Card Number:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="19" maxlength="19" id="creditCardNumber" name="creditCardNumber" class="field_big"/>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_creditCardNumber"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Expiration Date:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <select name="expdate_month" class="field_big" style="max-width: 50px;">
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                    <select name="expdate_year" class="field_big" style="max-width: 80px;">
                                        <option value="2004">2004</option>
                                        <option value="2005">2005</option>
                                        <option value="2006">2006</option>
                                        <option value="2007">2007</option>
                                        <option value="2008">2008</option>
                                        <option value="2009">2009</option>
                                        <option value="2010" >2010</option>
                                        <option value="2011">2011</option>
                                        <option value="2012">2012</option>
                                        <option value="2013" selected>2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
                                    </select>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_expdate_month"></ch:errortag>
                                    <ch:errortag name="paypal_expdate_year"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Card Verification Number:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="3" maxlength="4" name="cvv2Number" class="field_big" value="962" style="max-width: 50px; text-align: center"/>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_cvv2Number"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Amount:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="4" maxlength="7" id="amount" name="amount" value="10.00" class="field_big"  style="width: 80px;"  readonly="readonly"/>USD
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_amount"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <br>
                        <div style="clear: both"></div> 
                        <div style="text-align: center">
                            <br/>
                            <span style="font-weight: bold; font-size: 14px;"> Billing Address:</span>
                            <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Address 1:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="25" maxlength="100" name="billingAddress1" id="billingAddress1" class="field_big" value="<s:property value="address"/>"/>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_address1"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Address 2:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="25" maxlength="100" name="billingAddress2" id="billingAddress2" class="field_big" value=""/>(optional)
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_address2"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                City:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="25" maxlength="40" name="billingCity" id="billingCity" value="<s:property value="city"/>" class="field_big" />
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_city"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                State:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <select name="billingState" id="billingState" class="field_big" style="width: 50px;" >
                                        <option></option>
                                        <option value="AK">AK</option>
                                        <option value="AL">AL</option>
                                        <option value="AR">AR</option>
                                        <option value="AZ">AZ</option>
                                        <option value="CA">CA</option>
                                        <option value="CO">CO</option>
                                        <option value="CT">CT</option>
                                        <option value="DC">DC</option>
                                        <option value="DE">DE</option>
                                        <option value="FL">FL</option>
                                        <option value="GA">GA</option>
                                        <option value="HI">HI</option>
                                        <option value="IA">IA</option>
                                        <option value="ID">ID</option>
                                        <option value="IL">IL</option>
                                        <option value="IN">IN</option>
                                        <option value="KS">KS</option>
                                        <option value="KY">KY</option>
                                        <option value="LA">LA</option>
                                        <option value="MA">MA</option>
                                        <option value="MD">MD</option>
                                        <option value="ME">ME</option>
                                        <option value="MI">MI</option>
                                        <option value="MN">MN</option>
                                        <option value="MO">MO</option>
                                        <option value="MS">MS</option>
                                        <option value="MT">MT</option>
                                        <option value="NC">NC</option>
                                        <option value="ND">ND</option>
                                        <option value="NE">NE</option>
                                        <option value="NH">NH</option>
                                        <option value="NJ">NJ</option>
                                        <option value="NM">NM</option>
                                        <option value="NV">NV</option>
                                        <option value="NY">NY</option>
                                        <option value="OH">OH</option>
                                        <option value="OK">OK</option>
                                        <option value="OR">OR</option>
                                        <option value="PA">PA</option>
                                        <option value="RI">RI</option>
                                        <option value="SC">SC</option>
                                        <option value="SD">SD</option>
                                        <option value="TN">TN</option>
                                        <option value="TX">TX</option>
                                        <option value="UT">UT</option>
                                        <option value="VA">VA</option>
                                        <option value="VT">VT</option>
                                        <option value="WA">WA</option>
                                        <option value="WI">WI</option>
                                        <option value="WV">WV</option>
                                        <option value="WY">WY</option>
                                        <option value="AA">AA</option>
                                        <option value="AE">AE</option>
                                        <option value="AP">AP</option>
                                        <option value="AS">AS</option>
                                        <option value="FM">FM</option>
                                        <option value="GU">GU</option>
                                        <option value="MH">MH</option>
                                        <option value="MP">MP</option>
                                        <option value="PR">PR</option>
                                        <option value="PW">PW</option>
                                        <option value="VI">VI</option>
                                    </select>

                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_state"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                ZIP Code:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="10" maxlength="10" name="billingZip" id="billingZip" value="<s:property value="zip"/>" class="field_big"  style="width: 80px; text-align: center"/>(5 or 9 digits)
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_zip"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Country:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                United States
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div style="text-align: center">
                            <br/>
                            <span style="font-weight: bold; font-size: 14px;"> Shipping Address:</span>
                            <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                            <input type="checkbox" value="1" name="shippingIsSame" onclick="copyAddress(this)" /> <span> Same as Billing</span>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Address 1:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="25" maxlength="100" name="shippingAddress1" id="shippingAddress1" class="field_big" value=""/>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_address1"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Address 2:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="25" maxlength="100" name="shippingAddress1" id="shippingAddress2" class="field_big" value=""/>(optional)
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_address2"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                City:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="25" maxlength="40" name="shippingCity" id="shippingCity" value="" class="field_big" />
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_city"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                State:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <select name="shppingState" id="shppingState" class="field_big" style="width: 50px;" >
                                        <option></option>
                                        <option value="AK">AK</option>
                                        <option value="AL">AL</option>
                                        <option value="AR">AR</option>
                                        <option value="AZ">AZ</option>
                                        <option value="CA">CA</option>
                                        <option value="CO">CO</option>
                                        <option value="CT">CT</option>
                                        <option value="DC">DC</option>
                                        <option value="DE">DE</option>
                                        <option value="FL">FL</option>
                                        <option value="GA">GA</option>
                                        <option value="HI">HI</option>
                                        <option value="IA">IA</option>
                                        <option value="ID">ID</option>
                                        <option value="IL">IL</option>
                                        <option value="IN">IN</option>
                                        <option value="KS">KS</option>
                                        <option value="KY">KY</option>
                                        <option value="LA">LA</option>
                                        <option value="MA">MA</option>
                                        <option value="MD">MD</option>
                                        <option value="ME">ME</option>
                                        <option value="MI">MI</option>
                                        <option value="MN">MN</option>
                                        <option value="MO">MO</option>
                                        <option value="MS">MS</option>
                                        <option value="MT">MT</option>
                                        <option value="NC">NC</option>
                                        <option value="ND">ND</option>
                                        <option value="NE">NE</option>
                                        <option value="NH">NH</option>
                                        <option value="NJ">NJ</option>
                                        <option value="NM">NM</option>
                                        <option value="NV">NV</option>
                                        <option value="NY">NY</option>
                                        <option value="OH">OH</option>
                                        <option value="OK">OK</option>
                                        <option value="OR">OR</option>
                                        <option value="PA">PA</option>
                                        <option value="RI">RI</option>
                                        <option value="SC">SC</option>
                                        <option value="SD">SD</option>
                                        <option value="TN">TN</option>
                                        <option value="TX">TX</option>
                                        <option value="UT">UT</option>
                                        <option value="VA">VA</option>
                                        <option value="VT">VT</option>
                                        <option value="WA">WA</option>
                                        <option value="WI">WI</option>
                                        <option value="WV">WV</option>
                                        <option value="WY">WY</option>
                                        <option value="AA">AA</option>
                                        <option value="AE">AE</option>
                                        <option value="AP">AP</option>
                                        <option value="AS">AS</option>
                                        <option value="FM">FM</option>
                                        <option value="GU">GU</option>
                                        <option value="MH">MH</option>
                                        <option value="MP">MP</option>
                                        <option value="PR">PR</option>
                                        <option value="PW">PW</option>
                                        <option value="VI">VI</option>
                                    </select>

                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_state"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                ZIP Code:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                <div style="float: left;">    
                                    <input type="text" size="10" maxlength="10" name="shippingZip" id="shippingZip" value="" class="field_big"  style="width: 80px; text-align: center"/>(5 or 9 digits)
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="paypal_zip"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Country:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;"> 
                                United States
                                <div style="clear: both"></div> 
                            </div>
                        </div>



                        <div style="width: 100px; margin: auto">
                            <a href="javascript:submitForm()" class="btn" style="min-width: 100px; text-align: center; margin-top: 25px; color:#333">Submit</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>

                    </form>

                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
        <script language="javascript">
            generateCC();
        </script>   
    </body>
    <!--    
        <body>
            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" id="payPalForm">
                <input type="hidden" name="cmd" value="_s-xclick-subscriptions">
                <input type="hidden" name="business" value="amier_1327043773_biz@codehoppers.com">
                <input type="hidden" name="lc" value="US">
                <input type="hidden" name="item_name" value="Buy-n-Sell">
                <input type="hidden" name="item_number" value="00123">
                <input type="hidden" name="no_note" value="1">
                <input type="hidden" name="src" value="1">
                <input type="hidden" name="a3" value="99.99">
                <input type="hidden" name="p3" value="1">
                <input type="hidden" name="t3" value="M">
                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="return" value="payPalComplete">
                <input type="hidden" name="bn" value="PP-SubscriptionsBF:btn_subscribe_LG.gif:NonHostedGuest">
                <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_subscribe_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!">
                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
            </form>
    
            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_s-xclick">
                <input type="hidden" name="hosted_button_id" value="ZJNKGE3NQMHQW">
                <input type="hidden" name="return" value="payPalComplete">
                <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynow_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!">
                <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
            </form>
    
            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_s-xclick">
                <input type="hidden" name="hosted_button_id" value="N3Y8MZ3WWZVEN">
                <table>
                    <tr><td><input type="hidden" name="on0" value="Package">Package</td></tr><tr><td><select name="os0">
                                <option value="Monthly">Monthly $9.99 USD</option>
                                <option value="6 Months">6 Months $25.99 USD</option>
                                <option value="1 Year">1 Year $35.99 USD</option>
                            </select> </td></tr>
                </table>
                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="user_id" value="${user.id}">
                <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_paynow_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!">
                <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
                <a href="javascript:payAmount()" class="btn" style="margin-top: 25px; margin-bottom: 15px;">Pay Amount</a>
            </form>
    
        </body>-->
</html>
