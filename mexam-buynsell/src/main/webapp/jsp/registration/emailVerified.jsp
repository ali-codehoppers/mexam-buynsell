<%-- 
    Document   : emailVerified
    Created on : Apr 16, 2012, 6:56:25 PM
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
        <title>Buy &amp; Sell - Email Sent</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="none"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;height: 100%" >
            <div id="content" style="width:100%;text-align:center;padding-top: 150px ">
                An Email with the new password has been sent to <b><%=session.getAttribute("emailInCheck").toString()%></b>
            </div>
            <br/>
            <div id="content" style="width:100%;text-align: center;">
                <a href="home" class="btn" style="float:none">Continue</a>
            </div>

        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
