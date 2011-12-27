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
                    //$("#partList").append('<li>'+mydata[i].partNo+'</li>');
                    $("#partList").append('<li>'+getListItemHtml(mydata[i])+'</li>');
                }
            });
            
            function getListItemHtml(item)
            {
                var html="<div style='font-size:18pt'>";
                html+="<span style='font-size:16pt'><a href='viewPart?partId="+item.id+"'>"+ item.partNo +"</a></span>";
                html+="<span style='font-size:12pt; margin-left:20pt'>("+ item.manufacturer +")</span>";                
                html+="</div>";
                html+="<div style='font-size:10pt;font-style:italic'>";
                html+=item.description;                
                html+="</div>";                
                return html;
            }
            
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
