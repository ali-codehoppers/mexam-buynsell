<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <script type="text/javascript" src="js/wysiwyg/jquery.wysiwyg.js"></script>   
        <link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>

        </style>

        <script type="text/javascript">
            var conditions = eval(${conditionJson});
            var infoMessage = "${info}";
            var errorMessage = "${error}";
            var successMessage = "${message}";
    
            $(function()
            {
                $('#overview').wysiwyg();
                $('#features').wysiwyg();                
                $('#specifications').wysiwyg();                
            });

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
                $("#tabs").tabs();
                getMfgs();
                $('#subCategoryId').val(${subCategoryId});
            });
            function submitForm()
            {
                $("#addPart").submit();
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
                        <h1 style="width: 100%; text-align: center" id="listTitle">Add New Part</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="formContainder">
                    <form id ="addPart" method="POST" action="addPart" enctype="multipart/form-data">
                        <input name="subCategoryId" id="subCategoryId" style="display:none"/>
                        <div id="tabs">
                            <ul>
                                <li><a href="#basicInfo"><span>Basic Information</span></a></li>
                                <li><a href="#offer"><span>Offer</span></a></li>
                                <li><a href="#image"><span>Image</span></a></li>
                                <li><a href="#detailInfo"><span>Detailed Information</span></a></li>
                            </ul>
                            <div id="basicInfo">
                                <div>
                                    <div>
                                        <div style="float: left; width: 38%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Part Name:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <input name="name" class="field_big" />
                                        </div>
                                    </div>

                                    <div>
                                        <div style="float: left; width: 38%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Manufacturer:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <input name="manufacturer" class="field_big"/>
                                        </div>

                                    </div>

                                    <div>
                                        <div style="float: left; width: 38%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Part #:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <input name="partNo" class="field_big"/>
                                        </div>
                                    </div>

                                    <div>
                                        <div style="float: left; width: 38%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Brief Description:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <textarea name="description" class="field_big" rows="3" style="height: 50px; min-width: 300px"></textarea>
                                        </div>
                                    </div>  
                                </div>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div id="offer">
                                <div>
                                    <div>
                                        <div style="float: left; width: 38%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Condition:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <select id="condition" name="condition" class="field_big"  ></select>                        
                                        </div>
                                    </div>
                                    <div>
                                        <div style="float: left; width: 38%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Price:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <input name="price" class="field_big"/>
                                        </div>
                                    </div>
                                    <div>
                                        <div style="float: left; width: 38%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Quantity
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <input name="quantity" class="field_big"/>
                                        </div>
                                    </div>
                                </div>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div id="image" style="min-height: 300px">
                                <div style="margin-top: 50px; margin-bottom: 50px">
                                    <div style="float: left; width: 28%; margin: 5px; text-align: right; vertical-align: middle; margin-top: 20px;">                        
                                        Image:
                                    </div>                        
                                    <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                        <input type="file" name="image" id="image" accept="image/*"> 
                                    </div>
                                </div>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div id="detailInfo">
                                <div>
                                    <div>
                                        <div style="float: left; width: 28%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Overview:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <textarea  id="overview" name="overview" style="min-width:450px"></textarea>          
                                        </div>
                                    </div>

                                    <div>
                                        <div style="float: left; height: 100%; width: 28%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Features:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <textarea  id="features" name="features" style="min-width:450px"></textarea>
                                        </div>
                                    </div>

                                    <div>
                                        <div style="float: left; width: 28%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                            Specifications:
                                        </div>                        
                                        <div style="float: left; width: 58%; margin: 5px; text-align: left;">                        
                                            <textarea id="specifications" name="specifications" style="min-width:450px"></textarea>          
                                        </div>
                                    </div>
                                </div>   
                                <div style="clear: both"></div>
                            </div>
                        </div>
                        <div style="clear: both">
                        </div>
                        <div style="width: 100px; margin: auto; margin-top: 25px;">
                            <a href="javascript:submitForm()" class="btn">Submit</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>

                    </form>

                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jspf" />

    </body>
</body>
</html>
