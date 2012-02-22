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
            .ui-widget .ui-widget {
                font-size: 11px;
            }
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
                        {name:'cell.date',index:'creationDate', width:200, align:"center",sortable:true, formatter:isNewFormatter},                                                
                        {name:'cell.title',index:'title', width:200, sortable:true,formatter:isNewFormatter},
                        {name:'cell.senderName',index:'sender.firstName', width:200, sortable:true,formatter:isNewFormatter},                        
                        {name:'cell.senderCompanyName',index:'sender.company.name', width:200, sortable:true,formatter:isNewFormatter}                        
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager_r',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQs Received",
                    onSelectRow: function(ids) {
                        if(ids != null && ids>0) {
                            rfqId=ids;
                            getRFQ(ids,1);
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
                        {name:'cell.date',index:'creationDate', width:200, align:"center",sortable:true},                                                
                        {name:'cell.title',index:'title', width:200, sortable:true},
                        {name:'cell.receiverCompanyName',index:'receiver.name', width:200, sortable:true}
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager_s',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQs Sent",
                    onSelectRow: function(ids) {
                        if(ids != null && ids>0) {
                            rfqId=ids;
                            getRFQ(ids,2);
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
             
             
                function isNewFormatter (cellvalue, options, rowObject)
                {
                    if(rowObject.cell.isNew==true)
                        return "<b>"+cellvalue+"</b>";
                    else
                        return cellvalue;
                }

             
                jQuery("#rfqsListSent").jqGrid('navGrid','#pager_s',{edit:false,add:false,del:true});
                
                jQuery("#rfqItemsList").jqGrid({
                    url:'getRFQItemsList?rfqId='+rfqId,
                    datatype: "json",
                    height: 200,
                    colNames:['Part No','Manufacturer','BSIN','UPC/EAN','Condition','Price','Quantity'],
                    colModel:[
                        {name:'cell.partNo',index:'inventory.partNo', width:125, align:"center",sortable:true},
                        {name:'cell.manufacturer',index:'inventory.manufacturer', width:180, align:"center",sortable:true}, 
                        {name:'cell.bsin',index:'bsin', width:125, align:"center"},                                                
                        {name:'cell.upc_ean',index:'upc_ean', width:125, align:"center"},                                                
                        {name:'cell.cond',index:'cond', width:100, align:"center",sortable:true},                        
                        {name:'cell.price',index:'price', width:120, align:"center",sortable:true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength: 30}},                        
                        {name:'cell.quantity',index:'quantity', width:120, align:"center",sortable:true}                        
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'id',
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
                $( ".ui-jqgrid-titlebar-close").hide();
            });
  
            function getRFQ(id,caller)
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
                        jQuery("#div_sentTo").html(data.sentTo);
                        if(caller==1)
                        {
                            setIsRead(id,true);
                            jQuery("#sentToCont").hide();
                            jQuery("#senderCont").show();
                            jQuery("#senderCompanyCont").show();
                        }
                        else
                        {
                            jQuery("#sentToCont").show();
                            jQuery("#senderCont").hide();
                            jQuery("#senderCompanyCont").hide();
                        }
                    }
                });
            }
            
            function setIsRead(id,val)
            {
                $.ajax({
                    type:       "get",
                    url:        "setRFQIsRead",
                    data:       {rfqId:id, value:val},
                    success:    function(msg) {
                        jQuery("#rfqsListReceived").trigger('reloadGrid');
                        jQuery("#rfqsListSent").trigger('reloadGrid');
                    }
                });
            }
            
  
            
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="rfq"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">RFQs</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="tabs" style="width: auto">
                    <ul>
                        <li><a href="#received"><span>RFQ Received</span></a></li>
                        <li><a href="#sent"><span>RFQ Sent</span></a></li>
                    </ul>
                    <div id="received" style="margin: auto">
                        <table id="rfqsListReceived"></table>
                        <div id="pager_r"></div>
                        <div style="clear: both">
                        </div>
                    </div>
                    <div id="sent" style="margin: auto">
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
                        <h1 style="width: 100%; text-align: center" id="dialogTitle">RFQ</h1>
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

                    <div style="margin-top: 10px; width: 50%; float: left" id="sentToCont">
                        <div style="float: left; width: 20%">
                            <h3 style="font: normal 18px 'Trebuchet MS'; color: #444;margin: auto">Sent To : </h3>
                        </div>
                        <div style="width: 80%; text-align: left">
                            <h3 id="div_sentTo" style="font: normal 16px 'Trebuchet MS'; color: #444;margin: auto"></h3>
                        </div>
                        <div style="clear: both"></div>
                    </div>


                    <div style="margin-top: 10px; width: 50%; float: left" id="senderCont">
                        <div style="float: left; width: 20%">
                            <h3 style="font: normal 18px 'Trebuchet MS'; color: #444;margin: auto">Sender : </h3>
                        </div>
                        <div style="width: 80%; text-align: left">
                            <h3 id="div_sender" style="font: normal 16px 'Trebuchet MS'; color: #444;margin: auto"></h3>
                        </div>
                        <div style="clear: both"></div>
                    </div>

                    <div style="margin-top: 10px; width: 50%; float: left" id="senderCompanyCont">
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
            </div>

        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
