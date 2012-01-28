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
                    url:'getVendorsList',
                    datatype: "json",
                    height: 250,
                    colNames:['ID','Name','Address','City','State','Phone','Fax'],
                    colModel:[
                        {name:'id',index:'id', width:55},                                                
                        {name:'cell.name',index:'name', width:150, align:"center",sortable:true},                        
                        {name:'cell.address',index:'address', width:300, sortable:"false",editable:"false"},
                        {name:'cell.city',index:'city', width:100, sortable:"false",editable:false},                        
                        {name:'cell.state.name',index:'state.name', width:100, sortable:"false",editable:false},                                                
                        {name:'cell.phoneNo',index:'phoneNo', width:100, sortable:"false",editable:false},                        
                        {name:'cell.faxNo',index:'faxNo', width:100, sortable:"false",editable:false}                                                                    
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
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jspf" >
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

                <div id="vendorListContainer" style="margin: auto; width: 905px;">
                    <table id="vendorList"></table>
                    <div id="pager"></div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
