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
                jQuery("#broadcastList").jqGrid({
                    url:'getMyBroadcastsList',
                    datatype: "json",
                    height: 250,
                    colNames:['Posted','Company','Country','Part #','Manufacturer', 'Condition', 'Qty','Price','Notes/Description'],                    
                    colModel:[
                        {name:'cell.creationDate',index:'creationDate', width:200, align:"center"},                                                
                        {name:'cell.companyString',index:'companyString', width:200, align:"center"},                                                                        
                        {name:'cell.countryString',index:'countryString', width:200, align:"center"},                                                                                                
                        {name:'cell.partNo',index:'partNo', width:100, align:"center"},                        
                        {name:'cell.manufacturer',index:'manufacturer', width:200},
                        {name:'cell.cond',index:'cond', width:100},                        
                        {name:'cell.quantity',index:'quantity', width:80, align:"right",sorttype:"int", searchtype:"integer"},                        
                        {name:'cell.price',index:'price', width:80, align:"right",sorttype:"float", searchtype:"number"},                                                
                        {name:'cell.description',index:'description', width:200, sortable:"false"},
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
                    caption: "Broadcasts",
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
                jQuery("#broadcastList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
 
            });
            
            
   
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jspf" >
            <jsp:param name="currentTab" value="broadcast"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px; width: 100%">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">My Broadcasts</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="listContainer" style="margin: auto; width: 80%">
                    <table id="broadcastList"></table>
                    <div id="pager"></div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
