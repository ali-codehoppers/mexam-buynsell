<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>
            #prodDesc
            {
                font-weight: bold!important;
                font-size: 1.5em!important;
                padding: 8px;
                color: #083152;
            }
            #prodLongDesc
            {
                font-size: 1.2em!important;
                padding: 8px;
                text-align:justify;
                font-size: 10pt!important;
            }

            .prodDescTitle
            {
                background-color: #4B4B4B;
                border-radius:4px;
                padding: 8px;
                color: #FFFFFF;
                font-weight: bold!important;
                font-size: 10pt!important;
            }

            .prodDescContent
            {
                font-size: 10pt!important;
            }


        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                //alert(conditions);
                $("#tabs").tabs();
            });
 
            
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="73"><table width="990" border="0" cellspacing="0" cellpadding="0">
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
                </td>
            </tr>

            <tr>
                <td height="130" valign="bottom">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="56" align="left" valign="bottom">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="66" align="center"><a href="#" class="topnav">HOME</a></td>
                                        <td width="100" align="center"><a href="#" class="topnav">ABOUT US</a></td>
                                        <td width="53" align="center"><a href="#" class="topnav">BUY</a></td>
                                        <td width="77" align="center" valign="middle" class="navigation_radius">SELL</td>
                                        <td width="100" align="center"><a href="#" class="topnav">FEATURES</a></td>
                                        <td width="100" align="center"><a href="#" class="topnav">CONTACT US</a></td>
                                        <td width="100" align="center" nowrap="nowrap"><a href="#" class="topnav">SITE MAP</a></td>
                                        <td width="26">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" class="login_bg">
                                <form id="form1" name="form1" method="post" action="">
                                    <table width="200" border="0" cellspacing="0" cellpadding="3">
                                        <tr>
                                            <td colspan="2">MEMBER LOGIN</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <input type="text" name="search" class="input_" value="Username" onBlur="if (this.value == ''){this.value = 'Username'; }" onFocus="if (this.value== 'Username') {this.value = ''; }" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" name="Password" class="input_" value="Password" onBlur="if (this.value == ''){this.value = 'Password'; }" onFocus="if (this.value== 'Password') {this.value = ''; }" /></td>
                                        </tr>
                                        <tr>
                                            <td width="109"><input type="checkbox" name="checkbox" id="checkbox" />
                                                <label for="checkbox">Remember Me</label></td>
                                            <td width="79"><a href="#"><img src="images/signin.jpg" alt="" width="73" height="25" border="0" /></a></td>
                                        </tr>
                                    </table>
                                </form></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="100%" valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="34" colspan="2" align="center">
                                            <h1 id="listTitle"><s:property value="part.partNo" /></h1>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><img src="images/under_line.jpg" width="553" height="16" alt="" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <div id="prodDetailCont" style="margin-top: 10px">
                                                <div id="prodImageCont" style="float: left">
                                                    <s:if test="part.images.get(0).id>0">
                                                        <img src="getImage?imageId=<s:property value="part.images.get(0).id" />"/>
                                                    </s:if>
                                                    <s:else>
                                                        <img src='images/default.png'/>
                                                    </s:else>
                                                </div>

                                                <div id="prodDescCont" style="float: left">
                                                    <div id="prodDesc" style="text-align: left">
                                                        <s:property value="part.description"/><br>
                                                    </div>

                                                    <div id="prodLongDesc" style="max-width: 530px">
                                                        <s:property value="part.overview"/><br>
                                                    </div>
                                                </div>
                                            </div>

                                            <div style="clear: both">
                                            </div>
                                            <div id="tabs">
                                                <ul>
                                                    <li><a href="#productInfo"><span>Product Information</span></a></li>
                                                    <li><a href="#parts"><span>Parts & Pricing</span></a></li>
                                                    <li><a href="#docs"><span>Related Documents</span></a></li>
                                                    <li><a href="#reviews"><span>Customer Reviews</span></a></li>
                                                    <li><a href="#questions"><span>Products Q&A</span></a></li>
                                                </ul>
                                                <div id="productInfo">
                                                    <div style="text-align: left; margin-top: 10px; padding-top: 15px">
                                                        <div class="prodDescTitle">
                                                            Features 
                                                        </div>
                                                        <div style="padding: 8px" class="prodDescContent">
                                                            <s:property value="part.features" escape="false"/>
                                                        </div>

                                                        <div class="prodDescTitle">
                                                            Specifications
                                                        </div>
                                                        <div style="padding: 8px" class="prodDescContent">
                                                            <s:property value="part.specifications" escape="false"/>
                                                        </div>

                                                        <div style="clear: both">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="parts" style="min-height: 300px">


                                                </div>
                                                <div id="docs" style="min-height: 300px">


                                                </div>
                                                <div id="reviews" style="min-height: 300px">
 
                                                    <div style="clear: both"></div>
                                                </div>
                                                <div id="questions" style="min-height: 300px">

                                                </div>
                                            </div>
                                            <div style="clear: both">
                                            </div>
                                          
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>

        </table>

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center" valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" valign="top"  class="footer"><table width="990" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="298" height="91" align="left">Copyright © 2012 Buy&amp;Sell, All rights reserved<br />
                                e-mail: <a href="#" class="footer">info@buy&amp;sell.com</a></td>
                            <td width="692" align="right"><a href="#" class="footer">About  Us</a> |   <a href="#" class="footer">Buy</a> |   <a href="#" class="footer">Sell</a> |   <a href="#" class="footer">Contact us</a> |   <a href="#" class="footer">Order Catalog</a><br />
                                <a href="#" class="footer">Site Map</a> |<a href="#" class="footer"> My Account</a> |   <a href="#" class="footer">Terms and Conditions of Sale</a> |<a href="#" class="footer"> Terms and Conditions of Use</a><br /></td>
                        </tr>
                    </table></td>
            </tr>
        </table>
    </body>
</html>
