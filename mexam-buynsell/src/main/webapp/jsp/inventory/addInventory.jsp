<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>

        </style>

        <script type="text/javascript">
            var conditions = eval(${conditionJson});
            var infoMessage = "${info}";
            var errorMessage = "${error}";
            var successMessage = "${message}";
            $(document).ready(function () {
                //alert(conditions);
                conditionsHtml="";
                for (var i = 0; i< conditions.length; i++) {
                    conditionsHtml += '<option value="' + conditions[i].description + '">' + conditions[i].description + '</option>';
                }
                $("#condition").html(conditionsHtml);
                if(infoMessage && infoMessage.length>0)
                {
                    $("#messageInfo").show();
                    $("#infoMsg").html(infoMessage);
                }
                else
                {
                    $("#messageInfo").hide();
                }
                if(errorMessage && errorMessage.length>0)
                {
                    $("#messageError").show();
                    $("#errorMsg").html(errorMessage);
                }
                else
                {
                    $("#messageError").hide();
                }
                if(successMessage && successMessage.length>0)
                {
                    $("#messageSuccess").show();
                    $("#successMsg").html(successMessage);
                }     
                else
                {
                    $("#messageSuccess").hide();                        
                }
                getMfgs();
            });
            
            function submitForm()
            {
                $("#formInventory").submit();
            }
            
            function hideInfo()
            {
                $("#messageInfo").hide();
            }
            function hideError()
            {
                $("#messageError").hide();
            }
            function hideSuccess()
            {
                $("#messageSuccess").hide();
            }
            
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

        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jspf" />

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div>
                    <jsp:include page="../common/messages.jspf" />
                </div>

                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Add New Inventory</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="formContainder">
                    <form id ="formInventory" method="POST" action="addInventory">
                        <div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Manufacturer:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="manufacturer" name="manufacturer" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Part #:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="partNo" name="partNo" class="field_big"/>
                                </div>
                            </div>

                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Condition:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <select id="condition" name="condition" class="field_big" style="min-width: 20%">                       
                                    </select>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Price:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input name="price" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Quantity
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input name="quantity" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Description/Notes
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <textarea name="description" class="field_big">
                                    </textarea>
                                </div>
                            </div>     
                        </div>
                        <div style="width: 100px; margin: auto">
                            <a href="javascript:submitForm()" class="btn">Submit</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>
                    </form>


                </div>

            </div>
        </div>
        <jsp:include page="../common/adFooter.jspf" />
        <jsp:include page="../common/footer.jspf" />

    </body>
</html>