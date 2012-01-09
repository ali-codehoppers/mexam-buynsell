<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <script type="text/javascript" src="js/grid/i18n/grid.locale-en.js"></script>                                
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>                

        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>

        </style>

        <script type="text/javascript">
            $(document).ready(function () {
               jQuery("#vendorList").jqGrid({
                    url:'getVendorsList',
                    datatype: "json",
                    height: 250,
                    colNames:['ID','Name','Address','City','State','Phone','Fax'],
                    colModel:[
                        {name:'id',index:'id', width:55},                                                
                        {name:'cell.name',index:'name', width:200, align:"center",sortable:true},                        
                        {name:'cell.address',index:'address', width:400, sortable:"false",editable:"false"},
                        {name:'cell.city',index:'city', width:150, sortable:"false",editable:false},                        
                        {name:'cell.state.name',index:'state.name', width:150, sortable:"false",editable:false},                                                
                        {name:'cell.phoneNo',index:'phoneNo', width:150, sortable:"false",editable:false},                        
                        {name:'cell.faxNo',index:'faxNo', width:150, sortable:"false",editable:false}                                                                    
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "Vendors",
                    jsonReader : { 
                         root: "rows", 
                        page: "page", 
                        total: "total", 
                        records: "records", 
                        repeatitems: false, 
                        cell: "cell", 
                        id: "id"
                    }
                });
                jQuery("#vendorList").jqGrid('navGrid','#pager',{edit:false,add:false,del:true});
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
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="34" colspan="2" align="center"><h1 id="listTitle">Vendors</h1></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><img src="images/under_line.jpg" width="553" height="16" alt="" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <table id="vendorList"></table>
                                            <div id="pager"></div>
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
                <td align="center" valign="top"  class="footer">
                    <table width="990" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="298" height="91" align="left">Copyright © 2012 Buy&amp;Sell, All rights reserved<br />
                                e-mail: <a href="#" class="footer">info@buy&amp;sell.com</a></td>
                            <td width="692" align="right"><a href="#" class="footer">About  Us</a> |   <a href="#" class="footer">Buy</a> |   <a href="#" class="footer">Sell</a> |   <a href="#" class="footer">Contact us</a> |   <a href="#" class="footer">Order Catalog</a><br />
                                <a href="#" class="footer">Site Map</a> |<a href="#" class="footer"> My Account</a> |   <a href="#" class="footer">Terms and Conditions of Sale</a> |<a href="#" class="footer"> Terms and Conditions of Use</a><br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
