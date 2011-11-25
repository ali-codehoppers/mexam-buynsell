<%-- 
    Document   : addProduct
    Created on : Nov 4, 2011, 11:55:06 AM
    Author     : CodeHopper
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
        <style>
            #partNo-label {
                display: block;
                font-weight: bold;
                margin-bottom: 1em;
            }
            #partNo-description {
                margin: 0;
                padding: 0;
            }
        </style>

        <script>
            var manufacturer="";
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
                $( "#manufacturer" ).autocomplete({
                    minLength: 0,
                    source: data,
                    focus: function( event, ui ) {
                        for(property in ui.item.value)
                        {
                            //        alert(property);
                        }
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
                
                .data( "autocomplete" )._renderItem = function( ul, item ) {
                    return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append( "<a> <div style='font-size:14px; font-style: italic '>" + item.label + "</div></a>" )
                    .appendTo( ul );
                };
                
                //                .data( "autocomplete" )._renderItem = function( ul, item ) {
                //                    return $( "<li></li>" )
                //                    .data( "item.autocomplete", item )
                //                    .append( "<a> <div style='font-size:14px; font-style: italic '>" + item.label + "</div><div style='font-size:10px; font-style: italic '>" + item.desc + "</div></a>" )
                //                    .appendTo( ul );
                //                };
            }
            
            
            $(document).ready(function() {
                //getParts();
                getMfgs();
            });

        </script>

        <title>Add New Inventory</title>
    </head>
    <body>
        <h1>Add New Inventory!</h1>


        <div style="width: 50%"> 
            <form method="POST" action="addInventory">
                <div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Manufacturer:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="manufacturer"/>
                        </div>

                    </div>


                    <div>
                        <div style="float: left; width: 50%">                        
                            Part #:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="partNo"/>
                        </div>
                    </div>


                    <div>
                        <div style="float: left; width: 50%">                        
                            Condition:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <!--                            <s:textfield name="condition"/> -->

                            <s:select name="condition" list="inventoryCondition" listKey="code" listValue="description" headerKey="0" headerValue="--Inventory Condition--" />                        
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            Price:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="price"/>
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            Quantity
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="quantity"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Description/Notes
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="description"/>
                        </div>
                    </div>                    
                </div>
                <s:submit value="Add Inventory" align="center"/>
            </form>
        </div>
    </body>
</html>
