<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mt.actions.Inventory.UploadLog"%>
<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="windows-1252"
    %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Showcase</title>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <script type="text/javascript" src="js/grid/i18n/grid.locale-en.js"></script>                                
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>                

        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <script>
            var testing = eval(${uploadLogJson});
            // alert(${uploadLogJson});
            $(document).ready(function(){
                jQuery("#inventoryList").jqGrid({
                    datastr:${uploadLogJson},
                    datatype: "jsonstring",
                    height: 250,
                    colNames:['Manufacturer','Part No','Condition','Status'],
                    colModel:[
                        {name:'cell.manufacturer',label:'manufacturer', width:200},
                        {name:'cell.partNo',label:'partNo', width:100, align:"center"},                        
                        {name:'cell.condition',label:'condition', width:100, align:"center"},                        
                        {name:'cell.status',label:'status', width:200, sortable:"false",formatter:statusFormatter},              
                    ],
                    rowNum:-1,
                    //rowList:[10,20,30],
                    pager: '#pager',
                    viewrecords: true,
                    caption: "Uploaded Inventory Summary",
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
                jQuery("#inventoryList").jqGrid('navGrid','#pager',{edit:false,add:false,del:false,pgbuttons:false});
            });
            function statusFormatter(cellvalue, options, rowObject)
            {
                  if(cellvalue == "Inventory Added"){
                      return "<span style='color:green'>"+cellvalue+"</span>";
                  }else if(cellvalue == "Inventory Updated"){
                      return "<span style='color:blue'>"+cellvalue+"</span>";
                  }else if(cellvalue == "Error in Data"){
                      return "<span style='color:red'>"+cellvalue+"</span>";
                  }
                      
            }
        </script>
    </head>

    <body>

        <jsp:include page="../common/header.jspf" >
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

                <div id="listContainer" style="margin: auto; width: 750px;">
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
        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
