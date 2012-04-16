<%@page import="com.mt.hibernate.entities.User"%>
<%@ page pageEncoding="windows-1252" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String currentTab = request.getParameter("currentTab");
    if (currentTab == null) {
        currentTab = "Home";
    }
%>
<link rel="stylesheet" href="css/dropdown/style.css" type="text/css" media="screen, projection"/>

<!--[if lt IE 8]>
<style type="text/css">
li a {display:inline-block;}
li a {display:block;}
</style>
<![endif]-->
<style>

    .submitBtn{
        background:url(images/signin.jpg) no-repeat;
        cursor:pointer;
        width: 75px;
        height: 25px;
        border: none;
    }
    .header_bottom{
        height:100px;
        display:table-cell;
        vertical-align:bottom;
    }
</style>
<script type="text/javascript" src="js/dropdown/jquery.dropdownPlain.js"></script>
<div id="header" class="header" style="width: 100%; margin: auto;">
    <div id="header_Top" style="margin: auto">
        <table width="990px" border="0" cellspacing="0" cellpadding="0" style="margin: auto">
            <tr>
                <td width="695"><img src="images/logo.jpg" height="71" alt="" /></td>
                <td width="295" align="right">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="right" valign="top">
                                <form action="#" method="post">
                                    <input type="text" name="search" class="search" value="Search..." onBlur="if (this.value == ''){this.value = 'Search...'; }" onFocus="if (this.value== 'Search...') {this.value = ''; }" />
                                    <div id="btn_">Go</div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td align="left"><a href="#">Advance Search</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="header_Bottom" style="margin: auto">
        <div style="width: 990px; margin: auto;">
            <div style="position:absolute;right: 150px;color:#B0B0B0">
                <% if (session.getAttribute(
                            "user") == null) {%> 
                <form id="loginFormComp" name="loginFormComp" method="post" action="login" style="margin: auto;">
                    <table cellspacing="10">
                        <tr>
                            <td>Login: </td>
                            <td>
                                <input type="text" id="userName" name="userName" class="input_"  value="Username" onBlur="if (this.value == ''){this.value = 'Username'; }" onFocus="if (this.value== 'Username') {this.value = ''; }" />
                            </td>
                            <td>
                                <input type="password" id="password" name="password" class="input_"  value="Password" onBlur="if (this.value == ''){this.value = 'Password'; }" onFocus="if (this.value== 'Password') {this.value = ''; }" />
                            </td>
                            <td>
                                <input type="submit" class="submitBtn" value=""/>
                            </td>  
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <input type="checkbox" name="rememberMe" id="rememberMe" value="true" />
                                <span style="font-size: 10pt">Remember Me</span>
                            </td>
                            <td colspan="2">
                                <div><a href="forgotPassword"  style="font-size: 8pt">Forgot Password?</a> <a href="showRegistrationInfo"  style="font-size: 8pt">Register Now</a></div>
                            </td>
                        </tr>
                    </table>
                </form>
                <% } else {%>
                <table border="0" cellspacing="0" cellpadding="1">
                    <tr style="font-size: 14px; color: #ffffff;">
                        <td colspan="1" style="text-align: right;">Welcome,  <%= ((User) session.getAttribute("user")).getCompany().getName()%>&nbsp;&nbsp; </td><td>| <a href="#">Help</a> |&nbsp;<a href="logout"> Sign Out</a></td>
                    </tr>
                </table>
                <div style="position:absolute;right:0px">
                    <table border="0" cellspacing="0" cellpadding="1" style="margin-top: 5px; display: none;" id="cartItemsCont">
                        <tr style="font-size: 14px; color: #ffffff; text-align: right;">
                            <td colspan="1" style="text-align: right;">
                                <div style="float: right">
                                    <div style="float: left; width: auto">
                                        <a href="showCart"><img src="images/shopping_cart_32.png"></a>
                                    </div>
                                    <div style="float: left;width: auto; margin-top: 7px;">
                                        <a href="showCart" id="cartItems"></a>
                                    </div>
                                    <div style="clear: both"></div>
                                </div>
                                <div style="clear: both"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <% }%>

            </div>
            <div style="" class="header_bottom">
                <ul class="dropdown">
                    <%if (currentTab.equals("Home")) {%>
                    <li class="navigation_radius"><a href="home">HOME</a></li>
                    <%} else {%>
                    <li><a href="home">HOME</a></li>
                    <% }%>
                    <%if (currentTab.equals("buy")) {%>
                    <li class="navigation_radius">
                        <%} else {%>
                    <li>
                        <% }%>
                        <a href="searchItem">BUY</a>
                    </li>
                    <% if ((session.getAttribute("user") != null) && !((User) session.getAttribute("user")).getCompany().isIsExpired()) {%> 
                    <%if (currentTab.equals("user")) {%>
                    <li class="navigation_radius">
                        <%} else {%>
                    <li>
                        <% }%>

                        <a href="#">USER</a>
                        <ul class="sub_menu" style="z-index: 99">
                            <li><a href="userDashboard">Dashboard</a></li>
                            <li><a href="#">Profile</a></li>
                            <li><a href="#">Performance</a></li>
                            <li><a href="#">Reports</a></li>
                            <li><a href="#">Manage Membership</a></li>
                            <li><a href="#">Alerts</a></li>
                            <li><a href="#">Reminders</a></li>
                        </ul>
                    </li>
                    <%if (currentTab.equals("sell")) {%>
                    <li class="navigation_radius">
                        <%} else {%>
                    <li>
                        <% }%>
                        <a href="#">SELL</a>
                        <ul class="sub_menu" style="z-index: 99">
                            <li>
                                <a href="#">Manage Inventory</a>
                                <ul>
                                    <li><a href="showAddInventory">Add New Inventory</a></li><li><a href="#">Update Inventory</a></li><li><a href="showInventory">View Inventory</a></li>
                                </ul>

                            </li>
                            <li><a href="#">Manage Parts</a>
                                <ul>
                                    <li><a href="findPart">Add New Part</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <%if (currentTab.equals("vendor")) {%>
                    <li class="navigation_radius">
                        <%} else {%>
                    <li>
                        <% }%>
                        <a href="#">VENDORS</a>
                        <ul class="sub_menu" style="z-index: 99">
                            <li><a href="searchVendor">Search Vendor</a></li>
                            <li><a href="showMyVendors">Manage My Vendors</a></li>                            
                            <li><a href="showVendors">View All Vendors</a></li>
                            <li><a href="#">Leave Feedback</a></li>
                        </ul>
                    </li>
                    <%if (currentTab.equals("broadcast")) {%>
                    <li class="navigation_radius">
                        <%} else {%>
                    <li>
                        <% }%>
                        <a href="#">BROADCAST</a>
                        <ul class="sub_menu" style="z-index: 99">
                            <li><a href="showAddBroadcast">New Broadcast</a></li>
                            <li><a href="showMyBroadcasts">View My Broadcasts</a>
                            <li><a href="showBroadcasts">View All Broadcasts</a>
                            <li><a href="#">Set Broadcast Filters</a>
                            </li>
                        </ul>
                    </li>
                    <%if (currentTab.equals("rfq")) {%>
                    <li class="navigation_radius">
                        <%} else {%>
                    <li>
                        <% }%>
                        <a href="#">RFQ</a>
                        <ul class="sub_menu" style="z-index: 99">
                            <li><a href="showRFQs">View RFQs</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">MESSAGES (0)</a>
                        <ul class="sub_menu" style="z-index: 99">
                            <li><a href="#">User (0)</a></li>
                            <li><a href="#">Buy-n-Sell (0)</a></li>


                        </ul>
                    </li>
                    <% }%>

                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var isCart=false;
        function checkField(){
            var check=true;
            if($("#Username").val()==""||$("#Username").val()=="Username"){
                $("#errorUsername").show();
                $("#errorUsername").css("color","red");
                $("#errorUsername").css("font-weight","bold");
                check=false;
            }
            if($("#Password").val()==""||$("#Password").val()=="Password"){
                $("#errorPassword").show();
                $("#errorPassword").css("color","red");
                $("#errorPassword").css("font-weight","bold");
                check=false;
            }
            return check;
        }
        function onSignInClick(){
            $("#loginFormComp").submit();
        }
        
        function getCartItemsCount()
        {
            $.ajax({
                type:       "get",
                url:        "getCartItemsCount",
                data:       {},
                success:    function(msg) {
                    if(parseInt(msg)>0 && !isCart)
                    {
                        $("#cartItems").text(msg+" item(s) in cart");
                        $("#cartItemsCont").show();
                    }
                }
            });
            
        }
        <% if (session.getAttribute(
                    "user") != null) {%> 
                        if(!isCart)
                            getCartItemsCount();
        <% }%>
    </script>
</div>