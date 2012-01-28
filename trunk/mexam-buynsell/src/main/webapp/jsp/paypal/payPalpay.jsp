<%-- 
    Document   : payPalpay
    Created on : Jan 18, 2012, 7:38:13 PM
    Author     : AmierHaider
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
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
        </form>

    </body>
</html>
