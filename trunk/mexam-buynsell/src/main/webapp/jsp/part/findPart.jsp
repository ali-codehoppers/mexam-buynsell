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
            
        </style>
        <script type="text/javascript">
           function findPart(){
               var searchString = jQuery("#searchString").val();
               jQuery.ajax({
                   type:"POST",
                   url:"getExistingPart",
                   data:"searchString="+searchString,
                   success:function(data){
                    alert(data);   
                   }
               });
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
                        <div class="alignField">Find part based on NSN,BSIN,UPC or EAN Number</div>                                              
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
                            <div class="alignField">LOREM ISPUM, LOREM ISPUM</div>                                              
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>

</html>
