<%-- 
    Document   : showInventory
    Created on : Nov 28, 2011, 11:39:44 AM
    Author     : AmierHaider
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
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

        <script type="text/javascript">
            
            function getParameterByName(name)
            {
                name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
                var regexS = "[\\?&]" + name + "=([^&#]*)";
                var regex = new RegExp(regexS);
                var results = regex.exec(window.location.href);
                if(results == null)
                    return "";
                else
                    return decodeURIComponent(results[1].replace(/\+/g, " "));
            }
            
            jQuery(document).ready(function(){ 
                
                jQuery("#rfqItemsList").jqGrid({
                    url:'getRFQItemsList?rfqId='+getParameterByName('rfqId'),
                    datatype: "json",
                    height: 250,
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
                //alert(${rfq});
                jQuery("#div_subject").html("Subject : ${rfq.title}");
                jQuery("#div_sender").html("Sender : ${rfq.sender.firstName}");                
                jQuery("#div_message").html("Message : ${rfq.message}");                         
                jQuery("#div_date").html("Date : ${rfq.creationDate}");                                         
            });
            
        </script>

        <title>JSP Page</title>
    </head>
    <body>


        <div id="div_date">

        </div>

        <div id="div_sender">

        </div>

        <div id="div_subject">

        </div>

        <div id="div_message">

        </div>


        <table id="rfqItemsList"></table>
        <div id="pager"></div>


    </body>
</html>
