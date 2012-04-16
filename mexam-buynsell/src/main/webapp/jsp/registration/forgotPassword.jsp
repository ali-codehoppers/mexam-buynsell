<%-- 
    Document   : forgotPassword
    Created on : Mar 26, 2012, 4:37:45 PM
    Author     : Muaz
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />    
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <script type="text/javascript" src="js/grid/i18n/grid.locale-en.js"></script>                                
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>  
        <title>Buy &amp; Sell - Forgot Password</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="none"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;height: 100%" >
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h3 style="width: 100%; text-align: center" id="listTitle">Forgot Password</h3>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="formContainder" style="width:100%;text-align:center;margin-left: 50px;" >
                    <div>
                        Please enter your email address and your username and password will be email to you. 
                    </div> 
                    <br/>
                    <div>
                        <b>Email</b>: <input type="text" />
                        <br/>
                        <br/>
                        <a href="emailForgotPassword" class="btn" style="float:none">Ok</a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
