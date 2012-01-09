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
                var mydata = ${broadcastJson};                
                jQuery("#broadcastList").jqGrid({
                    //                   url:'getInventoryList',
                    datatype: "localdata",
                    height: 250,
                    colNames:['Posted','Company','Country','Part #','Manufacturer', 'Condition', 'Qty','Price','Notes/Description'],                    
                    colModel:[
                        {name:'creationDate',index:'creationDate', width:200, align:"center"},                                                
                        {name:'companyString',index:'companyString', width:200, align:"center"},                                                                        
                        {name:'countryString',index:'countryString', width:200, align:"center"},                                                                                                
                        {name:'partNo',index:'partNo', width:100, align:"center"},                        
                        {name:'manufacturer',index:'manufacturer', width:200},
                        {name:'cond',index:'cond', width:100},                        
                        {name:'quantity',index:'quantity', width:80, align:"right",sorttype:"int", searchtype:"integer"},                        
                        {name:'price',index:'price', width:80, align:"right",sorttype:"float", searchtype:"number"},                                                
                        {name:'description',index:'description', width:200, sortable:"false"},
                    ],
                     gridComplete: function() {
                        var grid = jQuery("#east-grid");
                        var ids = grid.jqGrid('getDataIDs');
                        for (var i = 0; i < ids.length; i++) {
                            var rowId = ids[i];
                            var checkOut = "<input style='height:22px;width:75px;' " +
                                "type='button' value='Check Out' " +
                                "onclick=\"MyCheckOut('#east-grid'," +
                                rowId + ");\" />";
                            grid.jqGrid('setRowData', rowId, { action: checkOut });
                        }
                    },
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'partNo',
                    viewrecords: true,
                    caption: "Broadcasts"
                });
                for(var i=0;i<=mydata.length;i++)
                {
                    jQuery("#broadcastList").jqGrid('addRowData',i+1,mydata[i]);
                }
                jQuery("#broadcastList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
 
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
                                        <td height="34" colspan="2" align="center"><h1 id="listTitle">Broadcasts</h1></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><img src="images/under_line.jpg" width="553" height="16" alt="" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <table id="broadcastList"></table>
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
