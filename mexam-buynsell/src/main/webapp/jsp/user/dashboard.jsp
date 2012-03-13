<%-- 
    Document   : addProduct
    Created on : Nov 4, 2011, 11:55:06 AM
    Author     : CodeHopper
--%>

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
        <title>Dashboard</title>
        <style>
            .myClass{
                /*float:left;
                 border: 1px solid black;*/
                width:auto;
                height: 30%;
                padding:10px;
                margin:5px;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                jQuery("#tabs").tabs();
                jQuery( "#accordion" ).accordion({
                    collapsible: true,
                    width:200
                });
                jQuery("#rfqsListReceived").jqGrid({
                    url:'getRFQsReceived',
                    datatype: "json",
                    //colNames:['PartNo','Name','Quantity','Price'],
                    colNames:['Received Date','Subject','Sent By','Company'],
                    colModel:[
                        {name:'cell.date',index:'creationDate', align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title',  sortable:true,formatter:isNewFormatter},
                        {name:'cell.senderName',index:'sender.firstName',  sortable:true,formatter:isNewFormatter},                        
                        {name:'cell.senderCompanyName',index:'sender.company.name', sortable:true,formatter:isNewFormatter}                        
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQs Received",
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
                jQuery("#rfqsListSent").jqGrid({
                    url:'getRFQsSent',
                    datatype: "json",
                    //colNames:['PartNo','Name','Quantity','Price'],
                    colNames:['Date','Subject','Sent To'],
                    colModel:[
                        {name:'cell.date',index:'creationDate', width:200, align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title', width:200, sortable:true},
                        {name:'cell.receiverCompanyName',index:'receiver.name', width:200, sortable:true}
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQs Sent",
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
                jQuery("#messages").jqGrid({
                    url:'',
                 
                    datatype: "json",
                    sortname: 'id',
                    viewrecords: true,
                    emptyrecords:'No new messages',
                    sortorder: "desc",
                    caption: "Messages",
                    width: 700
                });
                jQuery("#inventoryList").jqGrid({
                    url:'getInventoryList',
                    datatype: "json",
                    colNames:['Part No','Manufacturer','Condition', 'Quantity'],
                    colModel:[
                        // {name:'cell.id',index:'id', width:55,searchtype:"number", align:"center"},                                                
                        {name:'cell.partNo',index:'partNo',editable:true, align:"center",align:"center"},                        
                        {name:'cell.manufacturer',editable:true,index:'manufacturer',align:"center"},                                               
                        {name:'cell.cond',index:'cond',editable:true, align:"center",width:75},                        
                        {name:'cell.quantity',index:'quantity',editable:true, align:"center",width:75,sorttype:"int", searchtype:"integer"}                      
                      
                    ],
                    sortname: 'partNo',
                    viewrecords: true,
                    caption: "Inventory",
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
                jQuery("#vendorList").jqGrid({
                    url:'getMyVendorsList',
                    datatype: "json",
                    editurl:'updateMyVendors',
                    colNames:['Name','Priority'],
                    colModel:[
                        {name:'cell.vendorName',index:'vendor.name', align:"center"},                        
                        {name:'priority',jsonmap:'cell.priority',index:'vendor.priority',width:75,align:"center"}
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "asc",
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
             
                function isNewFormatter (cellvalue, options, rowObject)
                {
                    if(rowObject.cell.isNew==true)
                        return "<b>"+cellvalue+"</b>";
                    else
                        return cellvalue;
                }
                $("#accordian div").click(function(){
                    $(this).slideDown('normal');
                });
            });
        
        
        </script>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <div id="container" class="container" style="min-height: 335px;height: 100%" >
            <div id="accordion" style="float:left;width: 250px;padding-top: 20px">
                <h3><a href="#">First header</a></h3>
                <div>
                    <div>Inventory Added</div>
                    <div>Vendor Added</div>
                    <div>Messages</div>
                    <div>RFQ Sent</div>
                    <div>RFQ Received</div>
                </div>
            </div>

            <div id="content" style="float:left" >
                <div>
                    <div class="myClass" style="float: left"><table id="inventoryList"></table></div> 
                    <div class="myClass" style="float: left"><table id="vendorList"></table></div> 
                    <div style="clear:both"></div>
                </div>
                <div>
                    <div class="myClass">
                        <table id="messages"></table>
                    </div> 
                    <div class="myClass">

                        <div id="tabs" style="width: auto">
                            <ul>
                                <li><a href="#received"><span>RFQ Received</span></a></li>
                                <li><a href="#sent"><span>RFQ Sent</span></a></li>
                            </ul>
                            <div id="received" style="margin: auto">
                                <table id="rfqsListReceived"></table>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div id="sent" style="margin: auto">
                                <table id="rfqsListSent"></table>
                                <div style="clear: both">
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div style="clear:both"></div>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
