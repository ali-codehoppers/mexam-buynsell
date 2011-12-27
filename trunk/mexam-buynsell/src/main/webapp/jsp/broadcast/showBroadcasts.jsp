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
            jQuery(document).ready(function(){ 
                
                var mydata = ${broadcastJson};                
                jQuery("#broadcastList").jqGrid({
                    datatype: "localdata",
                    height: 250,
                    //colNames:['Posted','Comapany', 'Country', 'Type','Part #','Mfg','Condition','Price','Qty','Notes/Description'],
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
                    //                    alert("Something");
                }
                //                
                jQuery("#broadcastList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
            });
            
        </script>

        <title>JSP Page</title>
    </head>
    <body>
        <table id="broadcastList"></table>
        <div id="pager"></div>



    </body>
</html>
