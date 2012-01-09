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
            var error = "${error}";
            $(document).ready(function () {
                if(error && error.length>0)
                {
                    $("#messageError").show();
                    $("#errorMsg").html(error);
                }     
                else
                {
                    $("#messageError").hide();                        
                }
            });
            
            function submitForm()
            {
                $("#login").submit();
            }
            
            function hideError()
            {
                $("#messageError").hide();
            }
            
        </script>
        <title>Buy & Sell</title>
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
                    <div id="messageContainer" style="margin: auto">
                        <table id="messageError" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="6%" align="right"><img src="images/error_left.jpg" alt="" width="38" height="34" /></td>
                                <td id="errorMsg" width="88%" align="left" class="error_msg"></td>
                                <td width="5%" align="right" class="error_msg"><a href="#"><img src="images/error_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideError()"/></a></td>
                                <td width="1%" align="left"><img src="images/error_right.jpg" alt="" width="6" height="34" /></td>
                            </tr>
                        </table>
                    </div>
                    <form id ="login" method="POST" action="login">
                        <div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    User Name:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input class="field_big" name="userName"/>
                                </div>
                            </div>

                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Password:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input type="password" class="field_big" name="password"/>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div style="margin-left: 48%;  padding: 5px">
                                <a href="javascript:submitForm()" class="btn" style="width: 100px; text-align: center; padding: 2px; padding-top: 8px; margin-top: 25px;">Login</a>
                                <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <div style="clear: both"></div> 

                    </form>

                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jspf" />
    </body>
</html>
