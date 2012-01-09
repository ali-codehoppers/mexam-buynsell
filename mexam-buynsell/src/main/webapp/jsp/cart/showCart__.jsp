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
            var vendorId=0;
            jQuery(document).ready(function(){ 
                jQuery("#cartList").jqGrid({
                    url:'getCartItems',
                    datatype: "json",
                    height: 250,
                    //colNames:['PartNo','Name','Quantity','Price'],
                    colNames:['ID','Part No','Manufacturer','Price','Quantity'],
                    colModel:[
                        {name:'id',index:'id', width:55},                                                
                        {name:'cell.partNo',index:'partNo', width:200, align:"center",sortable:true},
                        {name:'cell.manufacturer',index:'manufacturer', width:200, align:"center",sortable:true},                        
                        {name:'cell.price',index:'price', width:200, align:"center",sortable:true},                        
                        {name:'cell.quantity',index:'quantity', width:200, align:"center",sortable:true}                        
                        //{name:'cell.address',index:'address', width:400, sortable:"false",editable:"false"},
                        //{name:'cell.city',index:'city', width:150, sortable:"false",editable:false},                        
                        //{name:'cell.state.name',index:'state.name', width:150, sortable:"false",editable:false},                                                
                        //{name:'cell.phoneNo',index:'phoneNo', width:150, sortable:"false",editable:false},                        
                        //{name:'cell.faxNo',index:'faxNo', width:150, sortable:"false",editable:false}                                                                    
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "Cart",
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
             
                jQuery("#cartList").jqGrid('navGrid','#pager',{edit:false,add:false,del:true});
                
                
                jQuery("#cartVendorList").jqGrid({
                    url:'getCartVendorsList',
                    datatype: "json",
                    height: 250,
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
                            if(jQuery("#cartList_d").jqGrid('getGridParam','records') >0 )
                            {
                                jQuery("#cartList_d").jqGrid('setGridParam',{url:"getCartVendorItemsList?vendorId="+ids,page:1});
                                jQuery("#cartList_d").jqGrid('setCaption',"Cart Items Detail: "+ids)
                                .trigger('reloadGrid');
                                vendorId = ids;
                                jQuery("#sendRFQ").hide();
                            }
                        }
                        else {
                            jQuery("#cartList_d").jqGrid('setGridParam',{url:"getCartVendorItemsList?vendorId="+ids,page:1});
                            jQuery("#cartList_d").jqGrid('setCaption',"Cart Items Detail: "+ids)
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
                
                jQuery("#cartList_d").jqGrid({
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
                    pager: '#pager_d',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "Cart",
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
                jQuery("#cartList_d").jqGrid('navGrid','#pager_d',{edit:false,add:false,del:true});
                
                
                
            });
            
            function sendRFQ(){
                alert("Vendor ID = "+vendorId);
                $.ajax({
                    type:       "get",
                    url:        "sendRFQ",
                    data:       {vendorId: vendorId},
                    success:    function(msg) {
                        jQuery("#cartVendorList").trigger('reloadGrid');
                        jQuery("#cartList_d").trigger('reloadGrid');
                        alert("Sucess "+msg);
                    }
                });
                return false;
                
                
            }
            
        </script>

        <title>JSP Page</title>
    </head>
    <body>
        <!--       <table id="cartList"></table>
                        <div id="pager"></div>
        -->
        <table id="cartVendorList"></table>
        <div id="pager_v"></div>
        <table id="cartList_d"></table>        
        <div id="pager_d"></div>

        <button id="sendRFQ" onclick="sendRFQ()" value="Send RFQ" text="Send RFQ" style="display:none">Send RFQ</button>

    </body>
</html>
