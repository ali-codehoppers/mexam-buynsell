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
                
                //                var mydata = eval('('+${inventoryJson}+')');
                var mydata = ${inventoryJson};                
                jQuery("#inventoryList").jqGrid({
                    //                   url:'getInventoryList',
                    datatype: "localdata",
                    height: 250,
                    colNames:['Part No','Manufacturer', 'Condition', 'Quantity','Price','Description'],
                    colModel:[
                        {name:'partNo',index:'partNo', width:100, align:"center"},                        
                        {name:'manufacturer',index:'manufacturer', width:200},
                        {name:'cond',index:'cond', width:100},                        
                        {name:'quantity',index:'quantity', width:80, align:"right",sorttype:"int", searchtype:"integer"},                        
                        {name:'price',index:'price', width:80, align:"right",sorttype:"float", searchtype:"number"},                                                
                        {name:'description',index:'description', width:200, sortable:"false"},
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'partNo',
                    viewrecords: true,
                    caption: "Inventory"
                });
                //                var mydata = [
                //                    {id:"1",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
                //                    {id:"2",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
                //                    {id:"3",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
                //                    {id:"4",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
                //                    {id:"5",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
                //                    {id:"6",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
                //                    {id:"7",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
                //                    {id:"8",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
                //                    {id:"9",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"}
                //                ];
                for(var i=0;i<=mydata.length;i++)
                {
                    jQuery("#inventoryList").jqGrid('addRowData',i+1,mydata[i]);
                    //                    alert("Something");
                }

                //                
                jQuery("#inventoryList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
            });
            
        </script>

        <title>JSP Page</title>
    </head>
    <body>
        <table id="inventoryList"></table>
        <div id="pager"></div>



    </body>
</html>
