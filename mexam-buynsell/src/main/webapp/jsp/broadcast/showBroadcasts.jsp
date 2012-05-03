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
                //var mydata = ${broadcastJson};
                $( "#radio" ).buttonset();   
                generateGrid("getBroadcastsList");
                
            });
            
            function generateGrid(url)
            {
                jQuery("#broadcastList").jqGrid('GridUnload');   
                jQuery("#broadcastList").jqGrid({
                    url:url,
                    datatype: "json",
                    height: 250,
                    colNames:['Posted','Company','Part #','Manufacturer', 'Condition', 'Qty','Price','Notes/Description'],                    
                    colModel:[
                        {name:'cell.creationDate',index:'creationDate', width:180, align:"center"},                                                
                        {name:'cell.companyString',index:'companyString', width:150, align:"center"},                                                                        
                        //                        {name:'cell.countryString',index:'countryString', width:120, align:"center"},                                                                                                
                        {name:'cell.partNo',index:'partNo', width:150, align:"center"},                        
                        {name:'cell.manufacturer',index:'manufacturer', width:150},
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
            }
            function testing(){
                $.ajax({
                    type:       "get",
                    url:        "getBroadcastsFavorite",
                    data:       {},
                    success:    function(msg) {                    
                        alert(msg);
                    }
                });
            }
            
   
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="broadcast"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px; width: 100%">
            <div id="content">
                <div style="text-align: center; width: 100%;margin-top: 25px;">
                    <div id="radio">
                        <input type="radio" id="radio1" name="radio" onclick="$('#search_bar').slideUp('slow');generateGrid('getBroadcastsList')" checked="checked" /><label for="radio1">From All</label>
                        <input type="radio" id="radio2" name="radio" onclick="$('#search_bar').slideUp('slow');generateGrid('getBroadcastsFavorite')" /><label for="radio2">From Favorites</label>
                        <input type="hidden" id="radio3" name="" onclick="$('#search_bar').slideDown('slow')" /><label for="radio3"></label>
                    </div>  
                </div>
                <div id="search_bar" style="text-align: center; width: 100%;margin-top: 10px;display: none">
                    <input type="text" class="search" style="width:150px;height: 22px;float:none;background-color: #D1D1D1" /> <a href="#" class="btn" style="float:none">Search</a>
                </div>
                <div style="">
                    <div id="title"> 
                        <div style="margin:auto">
                            <h1 style="width: 100%; text-align: center" id="listTitle">Broadcasts</h1>
                            <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                        </div>
                    </div>

                    <div id="listContainer" style="margin: auto; width: 1090px;">
                        <table id="broadcastList"></table>
                        <div id="pager"></div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
