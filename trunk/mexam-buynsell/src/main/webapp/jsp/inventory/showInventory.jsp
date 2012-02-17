<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="errortags" prefix="ch"%>
<%
    String hasError = "false";
    String errorRecordId = "";
    if (!(session.getAttribute("hasError") == null)) {
        hasError = session.getAttribute("hasError").toString();
        errorRecordId = session.getAttribute("errorRecordId").toString();
        session.setAttribute("hasError", false);
    }

%>
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
            var conditions = eval(${conditionJson});
            var errorRecordId = "<%=errorRecordId%>";
            $(document).ready(function () {
            <%if (hasError.equals("true")) {%>
                    errorHasOccured(errorRecordId);
            <%}%>
                    conditionsHtml="";
                    for (var i = 0; i< conditions.length; i++) {
                        conditionsHtml += '<option value="' + conditions[i].description + '">' + conditions[i].description + '</option>';
                    }
                    $("#condition").html(conditionsHtml);
                    //var mydata = ${inventoryJson};                
                    jQuery("#inventoryList").jqGrid({
                        url:'getInventoryList',
                        datatype: "json",
                        height: 250,
                        colNames:['Part No','Manufacturer','BSIN','UPC/EAN', 'Condition', 'Quantity','Price','Description'],
                        colModel:[
//                            {name:'id',index:'id', width:55,searchtype:"number", align:"center"},                                                
                            {name:'cell.partNo',index:'partNo',editable:true, width:100, align:"center"},                        
                            {name:'cell.manufacturer',editable:true,index:'manufacturer', width:150},
                            {name:'cell.bsin',index:'bsin', width:100,searchtype:"number"},                                                
                            {name:'cell.upc_ean',index:'upc_ean', width:100,searchtype:"number"},                                                
                            {name:'cell.cond',index:'cond',editable:true, width:100},                        
                            {name:'cell.quantity',index:'quantity',editable:true, width:75, align:"right",sorttype:"int", searchtype:"integer"},                        
                            {name:'cell.price',index:'price', width:75,editable:true, align:"right",sorttype:"float", searchtype:"number"},                                                
                            {name:'cell.description',index:'description',editable:true,edittype:"text", width:200, sortable:"false"},                    
                        ],
                        rowNum:10,
                        rowList:[10,20,30],
                        pager: '#pager',
                        sortname: 'partNo',
                        viewrecords: true,
                        caption: "Inventory",
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
                
                    //                var mydata = ${inventoryJson};                
                    //                jQuery("#inventoryList").jqGrid({
                    //                    //                   url:'getInventoryList',
                    //                    datatype: "localdata",
                    //                    height: 250,
                    //                    colNames:['Part No','Manufacturer', 'Condition', 'Quantity','Price','Description'],
                    //                    colModel:[
                    //                        {name:'partNo',index:'partNo', width:100, align:"center"},                        
                    //                        {name:'manufacturer',index:'manufacturer', width:200},
                    //                        {name:'cond',index:'cond', width:100},                        
                    //                        {name:'quantity',index:'quantity', width:80, align:"right",sorttype:"int", searchtype:"integer"},                        
                    //                        {name:'price',index:'price', width:80, align:"right",sorttype:"float", searchtype:"number"},                                                
                    //                        {name:'description',index:'description', width:200, sortable:"false"},
                    //                    ],
                    //                    rowNum:10,
                    //                    rowList:[10,20,30],
                    //                    pager: '#pager',
                    //                    sortname: 'partNo',
                    //                    viewrecords: true,
                    //                    caption: "Inventory"
                    //                });
                    //                for(var i=0;i<=mydata.length;i++)
                    //                {
                    //                    jQuery("#inventoryList").jqGrid('addRowData',i+1,mydata[i]);
                    //                }
                    jQuery("#inventoryList").jqGrid('navGrid','#pager',{edit:true,editfunc:getInventoryItem,add:false,del:false})
                    /*.navButtonAdd('#pager',{
                        caption:"Edit Record", 
                        onClickButton: function(id){ 
                            getInventoryItem(jQuery("#inventoryList").jqGrid('getGridParam','selrow'));
                            //alert(jQuery("#inventoryList").jqGrid('getGridParam','selrow'));
                            //testing();
                        }, 
                        position:"last"
                    });*/
                    $( ".ui-jqgrid-titlebar-close").hide();
                });
                function errorHasOccured(id)
                {
                    // getInventoryItem(id);
                    showDialog(true);
                }
            
                function getInventoryItem()
                {
                    var id = jQuery("#inventoryList").jqGrid('getGridParam','selrow');
                    $.ajax({
                        type:       "get",
                        url:        "getInventoryItem?itemId="+id,
                        data:       {},
                        success:    function(msg) {
                            var data = eval('('+msg+')');
                            jQuery("#id").val(data.id);
                            jQuery("#manufacturer").val(data.manufacturer);
                            jQuery("#partNo").val(data.partNo);                
                            jQuery("#price").val(data.price);    
                            jQuery("#quantity").val(data.quantity);                         
                            jQuery("#description").val(data.description);
                            var conds = jQuery("#condition option");
                            for(var i=0;i<conds.length;i++)
                            {
                                if($(conds[i]).val()==data.cond){
                                    $(conds[i]).attr("selected","selected");
                                    break;
                                }
                                
                            }
                            showDialog(false);
                        }
                    });
                }
                function showDialog(showError){ // if true show error msgs
                    if(showError){
                        jQuery(".fieldError").show()
                    }else{
                        jQuery(".fieldError").hide()
                    }
                                   
                    $("#dialog" ).dialog({
                        autoResize:true,
                        modal: true,
                        width:'auto'
                    });
                    getMfgs();
                    // $("#dialog").dialog();
                }       
                function getParts()
                {
                    $.ajax({
                        type:       "get",
                        url:        "getParts?manufacturer="+manufacturer,
                        data:       {},
                        success:    function(msg) {
                            var data = eval('('+msg+')');
                            setAutoComplete(data);
                        }
                    });
                }

                function getMfgs()
                {
                    $.ajax({
                        type:       "get",
                        url:        "getManufacturers",
                        data:       {},
                        success:    function(msg) {
                            var data = eval('('+msg+')');
                            setAutoCompleteMfgs(data);
                        }
                    });
                }


                function setAutoComplete(data)
                {
                    $( "#partNo" ).autocomplete({
                        minLength: 0,
                        source: data,
                        focus: function( event, ui ) {
                            $( "#partNo" ).val( ui.item.label );
                            return false;
                        },
                        select: function( event, ui ) {
                            $( "#partNo" ).val( ui.item.label );
                            return false;
                        }
                    })
                }
            
            
                function setAutoCompleteMfgs(data)
                {
                    $( "#manufacturer" ).autocomplete({
                        minLength: 0,
                        source: data,
                        focus: function( event, ui ) {
                            $( "#manufacturer" ).val( ui.item.value );
                            return false;
                        },
                        select: function( event, ui ) {
                            $( "#manufacturer" ).val( ui.item.value);
                            manufacturer = ui.item.value;
                            $("#partNo").val('')                    
                            getParts();
                            return false;
                        }
                    })
                }
                function submitForm()
                {
                    $("#formInventory").submit();
                }
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="sell"/>
        </jsp:include>

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Inventory List</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="listContainer" style="margin: auto; width: 900px;">
                    <table id="inventoryList"></table>
                    <div id="pager"></div>
                </div>
            </div>
        </div>
        <div id="dialog" title="Edit" style="display: none">
            <div style="margin:auto">
                <h1 style="width: 100%; text-align: center" id="dialogTitle">Edit Inventory</h1>
                <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
            </div>
            <div id="formContainder">
                <form id ="formInventory" method="POST" action="updateInventoryItem">
                    <div>
                        <input type="hidden" id="id" name="id" value="${id}"/>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Manufacturer:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;">                        
                                <div style="float: left;">    
                                    <input id="manufacturer" name="manufacturer" class="field_big" value="${manufacturer}"/>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="updateInventory_manufacturer"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Part #:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;">   
                                <div style="float: left;">    
                                    <input id="partNo" name="partNo" class="field_big" value="${partNo}"/>
                                </div>
                                <div style="float: left;" class="fieldError">                        
                                    <ch:errortag name="udpateInventory_partNo"></ch:errortag>
                                </div>
                                <div style="clear: both"></div> 

                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                Condition:
                            </div>                        
                            <div style="float: left; width: 48%; margin: 5px;">    
                                <div style="float: left;">    
                                    <select id="condition" name="condition" class="field_big" style="min-width: 20%" ></select>
                                </div>
                                <div style="float: left;" class="fieldError">  
                                    <ch:errortag name="udpateInventory_condition"></ch:errortag>
                                    <!--                                    <div style="float: left;" class="fieldError">                        
                                                                        </div>-->
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Price:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">      
                                    <div style="float: left;">    
                                        <input id="price" name="price" class="field_big" value="${price}"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">  
                                        <ch:errortag name="udpateInventory_price"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Quantity
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;"> 
                                    <div style="float: left;">    
                                        <input id="quantity" name="quantity" value="${quantity}" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="updateInventory_quantity"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Description/Notes
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">
                                    <div style="float: left;">    
                                        <textarea id="description" name="description" class="field_big" rows="3" style="height: 50px; min-width: 250px">${quantity}</textarea>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="updateInventory_description"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>     
                        </div>
                        <div style="width: 100px; margin: auto">
                            <a href="javascript:submitForm()" class="btn">Submit</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>
                    </div> 
                </form>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
