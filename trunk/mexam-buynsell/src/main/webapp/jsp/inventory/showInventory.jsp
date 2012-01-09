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
                for(var i=0;i<=mydata.length;i++)
                {
                    jQuery("#inventoryList").jqGrid('addRowData',i+1,mydata[i]);
                }
                jQuery("#inventoryList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
 
            });
            
            
   
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jspf" />

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Inventory List</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="listContainer" style="margin: auto; width: 750px;">
                    <table id="inventoryList"></table>
                    <div id="pager"></div>
                </div>
                
            </div>
        </div>
        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
