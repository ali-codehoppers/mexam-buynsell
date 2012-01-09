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
                getCategories();
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

        <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="73"><table width="990" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="695"><img src="images/logo.jpg" height="71" alt="" /></td>
                            <td width="295" align="right">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="right" valign="top">
                                            <form action="#" method="post">
                                                <input type="text" name="search" class="search" value="Search..." onBlur="if (this.value == ''){this.value = 'Search...'; }" onFocus="if (this.value== 'Search...') {this.value = ''; }" />
                                                <div id="btn_">Go</div>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left"><a href="#">Advance Search</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td height="130" valign="bottom">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="56" align="left" valign="bottom">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="66" align="center"><a href="#" class="topnav">HOME</a></td>
                                        <td width="100" align="center"><a href="#" class="topnav">ABOUT US</a></td>
                                        <td width="53" align="center"><a href="#" class="topnav">BUY</a></td>
                                        <td width="77" align="center" valign="middle" class="navigation_radius">SELL</td>
                                        <td width="100" align="center"><a href="#" class="topnav">FEATURES</a></td>
                                        <td width="100" align="center"><a href="#" class="topnav">CONTACT US</a></td>
                                        <td width="100" align="center" nowrap="nowrap"><a href="#" class="topnav">SITE MAP</a></td>
                                        <td width="26">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" class="login_bg">
                                <form id="form1" name="form1" method="post" action="">
                                    <table width="200" border="0" cellspacing="0" cellpadding="3">
                                        <tr>
                                            <td colspan="2">MEMBER LOGIN</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <input type="text" name="search" class="input_" value="Username" onBlur="if (this.value == ''){this.value = 'Username'; }" onFocus="if (this.value== 'Username') {this.value = ''; }" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="text" name="Password" class="input_" value="Password" onBlur="if (this.value == ''){this.value = 'Password'; }" onFocus="if (this.value== 'Password') {this.value = ''; }" /></td>
                                        </tr>
                                        <tr>
                                            <td width="109"><input type="checkbox" name="checkbox" id="checkbox" />
                                                <label for="checkbox">Remember Me</label></td>
                                            <td width="79"><a href="#"><img src="images/signin.jpg" alt="" width="73" height="25" border="0" /></a></td>
                                        </tr>
                                    </table>
                                </form></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="100%" valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr id="messageError">
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="6%" align="right"><img src="images/error_left.jpg" alt="" width="38" height="34" /></td>
                                                    <td id="errorMsg" width="88%" align="left" class="error_msg">Error message goes here.</td>
                                                    <td width="5%" align="right" class="error_msg"><a href="#"><img src="images/error_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideError()"/></a></td>
                                                    <td width="1%" align="left"><img src="images/error_right.jpg" alt="" width="6" height="34" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="messageInfo">
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="6%" align="right"><img src="images/info_left.jpg" alt="" width="38" height="34" /></td>
                                                    <td id="infoMsg" width="88%" align="left" class="info_msg">Information message goes here.</td>
                                                    <td width="5%" align="right" class="info_msg"><a href="#"><img src="images/info_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideInfo()"/></a></td>
                                                    <td width="1%" align="left"><img src="images/info_right.jpg" alt="" width="6" height="34" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="messageSuccess">
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="6%" align="right"><img src="images/success_left.jpg" alt="" width="38" height="34" /></td>
                                                    <td id="successMsg" width="88%" align="left" class="success_msg">Success message goes here.</td>
                                                    <td width="5%" align="right" class="success_msg"><a href="#"><img src="images/success_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideSuccess()"/></a></td>
                                                    <td width="1%" align="left"><img src="images/success_right.jpg" alt="" width="6" height="34" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="34" colspan="2" align="center"><h1 id="listTitle">Add New Broadcast</h1></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><img src="images/under_line.jpg" width="553" height="16" alt="" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <form id ="addBroadcast" method="POST" action="addBroadcast">
                                                <div>
                                                    <div>
                                                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                                            Broadcast Type:
                                                        </div>                        
                                                        <div style="float: left; width: 48%; margin: 5px;">
                                                            <input type="radio" name="broadcastType" value="WTS"> WTS</input>
                                                            <input type="radio" name="broadcastType" value="WTB"> WTB</input>
                                                            <input type="radio" name="broadcastType" value="RFQ"> RFQ</input>
                                                            <!--<s:radio id="broadcastType" name="broadcastType" list="broadcastType" listKey="id" listValue="description"/> -->
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                                            Categories:
                                                        </div>                        
                                                        <div style="float: left; width: 48%; margin: 5px;">                        
                                                            <select id="categories" class="field_big" name="categories" style="width: 250px; " onchange="getSubCategories(this.value)">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                                            Sub Categories:
                                                        </div>                        
                                                        <div style="float: left; width: 48%; margin: 5px;">                        
                                                            <select id="subcategories" style="width: 250px;" onchange="setSubCategory(this.value)">
                                                            </select>
                                                            <input name="subCategoryId" id="subCategoryId" style="display:none" />
                                                        </div>
                                                    </div>

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
                                                            <textarea name="description" class="field_big" rows="3" style="height: 50px; min-width: 300px">
                                                            </textarea>
                                                        </div>
                                                    </div>   

                                                    <div style="min-height: 20px"></div>
                                                    <div>
                                                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                                            Subject: 
                                                        </div>                        
                                                        <div style="float: left; width: 48%; margin: 5px;"> 
                                                            <input name="subject" class="field_big"/>
                                                        </div>
                                                    </div>     


                                                    <div>
                                                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                                            Message: 
                                                        </div>                        
                                                        <div style="float: left; width: 48%; margin: 5px;">    
                                                            <textarea name="broadcastMessage" class="field_big" rows="3" style="height: 50px; min-width: 300px">
                                                            </textarea>
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
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>

        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center" valign="top" bgcolor="#ececec"><table width="990" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="6" align="center" valign="top"><img src="images/top_cat.jpg" width="990" height="23" alt="" /></td>
                        </tr>
                        <tr>
                            <td width="39" align="left"><img src="images/cat_left.jpg" width="30" height="40" alt="" /></td>
                            <td width="455" align="center" valign="middle" class="cat_banner"><img src="images/v_recorder.jpg" width="114" height="120" alt="" /></td>
                            <td width="123" align="center" valign="middle" class="cat_banner"><img src="images/v_recorder.jpg" width="114" height="120" alt="" /></td>
                            <td width="123" align="center" valign="middle" class="cat_banner"><img src="images/v_recorder.jpg" width="114" height="120" alt="" /></td>
                            <td width="211" align="center" valign="middle" class="cat_banner"><img src="images/v_recorder.jpg" width="114" height="120" alt="" /></td>
                            <td width="39" align="right"><img src="images/cat_right.jpg" width="30" height="40" alt="" /></td>
                        </tr>
                        <tr>
                            <td height="31" align="left">&nbsp;</td>
                            <td align="center" valign="middle"><strong>Video Recorders</strong></td>
                            <td align="center" valign="middle"><strong>Video Recorders</strong></td>
                            <td align="center"><strong>Video Recorders</strong></td>
                            <td align="center"><strong>Video Recorders</strong></td>
                            <td align="right">&nbsp;</td>
                        </tr>
                    </table></td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center" valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" valign="top"  class="footer"><table width="990" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="298" height="91" align="left">Copyright © 2012 Buy&amp;Sell, All rights reserved<br />
                                e-mail: <a href="#" class="footer">info@buy&amp;sell.com</a></td>
                            <td width="692" align="right"><a href="#" class="footer">About  Us</a> |   <a href="#" class="footer">Buy</a> |   <a href="#" class="footer">Sell</a> |   <a href="#" class="footer">Contact us</a> |   <a href="#" class="footer">Order Catalog</a><br />
                                <a href="#" class="footer">Site Map</a> |<a href="#" class="footer"> My Account</a> |   <a href="#" class="footer">Terms and Conditions of Sale</a> |<a href="#" class="footer"> Terms and Conditions of Use</a><br /></td>
                        </tr>
                    </table></td>
            </tr>
        </table>
    </body>
</html>
