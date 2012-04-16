<%-- 
    Document   : addProduct
    Created on : Nov 4, 2011, 11:55:06 AM
    Author     : CodeHopper
--%>
<%@page import="com.mt.hibernate.entities.User"%>
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
        <title>Buy &amp; Sell - Dashboard</title>
        <style>
            .myClass{
                /*float:left;
                 border: 1px solid black;*/
                width:auto;
                height: 30%;
                padding:10px;
                margin:5px;
            }
            .submitBtn2{
                display:inline-block;
                line-height:35px;
                color:#B2B2B2;
                font-weight:bold;
                font-size:13px;
                text-shadow:0 1px 0 #fff;
                margin-top: 5px;
                border:1px solid #DFDFDF;
                
                -moz-border-radius:8px;
                -webkit-border-radius:8px;
                border-radius:8px;
                text-align: center;
                width: 50px;
                height: 37px;
                padding:0px;

            }


            .submitBtn2:hover {
                color:#333;
                border-color:#cacaca;
                background:#F8F8F8;
                text-align: center;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                // jQuery("#tabsLatest").tabs();
                jQuery("#tabsWeek").tabs();
                jQuery( ".accordion" ).accordion({
                    collapsible: true,
                    width:200
                });
                jQuery("#rfqsListReceivedLatest").jqGrid({
                    url:'getRFQsReceivedLatest',
                    datatype: "json",
                    colNames:['Received Date','Subject','Sent By','Company'],
                    colModel:[
                        {name:'cell.date',index:'creationDate', align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title',  sortable:true,formatter:isNewFormatter},
                        {name:'cell.senderName',index:'sender.firstName',  sortable:true,formatter:isNewFormatter},                        
                        {name:'cell.senderCompanyName',index:'sender.company.name', sortable:true,formatter:isNewFormatter}                        
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    emptyrecords:'No new RFQs received',
                    pager: '#pager_rfqsListReceivedLatest',
                    pgbuttons:false,
                    pginput:false,
                    width:700,
                    sortorder: "desc",
                    caption: "New RFQs Received",
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
                jQuery("#rfqsListReceivedLatest").jqGrid('navGrid','#pager_rfqsListReceivedLatest',{edit:false,add:false,del:false,search:false,refresh:false}).jqGrid('navButtonAdd','#pager_rfqsListReceivedLatest',{caption:"See All",onClickButton:function(){window.location="showRFQs";}});
                jQuery("#rfqsListReceivedWeek").jqGrid({
                    url:'getRFQsReceivedWeek',
                    datatype: "json",
                    colNames:['Received Date','Subject','Sent By','Company'],
                    colModel:[
                        {name:'cell.date',index:'creationDate', align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title',  sortable:true,formatter:isNewFormatter},
                        {name:'cell.senderName',index:'sender.firstName',  sortable:true,formatter:isNewFormatter},                        
                        {name:'cell.senderCompanyName',index:'sender.company.name', sortable:true,formatter:isNewFormatter}                        
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    emptyrecords:'No new RFQs received',
                    pager: '#pager_rfqsListReceivedWeek',
                    pgbuttons:false,
                    pginput:false,
                    sortorder: "desc",
                    caption: "RFQs Received Last Week",
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
                jQuery("#rfqsListReceivedWeek").jqGrid('navGrid','#pager_rfqsListReceivedWeek',{edit:false,add:false,del:false,search:false,refresh:false}).jqGrid('navButtonAdd','#pager_rfqsListReceivedWeek',{caption:"See All",onClickButton:function(){window.location="showRFQs";}});
                jQuery("#rfqsListSentLatest").jqGrid({
                    url:'getRFQsSentLatest',
                    datatype: "json",
                    colNames:['Date','Subject','Sent To'],
                    colModel:[
                        {name:'cell.date',index:'creationDate', width:200, align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title', width:200, sortable:true},
                        {name:'cell.receiverCompanyName',index:'receiver.name', width:200, sortable:true}
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    width:700,
                    pager: '#pager_rfqsListSentLatest',
                    pgbuttons:false,
                    pginput:false,
                    emptyrecords:'No new RFQs has been returned',
                    sortorder: "desc",
                    caption: "RFQs Returned",
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
                jQuery("#rfqsListSentLatest").jqGrid('navGrid','#pager_rfqsListSentLatest',{edit:false,add:false,del:false,search:false,refresh:false}).jqGrid('navButtonAdd','#pager_rfqsListSentLatest',{caption:"See All",onClickButton:function(){window.location="showRFQs";}});
                jQuery("#rfqsListSentWeek").jqGrid({
                    url:'getRFQsSentWeek',
                    datatype: "json",
                    colNames:['Date','Subject','Sent To'],
                    colModel:[
                        {name:'cell.date',index:'creationDate', width:200, align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title', width:200, sortable:true},
                        {name:'cell.receiverCompanyName',index:'receiver.name', width:200, sortable:true}
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    emptyrecords:'No new RFQs sent',
                    pager: '#pager_rfqsListSentWeek',
                    pgbuttons:false,
                    pginput:false,
                    sortorder: "desc",
                    caption: "RFQs Sent Last Week",
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
                jQuery("#rfqsListSentWeek").jqGrid('navGrid','#pager_rfqsListSentWeek',{edit:false,add:false,del:false,search:false,refresh:false}).jqGrid('navButtonAdd','#pager_rfqsListSentWeek',{caption:"See All",onClickButton:function(){window.location="showRFQs";}});
                jQuery("#messagesLatest").jqGrid({
                    url:'doNothing',
                    datatype: "json",
                    sortname: 'id',
                    viewrecords: true,
                    emptyrecords:'No new Messages',
                    pager: '#pager_messagesLatest',
                    pgbuttons:false,
                    pginput:false,
                    sortorder: "desc",
                    caption: "New Messages",
                    width: 700
                });
                jQuery("#messagesWeek").jqGrid({
                    url:'doNothing',
                    datatype: "json",
                    sortname: 'id',
                    viewrecords: true,
                    emptyrecords:'No Messages',
                    pager: '#pager_messagesWeek',
                    pgbuttons:false,
                    pginput:false,
                    sortorder: "desc",
                    caption: "Messages From Last Week",
                    width: 700
                });
                jQuery("#inventoryList").jqGrid({
                    url:'getInventoryListWeek',
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
                    emptyrecords:'None',
                    pager: '#pager_inventoryList',
                    pgbuttons:false,
                    pginput:false,
                    caption: "Inventory Added",
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
                jQuery("#inventoryList").jqGrid('navGrid','#pager_inventoryList',{edit:false,add:false,del:false,search:false,refresh:false}).jqGrid('navButtonAdd','#pager_inventoryList',{caption:"See All",onClickButton:function(){window.location="showInventory";}});
                jQuery("#vendorList").jqGrid({
                    url:'getMyVendorsListWeek',
                    datatype: "json",
                    editurl:'updateMyVendors',
                    colNames:['Name','Priority'],
                    colModel:[
                        {name:'cell.vendorName',index:'vendor.name', align:"center"},                        
                        {name:'priority',jsonmap:'cell.priority',index:'vendor.priority',width:75,align:"center"}
                    ],
                    sortname: 'id',
                    viewrecords: true,
                    emptyrecords:'None',
                    pager: '#pager_vendorList',
                    pgbuttons:false,
                    pginput:false,
                    sortorder: "asc",
                    caption: "Favorite Vendors Added",
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
                jQuery("#vendorList").jqGrid('navGrid','#pager_vendorList',{edit:false,add:false,del:false,search:false,refresh:false}).jqGrid('navButtonAdd','#pager_vendorList',{caption:"See All",onClickButton:function(){window.location="showVendors";}});
                function isNewFormatter (cellvalue, options, rowObject)
                {
                    if(rowObject.cell.isNew==true)
                        return "<b>"+cellvalue+"</b>";
                    else
                        return cellvalue;
                }
                /*$("#accordian div").click(function(){
                    $(this).slideDown('normal');
                });*/
            });
        
        
        </script>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="user"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;height: 100%" >
            <div style="float:left">
                <div class="accordion" style="width: 250px;padding-top: 20px">
                    <h3><a href="#">Search</a></h3>
                    <div>
                        <div>Search Parts:</div>
                        <div><input type="text"/></div>
                        <div style="text-align:center"><input type="button" class="submitBtn2" value="Go" /></div>
                    </div>
                </div>
                <div class="accordion" style="width: 250px;padding-top: 0px">
                    <h3><a href="#">Info</a></h3>
                    <div>
                        <div><b>Comapany</b>:</div>
                        <div><%= ((User) session.getAttribute("user")).getCompany().getName()%></div>
                        <div><b>Manager</b>:</div>
                        <div><%=((User) session.getAttribute("user")).getFirstName()%> <%=((User) session.getAttribute("user")).getLastName()%></div>
                        <div><b>Category</b>:</div>
                        <div><%=((User) session.getAttribute("user")).getCompany().getCompanyCategory()%></div>
                        <div><b>Location</b>:</div>
                        <div><%=((User) session.getAttribute("user")).getCompany().getCity()%>, <%=((User) session.getAttribute("user")).getCompany().getState().getName()%></div>
                        <div style="text-align: right;font-size: 10pt"><a href="#">Edit</a></div>
                        <hr/><br/>
                        <div>Total Inventory: <s:property value="totalInventory" /></div>
                        <div>Favorite Vendors: <s:property value="totalVendors" /></div>
                    </div>
                </div>
                <div class="accordion" style="width: 250px;padding-top:0px">
                    <h3><a href="#">Recent Activity</a></h3>
                    <div>
                        <div>New Inventory: <s:property value="latestInventory" /> </div>
                        <div>New Favorites: <s:property value="latestVendors" /> </div>
                        <div>New Messages: 0</div>
                        <div>New RFQ Received: <s:property value="latestRFQsReceived" /> </div>
                        <div>New RFQ Sent: <s:property value="latestRFQsSent" /></div>

                    </div>
                </div>
            </div>    
            <div style="float:left">
                <div id="title"> 
                    <div style="margin:auto">
                        <h3 style="width: 100%; text-align: center" id="listTitle">Latest Activity</h3>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="content">
                    <div>
                        <div class="myClass" style="padding-bottom:2px">
                            <table id="messagesLatest"></table>
                            <div id="pager_messagesLatest"></div>
                        </div> 
                        <div class="myClass" style="padding-top:0px">

                            <div id="tabsLatest" style="width: auto">

                                <div id="received" style="padding-bottom:7px;margin: auto;">
                                    <table id="rfqsListReceivedLatest"></table>
                                    <div id="pager_rfqsListReceivedLatest"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                                <div id="sent" style="margin: auto">
                                    <table id="rfqsListSentLatest"></table>
                                    <div id="pager_rfqsListSentLatest"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div style="clear:both"></div>
                    </div>
                </div>
                <div id="title"> 
                    <div style="margin:auto">
                        <h3 style="width: 100%; text-align: center" id="listTitle">Activity for Last 7 Days</h3>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="content">
                    <div>
                        <div class="myClass" style="float: left">
                            <table id="inventoryList"></table>
                            <div id="pager_inventoryList"></div>
                        </div> 
                        <div class="myClass" style="float: left">
                            <table id="vendorList"></table>
                            <div id="pager_vendorList"></div>
                        </div> 
                        <div style="clear:both"></div>
                    </div>
                    <div>
                        <div class="myClass">
                            <table id="messagesWeek"></table>
                            <div id="pager_messagesWeek" ></div>
                        </div> 
                        <div class="myClass">

                            <div id="tabsWeek" style="width: auto">
                                <ul>
                                    <li><a href="#received"><span>RFQ Received</span></a></li>
                                    <li><a href="#sent"><span>RFQ Sent</span></a></li>
                                </ul>
                                <div id="received" style="margin: auto">
                                    <table id="rfqsListReceivedWeek"></table>
                                    <div id="pager_rfqsListReceivedWeek"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                                <div id="sent" style="margin: auto">
                                    <table id="rfqsListSentWeek"></table>
                                    <div id="pager_rfqsListSentWeek"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div style="clear:both"></div>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
