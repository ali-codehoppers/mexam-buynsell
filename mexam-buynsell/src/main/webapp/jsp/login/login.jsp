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
            .fieldError
            {
                color: red;
                margin: 2px;
                margin-left: 15px;
                margin-right: 5px;

            }
            .link a{
                color:black;
            }
            .link a:hover{
                text-decoration: underline;
            }
            .submitBtn2{
                float:left;
                display:inline-block;
                line-height:35px;
                color:#B2B2B2;
                font-weight:bold;
                font-size:13px;
                text-shadow:0 1px 0 #fff;
                border:1px solid #DFDFDF;
                margin:25px 5px 5px 0;
                -moz-border-radius:8px;
                -webkit-border-radius:8px;
                border-radius:8px;
                text-align: center;
                width: 100px;
                height: 37px;
                padding:0px;

            }


            .submitBtn2:hover {
                color:#333;
                border-color:#cacaca;
                background:#F8F8F8;
                text-align: center;
            }

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
                $("#loginFormComp").hide(); 
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


        <jsp:include page="../common/header.jsp" />

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
                    <s:form id ="login" method="POST" action="login" theme="simple">
                        <div>

                            <!--                            <div>
                                                            <div style="float: left; margin: 5px; text-align: left; vertical-align: middle; margin-left: 30%; color: #cd0a0a">                        
                            <s:fielderror ></s:fielderror>
                        </div>                        
                        <div style="clear: both"></div>
                    </div>-->

                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    User Name :
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">                        
                                        <input class="field_big" name="userName"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <s:fielderror theme="simple"><s:param>userName</s:param></s:fielderror>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>

                            </div>

                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Password:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">  
                                        <input type="password" class="field_big" name="password"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <s:fielderror theme="simple"><s:param>password</s:param></s:fielderror>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    <input type="checkbox" name="rememberMe" id="rememberMe" value="true" />
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <div style="float: left;">  
                                        <label for="checkbox">Remember Me</label>
                                    </div>
                                    <div style="clear: both"></div> 

                                    <!--  <div style="clear: both"></div> -->

                                </div>
                                <div style="clear: both"></div> 

                            </div>
                            <div>
                                <div class="link" style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">
                                    <a href="#"  style="font-size:10pt">Forgot Password?</a>
                                </div>
                                <div class="link" style="float: left; width: 48%; margin: 5px;">
                                    <a href="showRegistrationInfo"  style="font-size:10pt">Sign Up</a>
                                </div>
                                <div style="clear: both"></div> 
                            </div>
                        </div>

                        <div>
                            <div style="margin-left: 48%;  padding: 5px">
                                <button type="submit" class="submitBtn2" style="">Login</button>
                              
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <div style="clear: both"></div> 
                    </s:form>

                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
