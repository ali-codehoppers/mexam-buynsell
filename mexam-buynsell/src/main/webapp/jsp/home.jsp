<%-- 
    Document   : home
    Created on : Nov 2, 2011, 12:45:08 PM
    Author     : CodeHopper
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jstree/_lib/jquery.js"></script>
        <script type="text/javascript" src="js/jstree/jquery.jstree.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/>        
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>
            #sideBar {
                background-color: #fff;
                padding: 8px;
                width: 250px;
                border: solid 1px #CCC;
                padding-bottom: 10px;

            }

            #catTitle {
                padding: 5px;
                text-align: center;
                color: black;
                font-weight: bold;
                font-size: 18px;
                background-color: #ccc;
            }

            #tree {
                padding: 8px;
            }

            #parts
            {
                padding: 5px 5px 5px 5px;
                min-height: 500px;
            }
            .product
            {
                margin: 8px 8px 8px 8px;
                width: 220px;
                border: solid 1px #DEDEDE;
                float: left;
            }
            .part
            {
                margin: 8px 8px 8px 8px;
                padding: 8px 8px 8px 8px;
                width: 190px;
                border: solid 1px #DEDEDE;
                float: left;
            }
            .productImage
            {
                height: 220px;
                width: auto;
                overflow: hidden;
                text-align: center;
            }
            .partImage
            {
                height: auto;
                max-width: 180px;
                overflow: hidden;
                text-align: center;
            }

            .productDetail
            {
                height:90px;
                width:auto;
                border-top:solid 1px #dedede;
                padding:5px 5px 5px 5px;
                overflow:hidden;
                color:#083152;
            }

            .partDetail
            {
                height:50px;
                width:auto;
                border-top:solid 1px #dedede;
                padding:5px 5px 5px 5px;
                overflow:hidden;
            }

            .productDetail a:link, .productDetail a:active, .productDetail a:visited 
            {
                color: #083152;
                font-size: 15px;
                line-height: 18px;
                font-weight: bold;
                text-decoration: none;
            }

            .productDesc
            {
                color: #4D4D4D;
                margin-top: 5px;
                font-size: 12px;
                line-height: 14px;
            }

        </style>


        <script type="text/javascript">
            var str;
            var subCatId=1;
            var subCatList;
            function LoadList(){
                $("#listParts").html('');
                for(var i=0;i<str.length;i++)
                {
                    if(str[i].attr.id==subCatId)
                    { 
                        var partHtml= getCategoryHighlitedHtml(str[i]);
                        $("#listParts").append(partHtml);
                        for(var j=0;j<str[i].children.length;j++)
                        {
                            var partChild = getCategoryChildHtml(str[i].children[j]);
                            $("#listParts").append(partChild);
                        }
                    }
                    else
                    {
                        var partHtml= getCategoryHtml(str[i]);
                        $("#listParts").append(partHtml);
                    }
                }
                
            }
            
            function setCategory(id)
            {
                if(subCatId!=id)
                    subCatId = id;
                else 
                    subCatId=0;
                LoadList();
                populateCategoryProduct(id);
            }
            
            function setSubCategory(id)
            {
                populateSubCategoryProduct(id);
            }
            
            
            $(document).ready(function () {
                str = eval('('+${treeJsonString}+')');
                LoadList();
                
                $("#tree").jstree({
                    "themes" : {
                        "theme" : "apple",
                        "dots" : true,
                        "icons" : false
                    },
                    "plugins" : [ "themes", "json_data", "search", "adv_search", "ui", "contextmenu" ],
                    "search" : {
                        case_insensitive : true,
                        show_only_matches : true,
                        search_method : "contains"
                    },                    
                    "json_data":{
                        "data"  : str
                    },
                    callback: {
                        onchange: function(NODE, TREE_OBJ) {
                            $("#hidden_field").val(NODE.id);
                            alert(NODE.id);
                        }
                    }
                });
                $("#tree").bind('select_node.jstree', function (event, data) {
                    //var selectedNode = $.data(data.rslt.obj[0], "jstree");
                    if(data.rslt.obj[0].type=='category')
                        populateCategoryProduct(data.rslt.obj[0].id);
                    else
                        populateSubCategoryProduct(data.rslt.obj[0].id);
                });

                populateCategoryProduct(1);
                //                $("#tree").jstree("set_theme","apple");
            });

  
            function populateCategoryProduct(id)
            {
                $.ajax({
                    type:       "get",
                    url:        "getCategoryParts",
                    data:       {categoryId: id},
                    success:    function(msg) {
                       
                        var data = eval('('+msg+')');
                        var html = '';
                        var nhtml = '';
                        var len = data.length;
                        for (var i = 0; i< len; i++) {
                            html += getProductHtml(data[i]);
                            nhtml +=getPartHtml(data[i]);
                        }
                        $("#products").html(html);
                        $("#parts").html(nhtml);
                    }
                });
                return false;
            }

            function populateSubCategoryProduct(id)
            {
                $.ajax({
                    type:       "get",
                    url:        "getSubCategoryParts",
                    data:       {subcategoryId: id},
                    success:    function(msg) {
                       
                        var data = eval('('+msg+')');
                        var html = '';
                        var nhtml = '';
                        var len = data.length;
                        for (var i = 0; i< len; i++) {
                            html += getProductHtml(data[i]);
                            nhtml +=getPartHtml(data[i]);
                        }
                        $("#products").html(html);
                        $("#parts").html(nhtml);
                    }
                });
                return false;
                
            }

            function getProductHtml(product)
            {
                var html="<div class='product'>";
                html+="<div class='productLogo'></div>";
                html+="<div class='productImage'>";
                if(product.images.length>0)
                {
                    html+="<img src='getImage?imageId="+product.images[0].id+"'/>";
                }
                else
                    html+="<img src='images/default.png'/>";
                html+="</div>";
                html+="<div class='productDetail'>";
                html+="<a href='viewProduct?productId="+product.id+"'>"+product.partNo+" </a>";
                html+="    <br>";
                html+="<div class='productDesc'>"+ product.description+" </div>";
                html+="</div>";
                html+="</div>"
                return html;
            }
            
            
            function getPartHtml(part)
            {
                var html="<div class='part' style='background-color: #333; padding:10px; background: #00ff'>";
                html+="<div class='partImage'>";
                html+="<a href='viewPart?partId="+part.id+"'>";
                if(part.images.length>0)
                {
                    html+="<img src='getImage?imageId="+part.images[0].id+"&imageType=2'/>";
                }
                else
                    html+="<img src='images/no-product-image.jpg'/>";
                    
                html+="</a>";
                html+="</div>";
                html+="<div class='partDetail'>";
                html+="<h2><a href='viewPart?partId="+part.id+"'>"+part.partNo+" </a></h2>";
                html+="<div class='partDesc'>"+part.description+"</div>";
                html+="</div>";
                html+="</div>";
                return html;

            }
            
            function getCategoryHighlitedHtml(category)
            {
                var html="<tr onclick='return setCategory("+category.attr.id+")'>";
                html+="<td colspan='2' class='nav_highlighted_blue'>";
                html+="<table width='261' border='0' cellspacing='0' cellpadding='3'>";
                html+="<tr>";
                html+="<td width='20' height='34' align='center'><img src='images/white_arrow.png' width='4' height='5' alt='' /></td>";
                html+="<td width='192'><a style='cursor:pointer'>"+category.data.title+"</a></td>";
                html+="<td width='31' align='center'><img src='images/down_arrow.png' width='9' height='5' alt='' /></td>";
                html+="</tr>";
                html+="</table>";
                html+="</td>";
                html+="</tr>";
                return html;
            }
            function getCategoryHtml(category)
            {
                var html="<tr onclick='return setCategory("+category.attr.id+")'>";
                html+="<td colspan='2' class='nav_highlighted_dark'>";
                html+="<table width='261' border='0' cellspacing='0' cellpadding='3'>";
                html+="<tr>";
                html+="<td width='20' height='34' align='center'><img src='images/white_arrow.png' width='4' height='5' alt='' /></td>";
                html+="<td width='192'><a style='cursor:pointer' >"+category.data.title+"</a></td>";
                html+="<td width='31' align='center'><img src='images/right_arrow.png' width='5' height='9' alt='' /></td>";
                html+="</tr>";
                html+="</table>";
                html+="</td>";
                html+="</tr>";
                return html;
            }

            function getCategoryChildHtml(catChild)
            {
                var html="<tr onclick='return setSubCategory("+catChild.attr.id+")'>";
                html+="<td width='28' class='nav_normal'>&nbsp;</td>";
                html+="<td width='233' align='left' valign='middle' class='nav_normal'>";
                html+="<table width='237' border='0' cellspacing='0' cellpadding='0'>";
                html+="<tr>";
                html+="<td width='17' height='36' align='left'><img src='images/white_arrow.png' width='4' height='5' alt='' /></td>";
                html+="<td width='220'><a style='cursor:pointer'>"+catChild.data.title+"</a></td>";
                html+="</tr>";
                html+="</table>";
                html+="</td>";
                html+="</tr>";
                return html;
            }
            

        </script>
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="common/header.jspf" />

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="29%" valign="top">
                                        <table width="69%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td colspan="3" align="center" valign="middle" class="nav_top_bg">MEXAM - BUY &amp; SELL</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="center" class="nav_middle_bg">
                                                    <table id="listParts" width="261" border="0" cellspacing="0" cellpadding="0" style="padding-left:5px; padding-right: 5px">

                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="center" valign="middle" class="nav_bottom_bg" style="height:10px"></td>
                                            </tr>

                                        </table></td>
                                    <td width="71%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="70%" valign="top" class="Buy_sell_banner"><table width="300" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="24" height="164">&nbsp;</td>
                                                            <td width="139">&nbsp;</td>
                                                            <td width="137">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">&nbsp;</td>
                                                            <td align="left"><a href="#"><img src="images/read_more.png" alt="" width="98" height="26" border="0" /></a></td>
                                                            <td align="left"><a href="#"><img src="images/read_more.png" alt="" width="98" height="26" border="0" /></a></td>
                                                        </tr>
                                                    </table></td>
                                                <td width="30%" align="right" valign="bottom"><img src="images/ad_banner.jpg" width="199" height="215" alt="" /></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="34" colspan="2" align="center"><h1 id="listTitle">PRODUCTS</h1></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center"><img src="images/under_line.jpg" width="553" height="16" alt="" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" bgcolor="#333333">
                                                    <div id='parts' style="background-color: #333; height: auto;">
                                                        <div class='product' style="background-color: #333; padding:10px; background: #00ff">
                                                            <div class='productImage'>
                                                                <a href="images/tavolini-1-b.jpg">
                                                                    <img src="images/default.png" alt="" width="192" style="border:3px solid #ccc;" height="192" border="0">
                                                                </a>
                                                            </div>
                                                            <div >
                                                                <h2><a href=""> WLC Series </a></h2>
                                                                <div class="productDesc">Waterline Controls Electronic Water Level Control System</div>
                                                            </div>
                                                        </div>
                                                    </div>
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
                
                 <jsp:include page="common/adFooter.jspf" />
<!--                <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                </table>-->

            </div>
        </div>
        <jsp:include page="common/footer.jspf" />
    </body>
</html>
