<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <script type="text/javascript" src="js/menu/menu.js"></script>   
        <link href="css/menu/menu.css" rel="stylesheet" type="text/css" />
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />

        <style>
            div#menu {
                top:40px;
                left:0px;
                width:100%;
                background:transparent url(images/header_bg.gif) repeat-x 0 0;  
            }
        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                var mydata = eval(${searchResultJson}); 
                for(var i=0;i<mydata.length;i++)
                { 
                    $("#partList").append('<li>'+getListItemHtml(mydata[i])+'</li>');
                    addCombo("combo_qty_"+mydata[i].id,mydata[i].quantity);
                }
            });
            
            
            function AddCartItem(id)
            {
                var combo_id = "combo_qty_"+id;

                //redirect("addToCart?inventoryId="+id+"&quantity='"+getSelectedValue(combo_id)+"'");
                window.location="/mexam-buynsell/addToCart?inventoryId="+id+"&quantity="+getSelectedValue(combo_id);
            }
            
            function getSelectedValue(combo_id)
            {
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
            
            function submitForm()
            {
                $("#searchPart").submit();
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
                                </form>
                            </td>
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
                                            <form id ="searchPart" method="POST" action="searchPart">
                                                <div>
                                                    <div style="float: left; width: 50%">                        
                                                        Search Text:
                                                    </div>                        
                                                    <div style="float: left; width: 50%">                        
                                                        <input name="searchString"/>
                                                    </div>
                                                </div>

                                                <div style="width: 100px; margin: auto">
                                                    <a href="javascript:submitForm()" class="btn">Submit</a>
                                                    <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <ul id="partList">
                                            </ul>
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
