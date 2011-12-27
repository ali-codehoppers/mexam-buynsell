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
        <link rel="stylesheet" href="css/tabs.css" type="text/css" />        
        <script type="text/javascript" src="js/wysiwyg/jquery.wysiwyg.js"></script>        
        <link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/>             
        
        <script type="text/javascript">
            
            function redirect()
            {
                var redirectURL = "home";
                window.location.href = redirectURL;
            }
            
            $(document).ready(function() {
                // When a link is clicked
                $("a.tab").click(function () {
                    // switch all tabs off
                    $(".active").removeClass("active");
                    // switch this tab on
                    $(this).addClass("active");
                    // slide all content up
                    $(".content").hide();
                    // slide this content up
                    var content_show = $(this).attr("title");
                    $("#"+content_show).show();
                });
                getMfgs();
                $('#subCategoryId').val(${subCategoryId});
            });
            
            $(function()
            {
                $('#overview').wysiwyg();
                $('#features').wysiwyg();                
                $('#specifications').wysiwyg();                
            });
            
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
                
                .data( "autocomplete" )._renderItem = function( ul, item ) {
                    return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append( "<a> <div style='font-size:14px; font-style: italic '>" + item.label + "</div></a>" )
                    .appendTo( ul );
                };
            }
            
        </script>


        <title>Mexam BuynSell</title>
    </head>
    <body>

        <h1>Add New Part!</h1>
        
        <div style="width: 80%;"> 
            <form method="POST" action="addPart">
                <s:textfield name="subCategoryId" id="subCategoryId" cssStyle="display:none"/>
                <div class="tabbed_area" style="max-width: 740px; margin: 8px">
                    <ul class="tabs">
                        <li><a href="#" title="content_1" class="tab active" style="min-width: 250px">Basic Information</a></li>
                        <li><a href="#" title="content_2" class="tab" style="min-width: 250px">Offer</a></li>
                        <li><a href="#" title="content_3" class="tab">Image</a></li>
                        <li><a href="#" title="content_4" class="tab">Detailed Information</a></li>
                    </ul>

                </div>

                <div id="content_1" class="content" style="display: block; height: 300px">
                    <div>
                        <div>
                            <div style="float: left; width: 30%">                        
                                Part Name:
                            </div>                        
                            <div style="float: left; width: 70%">                        
                                <s:textfield name="name"/>
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
                                Brief Description:
                            </div>                        
                            <div style="float: left; width: 70%">                        
                                <s:textarea name="description"/>
                            </div>
                        </div>  
                    </div>
                </div>
                <div id="content_2" class="content" style="display: none; height: 300px">
                    <div>
                        <div>
                            <div style="float: left; width: 30%">                        
                                Condition:
                            </div>                        
                            <div style="float: left; width: 70%">                        
                                <!--                   
                                <s:textfield name="condition"/> -->

                                <s:select name="condition" list="inventoryCondition" listKey="code" listValue="description" headerKey="0" headerValue="--Inventory Condition--" />                        
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 30%">                        
                                Price:
                            </div>                        
                            <div style="float: left; width: 50%">                        
                                <s:textfield name="price"/>
                            </div>
                        </div>
                        <div>
                            <div style="float: left; width: 30%">                        
                                Quantity
                            </div>                        
                            <div style="float: left; width: 50%">                        
                                <s:textfield name="quantity"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="content_3" class="content" style="display: none;  height: 300px">
                </div>                            
                <div id="content_4" class="content" style="display: none; height: 300px">
                    <div>
                        <div>
                            <div style="float: left; width: 30%">                        
                                Overview:
                            </div>                        
                            <div style="float: left; width: 70%">                        
                                <s:textarea id="overview" name="overview" cssStyle="min-width:550px"/>          
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 30%">                        
                                Features:
                            </div>                        
                            <div style="float: left; width: 70%">                        
                                <s:textarea id="features" name="features" cssStyle="min-width:550px"/>
                            </div>
                        </div>

                        <div>
                            <div style="float: left; width: 30%">                        
                                Specifications:
                            </div>                        
                            <div style="float: left; width: 70%">                        
                                <s:textarea id="specifications" name="specifications" cssStyle="min-width:550px"/>          
                            </div>

                        </div>
                    </div>                            
                </div>
                <s:submit value="Next" align="center" cssStyle="min-width:200px; height:40px; margin-top:30px"/>
            </form>
        </div>
    </body>

</html>
