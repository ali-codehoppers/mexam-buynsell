<%-- 
    Document   : viewVendor
    Created on : Feb 24, 2012, 12:14:22 PM
    Author     : Muaz
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

        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>
            #prodDesc
            {
                font-weight: bold!important;
                font-size: 1.5em!important;
                padding: 8px;
                color: #083152;
            }
            .heading{
                font-weight: bold!important;
                font-size: 1em!important;
                /*padding: 8px;*/
                color: #083152;
            }
            #prodLongDesc
            {
                font-size: 1.2em!important;
                padding: 8px;
                text-align:justify;
                font-size: 10pt!important;
            }

            .prodDescTitle
            {
                background-color: #4B4B4B;
                border-radius:4px;
                padding: 8px;
                color: #FFFFFF;
                font-weight: bold!important;
                font-size: 10pt!important;
            }

            .prodDescContent
            {
                font-size: 10pt!important;
            }
            #prodImageCont
            {
                margin-right: 20px;
                margin-bottom: 20px;
            }


            #gallery {
                background-color: #444;
                padding: 10px;
                width: 520px;
            }
            #gallery ul { list-style: none; }
            #gallery ul li { display: inline; }
            #gallery ul img {
                border: 5px solid #3e3e3e;
                border-width: 5px 5px 20px;
            }
            #gallery ul a:hover img {
                border: 5px solid #fff;
                border-width: 5px 5px 20px;
                color: #fff;
            }
            #gallery ul a:hover { color: #fff; }

            a.link:hover {
                color: black!important;
            }

        </style>

        <script type="text/javascript">
            var companyId = "<s:property value="companyId" />";
            $(document).ready(function () {
                jQuery("#inventoryList").jqGrid({
                    url:'getInventoryList?companyId='+companyId,
                    datatype: "json",
                    height: 250,
                    hidegrid:false,
                    colNames:['Part No','Manufacturer','BSIN','UPC/EAN', 'Condition', 'Quantity','Price','Description'],
                    colModel:[
                        //                            {name:'id',index:'id', width:55,searchtype:"number", align:"center"},                                                
                        {name:'cell.partNo',index:'partNo',editable:true, width:100, align:"center"},                        
                        {name:'cell.manufacturer',editable:true,index:'manufacturer', width:150},
                        {name:'cell.bsin',index:'bsin', width:100, align:"center"},                                                
                        {name:'cell.upc_ean',index:'upc_ean', width:100, align:"center"},                                                
                        {name:'cell.cond',index:'cond',editable:true, width:100, align:"center"},                        
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
                jQuery("#inventoryList").jqGrid('navGrid','#pager',{edit:true,editfunc:getInventoryItem,add:false,del:false})
                //alert(conditions);
                $("#tabs").tabs();
                $('#prodImageCont a').lightBox();
            });
 
            
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">

                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle"><s:property value="company.name" /></h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="prodDetailCont" style="margin-top: 10px">
                    <div id="prodImageCont" style="float: left">
                        <s:if test="part.images.get(0).id>0">
                            <a href="getImage?imageId=<s:property value='part.images.get(0).id' />&imageType=0" title="">
                                <img src="getImage?imageId=<s:property value='part.images.get(0).id' />&imageType=2"/>
                            </a>
                        </s:if>
                        <s:else>
                            <img src='images/no-product-image.jpg'/>
                        </s:else>
                    </div>

                    <div id="prodDescCont" style="float: left;width: 20%;">
                        <table>
                            <tr><td class="heading">Category</td></tr>
                            <tr><td><s:property value="company.companyCategory" /></td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td class="heading">Location</td></tr>
                            <tr>
                                <td><s:property value="company.address" /></td>
                            </tr>
                            <tr>
                                <td><s:property value="company.city" /></td>
                            </tr>
                            <tr>
                                <td><s:property value="company.state.name" /></td>
                            </tr>

                        </table>
                    </div>
                    <div id="prodDescCont" style="float: left;width: 20%;height:150px;padding-left:1%;border-left:1px dashed #E5E5E5">
                        <table>
                            <tr><td class="heading">Website</td></tr>
                            <tr>
                                <td>
                                    <s:if test="%{company.webAddress != ''}">
                                        <a class="link" href="http://<s:property value="company.webAddress" />" target="_blank"><s:property value="company.webAddress" /></a>
                                    </s:if>
                                    <s:else><span style="font-size:.75em">Not Provided</span></s:else>
                                </td>
                            </tr>
                            <tr><td class="heading">Contact Number</td></tr>
                            <tr>
                                <td>
                                    <s:if test="%{company.phoneNo != ''}">
                                        <s:property value="company.phoneNo" />
                                    </s:if>
                                    <s:else><span style="font-size:.75em">Not Provided</span></s:else>
                                </td>
                            </tr>
                            <tr><td class="heading">Fax Number</td></tr>
                            <tr>
                                <td>
                                    <s:if test="%{company.faxNo != ''}">
                                        <s:property value="company.faxNo" />
                                    </s:if>
                                    <s:else><span style="font-size:.75em">Not Provided</span></s:else>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td class="heading">Created On</td></tr>
                            <tr><td><s:date name="company.creationDate" format="dd-MMM-yyyy 'at' hh:mm a" /></td></tr>

                        </table>
                    </div>
                </div>
                <div style="clear: both">
                </div>
                <div>
                    <table id="inventoryList"></table>
                    <div id="pager"></div>
                </div>
                <div style="clear: both">
                </div>

                <div style="clear: both">
                </div>
            </div>

        </div>


        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
