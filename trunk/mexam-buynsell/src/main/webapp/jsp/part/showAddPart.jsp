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
        <script type="text/javascript" src="js/multiselect/ui.multiselect.js"></script>
        <link rel="stylesheet" href="css/tabs.css" type="text/css" />        
        <script type="text/javascript">
            
            var subCatId=0;
            $(function(){
                $(".multiselect").multiselect();
                $(".multiselect").multiselect({sortable: false, searchable: false});
            });
            
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
            
            $(document).ready(function() {
                getCategories();
            });
            
        </script>


        <title>Mexam BuynSell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jspf" />
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Login</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="formContainder">
                    <form method="POST" action="">
                        <div style="float: left; width: 100%">
                            <div style="float: left; height: 400px"> 
                                <select id="countries" size="25" style="width: 250px; " onchange="getSubCategories(this.value)">
                                </select>
                            </div>
                            <div style="float: left; height: 400px"> 
                                <select id="subcategories" size="25" style="width: 250px;" onchange="showAddButton(this.value)">
                                </select>                
                                <s:textfield name="subCategoryId" id="subCategoryId" cssStyle="display:none" />
                            </div>
                            <div style=""> 
                                <div>
                                    <input id="buttonAddNew" type="button" value="Add New" style="display: none" onclick="redirect()" >
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
