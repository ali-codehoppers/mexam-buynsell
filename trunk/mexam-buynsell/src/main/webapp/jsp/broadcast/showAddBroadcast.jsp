<%-- 
    Document   : seachPart
    Created on : Nov 28, 2011, 11:29:09 AM
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
        <link rel="stylesheet" href="css/tabs.css" type="text/css" />        
        <script type="text/javascript">
            
            var subCatId=0;
            
            
            function getCategories()
            {
                $.ajax({
                    type:       "get",
                    url:        "getCategories",
                    data:       {},
                    success:    function(msg) {
                        var data = eval('('+msg+')');
                        var len = data.length;
                        for (var i = 0; i< len; i++) {
                            var html = '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                            $("#categories").append(html);
                        }
                    }
                });
               
            }
 
            function getSubCategories(id)
            {
                $.ajax({
                    type:       "get",
                    url:        "getSubCategories",
                    data:       {categoryId: id},
                    success:    function(msg) {
                        var data = eval('('+msg+')');
                        var len = data.length;
                        $("#subcategories").empty();
                        for (var i = 0; i< len; i++) {
                            var html = '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                            $("#subcategories").append(html);
                        }
                    }
                });
                $("#buttonAddNew").hide();
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
                        $( "#partNo-id" ).val( ui.item.value );
                        $( "#partNo-description" ).html( ui.item.desc );
                        return false;
                    }
                })
                .data( "autocomplete" )._renderItem = function( ul, item ) {
                    return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append( "<a> <div style='font-size:14px; font-style: italic '>" + item.label + "</div><div style='font-size:10px; font-style: italic '>" + item.desc + "</div></a>" )
                    .appendTo( ul );
                };
            }
            
            function setAutoCompleteMfgs(data)
            {
                $("#manufacturer").autocomplete({
                    minLength: 0,
                    source: data,
                    focus: function( event, ui ) {
                        for(property in ui.item.value)
                        {
                            //        alert(property);
                        }
                        $("#manufacturer" ).val( ui.item.value );
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
                
                .data( "autocomplete" )._renderItem = function( ul, item ) {
                    return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append( "<a> <div style='font-size:14px; font-style: italic '>" + item.label + "</div></a>" )
                    .appendTo( ul );
                };
            }
            
            function setSubCategory(value)
            {
                subCatId=value;
                $("#subCategoryId").val(value);
            }
            
            function redirect()
            {
                var redirectURL = "showAddPartInfo?subCategoryId="+subCatId;
                window.location.href = redirectURL;
            }
            
            $(document).ready(function() {
                getCategories();
                getMfgs();
            });
            
        </script>


        <title>Mexam BuynSell</title>
    </head>
    <body>
        <h1>Add New Broadcast!</h1>
        <div style="width: 100%;"> 
            <form method="POST" action="addBroadcast">
                <div style="float: left; width: 100%">

                    <div>
                        <div style="float: left; width: 30%">                        
                            Broadcast Type:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:radio id="broadcastType" name="broadcastType" list="broadcastType" listKey="id" listValue="description"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 30%">                        
                            Categories:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <select id="categories" style="width: 250px; " onchange="getSubCategories(this.value)">
                            </select>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 30%">                        
                            Sub Categories:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <select id="subcategories" style="width: 250px;" onchange="setSubCategory(this.value)">
                            </select>                
                            <s:textfield name="subCategoryId" id="subCategoryId" cssStyle="display:none" />
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 30%">                        
                            Manufacturer:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:textfield name="manufacturer"/>
                        </div>

                    </div>


                    <div>
                        <div style="float: left; width: 30%">                        
                            Part #:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:textfield name="partNo"/>
                        </div>
                    </div>


                    <div>
                        <div style="float: left; width: 30%">                        
                            Condition:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <!--                   
                            <s:textfield name="condition"/> -->

                            <s:select name="condition" list="inventoryCondition" listKey="description" listValue="description" headerKey="0" headerValue="--Inventory Condition--" />                        
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 30%">                        
                            Price:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:textfield name="price"/>
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 30%">                        
                            Quantity:
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:textfield name="quantity"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 30%">                        
                            Description/Notes
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:textarea name="description"/>
                        </div>
                    </div>     


                    <div>
                        <div style="float: left; width: 30%">                        
                            Subject: 
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:textfield name="subject"/>
                        </div>
                    </div>     



                    <div>
                        <div style="float: left; width: 30%">                        
                            Message: 
                        </div>                        
                        <div style="float: left; width: 70%">                        
                            <s:textarea name="broadcastMessage"/>
                        </div>
                    </div>     


                    <div style=""> 
                        <div>
                            <s:submit value="Add Broadcast" align="center"/>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </body>

</html>
