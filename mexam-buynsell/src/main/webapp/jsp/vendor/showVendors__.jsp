<%-- 
    Document   : showInventory
    Created on : Nov 28, 2011, 11:39:44 AM
    Author     : AmierHaider
--%>

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

        <script type="text/javascript">
            jQuery(document).ready(function(){ 
                
                //                var mydata = eval('('+${vendorJson}+')');
                //var mydata = ${vendorJson};                
                //var mydata = ${getVendorsList};                     
                jQuery("#vendorList").jqGrid({
                    url:'getVendorsList',
                    datatype: "json",
                    height: 250,
                    colNames:['ID','Name','Address','City','State','Phone','Fax'],
                    colModel:[
                        {name:'id',index:'id', width:55},                                                
                        {name:'cell.name',index:'name', width:200, align:"center",sortable:true},                        
                        {name:'cell.address',index:'address', width:400, sortable:"false",editable:"false"},
                        {name:'cell.city',index:'city', width:150, sortable:"false",editable:false},                        
                        {name:'cell.state.name',index:'state.name', width:150, sortable:"false",editable:false},                                                
                        {name:'cell.phoneNo',index:'phoneNo', width:150, sortable:"false",editable:false},                        
                        {name:'cell.faxNo',index:'faxNo', width:150, sortable:"false",editable:false}                                                                    
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager',
                    sortname: 'name',
                    viewrecords: true,
                    sortorder: "desc",
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
             
                jQuery("#vendorList").jqGrid('navGrid','#pager',{edit:false,add:false,del:true});
            });
            
        </script>

        <title>JSP Page</title>
    </head>
    <body>
        <table id="vendorList"></table>
        <div id="pager"></div>



    </body>
</html>
