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
            var infoMessage = "${info}";
            var errorMessage = "${error}";
            var successMessage = "${message}";
            
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
                            $("#countries").append(html);
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
            
            
            function showAddButton(value)
            {
                subCatId=value;
                $("#subCategoryId").val(value);
                $("#buttonAddNew").show();
            }
            
            function redirect()
            {
                var redirectURL = "showAddPartInfo?subCategoryId="+subCatId;
                window.location.href = redirectURL;
            }
            
            $(document).ready(function () {
                //alert(conditions);
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

                <div id="formContainder" style="margin-left: 50px;">
                    <form id ="formInventory" method="POST" action="addInventory">
                        <div style="float: left; width: 70%; margin: auto; margin-left: 40px">
                            <div style="float: left; height: 400px; width:40%; margin: auto"> 
                                <select id="countries" size="20" style="width: 250px; " onchange="getSubCategories(this.value)">
                                </select>
                            </div>
                            <div style="float: left; height: 400px; width:40%; margin: auto"> 
                                <select id="subcategories" size="20" style="width: 250px;" onchange="showAddButton(this.value)">
                                </select>                
                                <input id="subCategoryId" name="subCategoryId" id="subCategoryId" style="display:none" />
                            </div>
                            <div style="float: left; width: 20%"> 
                                <div style="width: 100px; margin: auto">
                                    <a id="buttonAddNew" href="javascript:redirect()" class="btn" style="display: none">Add New</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
