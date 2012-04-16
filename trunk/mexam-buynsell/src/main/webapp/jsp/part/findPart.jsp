<%-- 
    Document   : seachPart
    Created on : Nov 28, 2011, 11:29:09 AM
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
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>
            .alignField{
                float: left; width:70%; margin: 5px; text-align: left;
            }
            .field_big{
                font-size: 20px; height: 25px; padding: 5px; min-width: 500px;  border-radius:8px;
            }
            .searchBox
            {
                margin: 5px;
                color: #000;
                background-color:#DDDDDD;
                border: 1px solid #999999;
            }

            .searchBox_Top
            {
                padding: 10px;
            }

            .searchBox_Image
            {
                height: auto;
                width: 125px;
                padding: 0px;
                margin: 0px
            }
            
            a.dark:hover{
                color:#666666;
                text-decoration: underline;
            }
        </style>
        <script type="text/javascript">
            function findPart(){
                var code = jQuery("#searchString").val();
                jQuery.ajax({
                    type:"get",
                    url:"getExistingParts",
                    data:"code="+code,
                    success:function(data){
                        //alert(data);
                        var data = eval('('+data+')');
                        setPartHtml(data);
                    
                    }
                });
            } 
           
           
            function setPartHtml(part)
            {
                var html="";
                for(var i=0;i<part.length;i++){
                    html+="<div class='searchBox'>";
                    html+="<div class='searchBox_Top'>";
                    html+="<div class='searchBox_Image' style='float:left'>";
                    html+="<img style='width: 90%' src='images/no-product-image.jpg'/>";
                    html+="</div>";
                    html+="<div style='float:left;width: 500px'>";
                    html+="<div>";
                    html+="<h3>"+part[i].name+" "+part[i].partNo+"</h3>";
                    html+="</div>";
                    html+="<div>";
                    html+=part[i].description;
                    html+="</div>";
                    html+="<br/>";
                    html+="<div><b>Manufacturer:</b> "+part[i].manufacturer+"</div>";
                    html+="<div><b>Specifications:</b> "+part[i].specifications+"</div>";
                    html+="</div> ";
                    html+="<div style='float:left;padding-left: 15px;'>";                                      
                    html+="<div><b>UPC/EAN:</b>"+part[i].upc_ean+"</div>";
                    html+="<div><b>NSN:</b>"+part[i].nsn+"</div>";
                    html+="<div><b>BSIN:</b>"+part[i].bsin+"</div>";
                    html+="<br/>";
                    html+="<div><a href='showAddInventory?partId="+part[i].id+"' class='btn' style='width: 120px; text-align: center; padding: 2px; padding-top: 8px;'>Add to Inventory</a></div>";
                    html+="</div>";
                    html+="</div>";
                    html+="<div style='clear: both'></div>";
                    html+="</div>";
                }
                var phtml = jQuery("#resultSet").html();
                jQuery("#resultSet").html(phtml+html);
            }
        </script>

        <title>Mexam BuynSell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <div id="container" class="container" style="min-height: 335px;"> 
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Find Part</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="searchBar">
                    <form id ="searchVendor" onsubmit="findPart();return false;">
                        <div class="alignField">Find part based on NSN,BSIN,UPC or EAN Number to check if it already exists</div>                                              
                        <div>
                            <div class="alignField" style="width: 52%">                        
                                <input name="searchString" class="field_big" id="searchString"  value="${searchString}"/>
                            </div>
                            <div style="float: left; width: 250px; margin: auto; height: auto; padding: 5px;">
                                <a href="javascript:findPart()" class="btn" style="width: 120px; text-align: center; padding: 2px; padding-top: 8px;">Search</a>
                                <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </form>
                            <div style="text-align: center"><a href="showAddPart" class="dark">Skip</a></div>    
                    <div id="resultSet">
                                              
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>

</html>
