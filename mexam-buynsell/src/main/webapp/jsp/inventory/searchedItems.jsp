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
                   addCombo("combo_qty_"+mydata[i].id,mydata[i].quantity);
                }
            });
            
            function AddCartItem(id)
            {
                var combo_id = "combo_qty_"+id;
                alert(getSelectedValue(combo_id));
                //redirect("addToCart?inventoryId="+id+"&quantity='"+getSelectedValue(combo_id)+"'");
                window.location="/mexam-buynsell/addToCart?inventoryId="+id+"&quantity="+getSelectedValue(combo_id);
            }
            
            function getSelectedValue(combo_id)
            {
                alert(combo_id);
                return $("#"+combo_id).val();
            }
            
            function addCombo(item_id, qty) {
                var combo = document.getElementById(item_id);
                for(var i=1;i<=qty;i++)
                {
                    var option = document.createElement("option");
                    option.text = i;
                    option.value = i;
                    try {
                        combo.add(option, null); //Standard
                    }catch(error) {
                        combo.add(option); // IE only
                    }
                }
            }
            
            function getListItemHtml(item)
            {
                var html="<div style='width:40%; float:left'>";
                html+="<div style='font-size:18pt'>";
                html+="<span style='font-size:16pt'><a href='viewPart?partId="+item.id+"'>"+ item.partNo +"</a></span>";
                html+="<span style='font-size:12pt; margin-left:20pt'>("+ item.manufacturer +")</span>";                
                html+="</div>";
                html+="<div style='font-size:10pt;font-style:italic'>";
                html+=item.description;                
                html+="</div>";                
                html+="</div>";
                html+="<div style='width:10%;float:left'>";
                html+=item.cond
                html+="</div>";                
                html+="<div style='width:35%;float:left'>";
                html+=item.companyName
                html+="</div>";                
                html+="<div style='width:15%;float:left'>";
                    html+="<div style='text-align: center'>";
                        Qty: 
                        //    html+="<input id='inp_qty' name='inp_qty' value='1' style='width:40%;text-align: center '/>";
                        html+=" <select name='combo_qty_"+item.id+"' id='combo_qty_"+item.id+"' style='width:40%;text-align: center '/>";                
                    html+="</div>";
                    html+="<div style='text-align: center'>";
                        //html+="<a href='#' onclick='redirect("+item+")'>Add to Cart</a>";
                        html+="<input type='button' onclick='AddCartItem("+item.id+")' value='Add to Cart'/>";                        
                    html+="</div>";
                html+="</div>";                
                html+="<div style='clear:both'>";
                html+="</div>";
                
                return html;
            }
            
        </script>

        <title>Mexam BuynSell</title>
    </head>
    <body>
        <div style="width: 50%;"> 
            <ul id="partList">
            </ul>

        </div>
    </body>

</html>
