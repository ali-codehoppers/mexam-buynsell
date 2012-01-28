<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="errortags" prefix="ch"%>
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
                getCategories();
                getSubCategories(1)
                getMfgs();
            });
            
            function submitForm()
            {
                $("#addBroadcast").submit();
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
                        $("#subCategoryId").val(data[0].id);
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
             
            function setSubCategory(value)
            {
                subCatId=value;
                $("#subCategoryId").val(value);
            }

        </script>
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jspf" >
            <jsp:param name="currentTab" value="broadcast"/>
        </jsp:include>

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">

                <div>
                    <jsp:include page="../common/messages.jspf" />
                </div>

                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Add New Broadcast</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="formContainder" style="margin-left: 50px;">


                    <form id ="addBroadcast" method="POST" action="addBroadcast">
                        <div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Broadcast Type:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">
                                    <div style="float: left;">   
                                        <input type="radio" name="broadcastType" value="WTS"> WTS</input>
                                        <input type="radio" name="broadcastType" value="WTB"> WTB</input>
                                        <input type="radio" name="broadcastType" value="RFQ"> RFQ</input>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_broadcastType"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                    <!--<s:radio id="broadcastType" name="broadcastType" list="broadcastType" listKey="id" listValue="description"/> -->
                                </div>
                            </div>

                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Categories:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <select id="categories" class="field_big" name="categories" style="width: 250px; " onchange="getSubCategories(this.value)"></select>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Sub Categories:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">   
                                    <div style="float: left;">   
                                        <select id="subcategories" style="width: 250px;" onchange="setSubCategory(this.value)" class="field_big"></select>
                                        <input name="subCategoryId" id="subCategoryId" style="display:none" />
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_subCategoryId"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>

                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Manufacturer:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">   
                                        <input id="manufacturer" name="manufacturer" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_manufacturer"></ch:errortag>
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
                                        <input id="partNo" name="partNo" class="field_big"></input>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_partNo"></ch:errortag>
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
                                        <select id="condition" name="condition" class="field_big" style="min-width: 20%"></select>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_condition"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Price:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">   
                                        <input name="price" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_price"></ch:errortag>
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
                                        <input name="quantity" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_quantity"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Description/Notes
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <textarea name="description" class="field_big" rows="3" style="height: 50px; min-width: 300px"></textarea>
                                </div>
                            </div>   

                            <div style="min-height: 20px"></div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Subject: 
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;"> 
                                    <div style="float: left;">   
                                        <input name="subject" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="addBroadcast_subject"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>     


                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Message: 
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">    
                                    <textarea name="broadcastMessage" class="field_big" rows="3" style="height: 50px; min-width: 300px"></textarea>
                                </div>
                            </div>     
                            <br/>
                            <div style="min-height: 20px"></div>
                        </div>
                        <div style="width: 100px; margin: auto">
                            <a href="javascript:submitForm()" class="btn">Submit</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
