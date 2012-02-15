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


        <script type="text/javascript">
        
            $(document).ready(function () {
                populateStates(1);
            });
        
            function populateStates(id){
                if(id && id > 0)
                {
                    $.ajax({
                        type:       "get",
                        url:        "getStates",
                        data:       {countryId: id},
                        success:    function(msg) {
                            var data = eval('('+msg+')');
                            var html = "";
                            var len = data.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                            }
                            $('#state').html(html);
                        }
                    });
                }
                return false;
            }
        
            function payAmount()
            {
                $("#payAmount").submit();
            
                //            $.ajax({
                //                type:       "get",
                //                url:        "payAmount",
                //                data:       {amount: 50},
                //                success:    function(msg) 
                //                {
                //                    alert(msg);
                //                }
                //            });
            }
            
        </script>

        <title>JSP Page</title>
    </head>
    <body> 

        <jsp:include page="../common/header.jspf" >
            <jsp:param name="currentTab" value="sell"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Pay pal Payment</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>


                <div id="formContainder">
                    <form id ="payAmount" method="POST" action="payAmount">
                        <div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Country:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">    
                                        <!--                            <select id="country" name="country" class="field_big" style="min-width: 20%" onchange="javascript:populateStates(this.value)"></select>-->
                                        <select id="country" name="country" class="field_big" style="min-width: 20%" onchange="javascript:populateStates(this.value)">
                                            <option value="">Choose a Country</option>
                                            <option selected="selected" value="US">United States</option>
                                        </select>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_country"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Credit Card Number:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">   
                                    <div style="float: left;">    
                                        <input type="hidden" id="amount:" name="amount:" class="field_big" value="50"/>
                                        <input id="ccNumber" name="partNo" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_ccNumber"></ch:errortag>
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

                                        <input type="radio" name="paymentType" value="Visa" style="margin-left: 10px" checked="checked"/>
                                        Visa
                                        <input type="radio" name="paymentType" value="MasterCard" style="margin-left: 10px"/>
                                        MasterCard
                                        <input type="radio" name="paymentType" value="Discover"  style="margin-left: 10px"/>
                                        Discover
                                        <input type="radio" name="paymentType" value="American Express" style="margin-left: 10px"/>
                                        American Express
                                        <!--
                                        
                                                                                                            <input id="ccNumber" name="partNo" class="field_big"/>
                                                                                <fieldset class="group CH" id="pm-type">
                                                                                    <div class="ccIcon cctype icon selected" id="cctype">
                                                                                        <label for="visa" id="pm-visa" class="radio visa hilite">
                                                                                            <input type="radio" value="V" name="credit_card_type" id="visa" tabindex="-1" />
                                                                                            <span class="cclogo visa">&nbsp;</span><span>Visa</span>
                                                                                        </label>
                                                                                        <label for="mastercard" id="pm-mastercard" class="radio mc hilite">
                                                                                            <input type="radio" value="M" name="credit_card_type" id="mastercard" class="mc_subtype" tabindex="-1" />
                                                                                            <span class="cclogo mc">&nbsp;</span>
                                                                                            <span>MasterCard</span></label>
                                                                                        <label for="discover" id="pm-discover" class="radio disc hilite">
                                                                                            <input type="radio" value="D" name="credit_card_type" id="discover" tabindex="-1" />
                                                                                            <span class="cclogo disc">&nbsp;</span>
                                                                                            <span>Discover</span></label>
                                                                                        <label for="amex" id="pm-amex" class="radio amex hilite">
                                                                                            <input type="radio" value="A" name="credit_card_type" id="amex" tabindex="-1" />
                                                                                            <span class="cclogo amex">&nbsp;</span>
                                                                                            <span>American Express</span>
                                                                                        </label>
                                                                                    </div>
                                                                                </fieldset>-->
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_ccNumber"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>




                            <div>        
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Expiration Date:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">  
                                    <div style="float:left">
                                        <div style="float: left;">   
                                            <div style="float: left;">    
                                                <input id="expirationMonth" name="expirationMonth" class="field_big" maxlength="2" style="width:20px; text-align: center"/>
                                            </div>
                                            <div style="float: left; display: none" class="fieldError">                        
                                                <ch:errortag name="paypal_expirationMonth"></ch:errortag>
                                            </div>
                                            <div style="clear: both"></div> 
                                        </div>
                                    </div>
                                    <div style="float: left; margin-left: 10px">
                                        <div style="float: left; margin-top: 3px; width: 10px; vertical-align: middle; text-align: center">                        
                                            /
                                        </div>                        
                                        <div style="float: left;">   
                                            <div style="float: left;margin-left: 10px">    
                                                <input id="expirationYear" name="expirationYear" class="field_big" maxlength="2" style="width:20px;text-align: center"/>
                                            </div>
                                            <div style="float: left; display: none" class="fieldError">                        
                                                <ch:errortag name="paypal_expirationYear"></ch:errortag>
                                            </div>
                                            <div style="clear: both"></div> 
                                        </div>
                                    </div>
                                    <div style="margin-left: 25px; float: left">
                                        <div style="float: left; vertical-align: middle;">                        
                                            CSC:
                                        </div>                        
                                        <div style="float: left; margin-left: 10px">    
                                            <div style="float: left;">    
                                                <input id="csc" name="csc" class="field_big" maxlength="4" style="width:50px; text-align: center"/>
                                            </div>
                                            <div style="float: left;" class="fieldError">  
                                                <ch:errortag name="paypal_csc"></ch:errortag>
                                                <!--                                    <div style="float: left;" class="fieldError">                        
                                                                                    </div>-->
                                                <div style="clear: both"></div> 
                                            </div>
                                        </div>
                                        <div style="clear: both"></div> 
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    First Name:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">      
                                    <div style="float: left;">    
                                        <input name="firstName" class="field_big"/>
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
                                        <input name="lastName" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_lastName"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Billing Address Line 1:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;"> 
                                    <div style="float: left;">    
                                        <input name="billingLine1" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_billingLine1"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Billing Address Line 2:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;"> 
                                    <div style="float: left;">    
                                        <input name="billingLine2" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_billingLine2"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Zip Code:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;"> 
                                    <div style="float: left;">    
                                        <input name="zipCode" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_zipCode"></ch:errortag>
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
                                        <input name="city" class="field_big"/>
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
                                        <select id="state" name="stateVal" class="field_big" style="min-width: 20%">                       
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
                                    Telephone:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">    
                                        <input name="telephone" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_telephone"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>

                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Email:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">    
                                        <input name="email" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="paypal_email"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>

                            <div style="width: 100px; margin: auto">
                                <a href="javascript:payAmount()" class="btn" style="margin-top: 25px;">Submit</a>
                                <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                            </div>

                        </div> 
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jspf" />
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
