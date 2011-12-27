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
                
//                var mydata = eval('('+${vendorJson}+')');
                var mydata = ${vendorJson};                
                jQuery("#vendorList").jqGrid({
 //                   url:'getInventoryList',
                    datatype: "localdata",
                    height: 250,
                    colNames:['Name','Notes'],
                    colModel:[
                        {name:'vendorName',index:'vendorName', width:200, align:"center"},                        
                        {name:'notes',index:'notes', width:400, sortable:"false"},
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'vendorName',
                    viewrecords: true,
                    caption: "Vendors"
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
                    jQuery("#vendorList").jqGrid('addRowData',i+1,mydata[i]);
//                    alert("Something");
                }
//                
                jQuery("#vendorList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
            });
            
        </script>

        <title>JSP Page</title>
    </head>
    <body>
        <table id="vendorList"></table>
        <div id="pager"></div>



    </body>
</html>
