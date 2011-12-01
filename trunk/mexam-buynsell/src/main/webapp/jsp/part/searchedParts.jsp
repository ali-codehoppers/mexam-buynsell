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
        <script type="text/javascript" src="js/jquery.js"></script>        

        <script type="text/javascript">
            $(document).ready(function(){
                var mydata = eval(${searchResultJson}); 
                for(var i=0;i<mydata.length;i++)
                { 
                    $("#partList").append('<li>'+mydata[i].partNo+'</li>');
                    alert($("#partList"));
                }
            });
        </script>

        <title>Mexam BuynSell</title>
    </head>
    <body>
        <div style="width: 50%"> 
            <ul id="partList">
            </ul>
        </div>
    </body>

</html>
