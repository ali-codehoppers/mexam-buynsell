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
                jQuery("#vendorList").jqGrid({
                    url:'getMyVendorsList',
                    datatype: "json",
                    height: 250,
                    colNames:['ID','Name','Notes'],
                    colModel:[
                        {name:'id',index:'id', width:55,searchtype:"number"},          
                        {name:'cell.vendorName',index:'vendor.name', width:200, align:"center"},                        
                        {name:'cell.notes',index:'notes', width:400, sortable:"false"},
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
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
                jQuery("#vendorList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
                
                
                //                var mydata = ${vendorJson};                
                //                jQuery("#vendorList").jqGrid({
                //                    //                   url:'getInventoryList',
                //                    datatype: "localdata",
                //                    height: 250,
                //                    colNames:['Name','Notes'],
                //                    colModel:[
                //                        {name:'vendorName',index:'vendorName', width:200, align:"center"},                        
                //                        {name:'notes',index:'notes', width:400, sortable:"false"},
                //                    ],
                //                    rowNum:10,
                //                    rowList:[10,20,30],
                //                    pager: '#pager',
                //                    sortname: 'vendorName',
                //                    viewrecords: true,
                //                    caption: "Vendors"
                //                });
                //                for(var i=0;i<=mydata.length;i++)
                //                {
                //                    jQuery("#vendorList").jqGrid('addRowData',i+1,mydata[i]);
                //                }
                //                //                
                //                jQuery("#vendorList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
 
            });
            
            
   
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="vendor"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">My Vendors</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="vendorListContainer" style="margin: auto; width: 600px;">
                    <table id="vendorList"></table>
                    <div id="pager"></div>
                </div>

            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
