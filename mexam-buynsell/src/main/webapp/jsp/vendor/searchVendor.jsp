<%@page import="com.mt.hibernate.entities.User"%>
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
            .searchBox
            {
                margin: 5px;
                color: #000;
                background-color:#DDDDDD;
                border: 1px solid #999999;
            }

            .searchBox_Top
            {
                border: 1px solid #999999;
                padding: 10px;
            }

            .searchBox_Image
            {
                height: auto;
                width: 125px;
                padding: 0px;
                margin: 0px
            }

            .item_Title
            {
                float: left;
                min-width: 60%;
                font-size: 18px;
                font-weight: bold;
                padding-bottom: 5px;
            }

            .item_Price
            {
                float: left;
                min-width: 40%;
                font-size: 16px;
                font-weight: bold;
                text-align: right;
            }

            .item_Cond
            {
                float: left;
                min-width: 15%;
                font-size: 16px;
                font-weight: bold;
                text-align: right;
            }


            .item_desc
            {

            }

            .item_desc_label
            {
                font-size: 13px; 
                font-weight: bold;
                color: #000;
                float: left;
                padding-right: 5px; 

            }
            div#menu {
                top:40px;
                left:0px;
                width:100%;
                background:transparent url(css/images/header_bg.gif) repeat-x 0 0;  
            }

        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                                    
                var mydata = eval(${searchResultJson}); 
                for(var i=0;i<mydata.length;i++)
                { 
                    $("#vendorList").append(getItemHtml(mydata[i]));
                }
                $("#messageInfo").hide();
            });
            
            function hideSuccess()
            {
                $("#messageInfo").hide();
            }
            function hideSuccess(id)
            {
                $("#messageInfo"+id).hide();
            }
            
            
            function AddVendor(id)
            {
                $.ajax({
                    type:       "get",
                    url:        "addVendorAjax",
                    data:       {vendorId:id},
                    success:    function(msg) {
                        if(msg.length>0)
                        {
                            $("#successMsg"+id).html(msg);
                            $("#messageInfo"+id).show();
                            setTimeout("hideSuccess("+id+")", 3000);
                        }
                        else
                            $("#messageInfo"+id).hide();
                    }
                });
            }
            
            function submitForm()
            {
                $("#searchVendor").submit();
            }
            
            function getItemHtml(item)
            {
            
                var ghtml="<table id='messageInfo"+item.id+"' width='100%' border='0' cellspacing='0' cellpadding='0' style='display:none;'>";
                ghtml+="<tr>";
                ghtml+="<td width='6%' align='right'><img src='images/success_left.jpg' alt='' width='38' height='34' /></td>";
                ghtml+="<td id='successMsg"+item.id+"' width='88%' align='left' class='success_msg'></td>";
                ghtml+="<td width='5%' align='right' class='success_msg'><a href='#'><img src='images/success_cross.jpg' alt='' width='18' height='18' border='0' onclick='hideSuccess("+item.id+")'/></a></td>";
                ghtml+="<td width='1%' align='left'><img src='images/success_right.jpg' alt='' width='6' height='34' /></td>";
                ghtml+="</tr>";
                ghtml+="</table>";
                var html=ghtml;
                html+="<div class='searchBox'>";
                html+="<div class='searchBox_Top'>";
                html+="<div style='float: left; width: 15%'>";
                html+="<div class='searchBox_Image'>";
                html+="<img style='width: 90%' src='images/default.png'/>";
                html+="</div>";
                html+="<div style='font-size: 10px'>";
                html+="Created: "+item.date;
                html+="</div>";
                html+="</div>";
                html+="<div style='float: left; margin-left: 20px; width: 80%'>";
                html+="<div id='item_title' style='width: 100%; color: #083152;'>";
                html+="<div class='item_Title' >";
                html+=item.name;
                html+="</div>";
                html+="<div class='item_Price'>";
                html+=item.stateString+" - "+item.countryString;
                html+="</div>";
                html+="</div>";
                html+="<div>";
                html+="<div style='float: left; width: 70%'>";
                html+="<div class='item_desc_label'>";
                html+="City : ";
                html+="</div>";
                html+="<div style='float: left;font: 14px; color: #083152;'>";
                html+=item.city;
                html+="</div>";
                html+="<div style='clear: both'>";
                html+="</div>";
                html+="<div class='item_desc_label'>";
                html+="Address : ";
                html+="</div>";
                html+="<div style='float: left;font: 14px; color: #083152;'>";
                html+=item.address;
                html+="</div>";
                html+="<div style='clear: both'>";
                html+="</div>";
                html+="</div>";

                html+="<div style='float: left; width: 30%'>";
                html+="<div style='float:left; margin-top: 10%; float: right; margin:auto'>";
            <% if (session.getAttribute("user") != null) {%> 
                    html+="<div style='text-align: center; height: auto;'>";
                    html+="<a href='javascript:AddVendor("+item.id+")' class='btn' style='text-align: center;'>Add Vendor</a>";
                    html+="</div>";
            <% }%>        
                    html+="</div>";
                    html+="</div>";
                    html+="</div>";
                    html+="</div>";
                    html+="<div style='clear: both'>";
                    html+="</div>";
                    html+="</div>";
                    html+="<div style='border: 1px solid #999999;'>";
                    html+="<div style='padding: 8px; padding-left: 10px'>";
                    html+=item.companyName;
                    html+="</div>";
                    html+="</div>";
                    html+="</div>";
                    return html;
                }
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jspf" >
            <jsp:param name="currentTab" value="vendor"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Search Vendors</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="searchBar">
                    <form id ="searchVendor" method="GET" action="searchVendor">
                        <div>
                            <div style="float: left; width: 70%; margin: 5px; text-align: right">                        
                                <input name="searchString" class="field_big" style="font-size: 20px; height: 25px; padding: 5px; min-width: 80%;  border-radius:8px;"/>
                            </div>
                            <div style="float: left; width: 250px; margin: auto; height: 100px; padding: 5px">
                                <a href="javascript:submitForm()" class="btn" style="width: 120px; text-align: center; padding: 2px; padding-top: 8px;">Search</a>
                                <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </form>
                </div>

                <table id="messageInfo" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="6%" align="right"><img src="images/success_left.jpg" alt="" width="38" height="34" /></td>
                        <td id="successMsg" width="88%" align="left" class="success_msg"></td>
                        <td width="5%" align="right" class="success_msg"><a href="#"><img src="images/success_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideSuccess()"/></a></td>
                        <td width="1%" align="left"><img src="images/success_right.jpg" alt="" width="6" height="34" /></td>
                    </tr>
                </table>

                <div id="searchResult">
                    <div id="vendorList">
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jspf" />
    </body>
</html>

