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
            var vendorId=0;
            $(document).ready(function () {

                jQuery("#cartVendorList").jqGrid({
                    url:'getCartVendorsList',
                    datatype: "json",
                    height: 180,
                    colNames:['ID','Name','Address','City','State','Phone','Fax'],
                    colModel:[
                        {name:'id',index:'id', width:55},                                                
                        {name:'cell.name',index:'name', width:200, align:"center",sortable:true},                        
                        {name:'cell.address',index:'address', width:300, sortable:"false",editable:"false"},
                        {name:'cell.city',index:'city', width:100, sortable:"false",editable:false},                        
                        {name:'cell.state.name',index:'state.name', width:100, sortable:"false",editable:false},                                                
                        {name:'cell.phoneNo',index:'phoneNo', width:100, sortable:"false",editable:false},                        
                        {name:'cell.faxNo',index:'faxNo', width:100, sortable:"false",editable:false}                                                                    
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager_v',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "Vendors",
                    multiselect: false,
                    onSelectRow: function(ids) {
                        if(ids == null) {
                            ids=0;
                            if(jQuery("#cartList").jqGrid('getGridParam','records') >0 )
                            {
                                jQuery("#cartList").jqGrid('setGridParam',{url:"getCartVendorItemsList?vendorId="+ids,page:1});
                                jQuery("#cartList").jqGrid('setCaption',"Cart Items Detail")
                                .trigger('reloadGrid');
                                vendorId = ids;
                                jQuery("#sendRFQ").hide();
                            }
                        }
                        else {
                            jQuery("#cartList").jqGrid('setGridParam',{url:"getCartVendorItemsList?vendorId="+ids,page:1});
                            jQuery("#cartList").jqGrid('setCaption',"Cart Items Detail")
                            .trigger('reloadGrid');      
                            jQuery("#sendRFQ").show();                            
                            vendorId = ids;                                
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

                jQuery("#cartVendorList").jqGrid('navGrid','#pager_v',{edit:false,add:false,del:true});
                
                jQuery("#cartList").jqGrid({
                    url:'getCartVendorItemsList?vendorId=0',page:1,
                    datatype: "json",
                    height: 100,
                    colNames:['ID','Part No','Manufacturer','Price','Quantity'],
                    colModel:[
                        {name:'id',index:'id', width:55},                                                
                        {name:'cell.partNo',index:'partNo', width:200, align:"center",sortable:true},
                        {name:'cell.manufacturer',index:'manufacturer', width:200, align:"center",sortable:true},                        
                        {name:'cell.price',index:'price', width:200, align:"center",sortable:true},                        
                        {name:'cell.quantity',index:'quantity', width:200, align:"center",sortable:true}                        
                    ],
                    rowNum:5,
                    rowList:[5,10,15],
                    pager: '#pagerCart',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "Cart",
                    multiselect: true,
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
                jQuery("#cartList").jqGrid('navGrid','#pagerCart',{edit:false,add:false,del:true});
                
            });
                
            function sendRFQ(){
                var parts = jQuery("#cartList").jqGrid('getGridParam','selarrrow');
                $.ajax({
                    type:       "get",
                    url:        "sendRFQ",
                    data:       {vendorId: vendorId, parts:parts},
                    success:    function(msg) {
                        jQuery("#cartVendorList").trigger('reloadGrid');
                        jQuery("#cartList").trigger('reloadGrid');
                        alert("RFQ sent successfully.");
                    }
                });
                return false;
            }  
                
                
//            function sendRFQ(){
//                $.ajax({
//                    type:       "get",
//                    url:        "sendRFQ",
//                    data:       {vendorId: vendorId},
//                    success:    function(msg) {
//                        jQuery("#cartVendorList").trigger('reloadGrid');
//                        jQuery("#cartList").trigger('reloadGrid');
//                        alert("RFQ sent successfully.");
//                    }
//                });
//                return false;
//            }
                
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jspf" />
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Cart</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="vendorListContainer" style="margin: auto; width: 900px;">
                    <table id="cartVendorList"></table>
                    <div id="pager_v"></div>
                </div>
                <div id="vendorListContainer" style="margin: auto; width: 750px;">
                    <div style="margin-top: 30px"> </div>
                    <table id="cartList"></table>        
                    <div id="pagerCart"></div>
                </div>
                <div style="width: 100px; margin: auto; min-height: 50px">
                    <a id="sendRFQ" href="javascript:sendRFQ()" class="btn" style="display: none; margin-top: 30px; min-width: 200px">Send RFQ to selected Vendor</a>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
