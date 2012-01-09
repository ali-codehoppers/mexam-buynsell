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
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <script type="text/javascript" src="js/grid/i18n/grid.locale-en.js"></script>                                
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>                

        <style>

        </style>

        <script type="text/javascript">

            var rfqId=0;
            $(document).ready(function () {
                $("#tabs").tabs();
                jQuery("#rfqsListReceived").jqGrid({
                    url:'getRFQsReceived',
                    datatype: "json",
                    height: 250,
                    //colNames:['PartNo','Name','Quantity','Price'],
                    colNames:['Received Date','Subject','Sent By','Company'],
                    colModel:[
                        {name:'cell.date',index:'date', width:200, align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title', width:200, sortable:true},
                        {name:'cell.senderName',index:'senderName', width:200, sortable:true},                        
                        {name:'cell.senderCompanyName',index:'senderCompanyName', width:200, sortable:true}                        
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager_r',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQs Received",
                    onSelectRow: function(ids) {
                        if(ids != null && ids>0) {
                            rfqId=ids;
                            getRFQ(ids);
                            jQuery("#rfqItemsList").jqGrid('setGridParam',{url:'getRFQItemsList?rfqId='+rfqId,page:1});
                            jQuery("#rfqItemsList").trigger('reloadGrid');
                            $( "#dialog" ).dialog( "open" );
                        }
                    },
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
             
                jQuery("#rfqsListReceived").jqGrid('navGrid','#pager_r',{edit:false,add:false,del:true});
  
  
                jQuery("#rfqsListSent").jqGrid({
                    url:'getRFQsSent',
                    datatype: "json",
                    height: 250,
                    //colNames:['PartNo','Name','Quantity','Price'],
                    colNames:['Date','Subject','Sent To'],
                    colModel:[
                        {name:'cell.date',index:'date', width:200, align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title', width:200, sortable:true},
                        {name:'cell.receiverCompanyName',index:'receiverCompanyName', width:200, sortable:true}
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager_s',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQs Sent",
                    onSelectRow: function(ids) {
                        if(ids != null && ids>0) {
                            rfqId=ids;
                            getRFQ(ids);
                            jQuery("#rfqItemsList").jqGrid('setGridParam',{url:'getRFQItemsList?rfqId='+rfqId,page:1});
                            jQuery("#rfqItemsList").trigger('reloadGrid');
                            $( "#dialog" ).dialog( "open" );
                        }
                    },
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
             
                jQuery("#rfqsListSent").jqGrid('navGrid','#pager_s',{edit:false,add:false,del:true});
                
                jQuery("#rfqItemsList").jqGrid({
                    url:'getRFQItemsList?rfqId='+rfqId,
                    datatype: "json",
                    height: 200,
                    colNames:['ID','Part No','Manufacturer','Price','Quantity'],
                    colModel:[
                        {name:'id',index:'id', width:55,align:"center"},                                                
                        {name:'cell.partNo',index:'partNo', width:200, align:"center",sortable:true},
                        {name:'cell.manufacturer',index:'manufacturer', width:200, align:"center",sortable:true},                        
                        {name:'cell.price',index:'price', width:200, align:"center",sortable:true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength: 30}},                        
                        {name:'cell.quantity',index:'quantity', width:200, align:"center",sortable:true}                        
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQ Items",
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
                jQuery("#rfqItemsList").jqGrid('navGrid','#pager',{edit:true,add:false,del:true});
                
                
                $( "#dialog" ).dialog({
                    autoResize:true,
                    autoOpen: false,
                    modal: true,
                    width:'auto'
                });
               
            });
  
            function getRFQ(id)
            {
                $.ajax({
                    type:       "get",
                    url:        "getRFQ?rfqId="+id,
                    data:       {},
                    success:    function(msg) {
                        var data = eval('('+msg+')');
                        jQuery("#div_subject").html(data.title);
                        jQuery("#div_sender").html(data.senderName);                
                        jQuery("#div_senderCompany").html(data.senderCompanyName);                                        
                        jQuery("#div_message").html(data.message);                         
                        jQuery("#div_date").html(data.date);        
                    }
                });
            }
            
  
            
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
                                </form>
                            </td>
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
                                        <td height="34" colspan="2" align="center"><h1 id="listTitle">RFQs</h1></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><img src="images/under_line.jpg" width="553" height="16" alt="" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <div id="tabs" style="width: auto">
                                                <ul>
                                                    <li><a href="#received"><span>RFQ Received</span></a></li>
                                                    <li><a href="#sent"><span>RFQ Sent</span></a></li>
                                                </ul>
                                                <div id="received">
                                                    <table id="rfqsListReceived"></table>
                                                    <div id="pager_r"></div>
                                                    <div style="clear: both">
                                                    </div>
                                                </div>
                                                <div id="sent">
                                                    <table id="rfqsListSent"></table>
                                                    <div id="pager_s"></div>
                                                    <div style="clear: both">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="clear: both">
                                            </div>

                                            <div id="dialog" title="RFQ">
                                                <div style="margin:auto">
                                                    <h1 style="width: 100%; text-align: center" id="listTitle">RFQ</h1>
                                                    <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                                                </div>
                                                <div>
                                                    <div style="float: left; width: 10%">
                                                        <h3 style="font: normal 18px 'Trebuchet MS'; color: #444; margin: auto">Date : </h3>
                                                    </div>
                                                    <div style="width: 70%; text-align: left">
                                                        <h3 id="div_date" style="font: normal 16px 'Trebuchet MS'; color: #444; margin: auto"></h3>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </div>
                                                
                                                <div style="margin-top: 10px; width: 50%; float: left">
                                                    <div style="float: left; width: 20%">
                                                        <h3 style="font: normal 18px 'Trebuchet MS'; color: #444;margin: auto">Sender : </h3>
                                                    </div>
                                                    <div style="width: 80%; text-align: left">
                                                        <h3 id="div_sender" style="font: normal 16px 'Trebuchet MS'; color: #444;margin: auto"></h3>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </div>

                                                <div style="margin-top: 10px; width: 50%; float: left">
                                                    <div style="float: left; width: 22%">
                                                        <h3 style="font: normal 18px 'Trebuchet MS'; color: #444;margin: auto">Company : </h3>
                                                    </div>
                                                    <div style="width: 78%; text-align: left">
                                                        <h3 id="div_senderCompany" style="font: normal 16px 'Trebuchet MS'; color: #444;margin: auto"></h3>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <div style="clear: both"></div>

                                                <div style="margin-top: 15px">
                                                    <div style="float: left; width: 10%">
                                                        <h3 style="font: normal 18px 'Trebuchet MS'; color: #444;margin: auto">Subject : </h3>
                                                    </div>
                                                    <div style="width: 78%; text-align: left">
                                                        <h3 id="div_subject" style="font: normal 16px 'Trebuchet MS'; color: #444;margin: auto"></h3>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </div>

                                                <div style="margin-top: 15px; margin-bottom: 30px">
                                                    <div style="float: left; width: 10%">
                                                        <h3 style="font: normal 18px 'Trebuchet MS'; color: #444;margin: auto">Message : </h3>
                                                    </div>
                                                    <div>
                                                        <p id="div_message" style="font: normal 16px 'Trebuchet MS'; color: #444;margin: auto"></p>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </div>


                                                <table id="rfqItemsList"></table>
                                                <div id="pager"></div>
                                                <div style="clear: both">
                                                </div>
                                                <!--                                                <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>-->
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
