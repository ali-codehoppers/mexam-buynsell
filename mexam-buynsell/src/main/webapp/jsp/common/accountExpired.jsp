<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="errortags" prefix="ch"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>        
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.16.custom.css"/> 
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <script type="text/javascript" src="js/grid/i18n/grid.locale-en.js"></script>                                
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>                

        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>
            span
            {
                font-size: 16px;
                margin: 10px;
            }

        </style>

        <script type="text/javascript">
      
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>

        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="Home"/>
        </jsp:include>

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">Access Denied/ Account Expired</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="listContainer" style="margin: auto; width: 900px; margin-top: 25px; font-size: 16px;">
                    <div style="text-align: center; min-width: 900px; margin: 10px; font-size: 18px;"><b>The content you are trying to access is blocked, because your membership is expired.</b></div>
                    <br/>
                    <div style="text-align: center">Please <a href="payPayment" style="font-size: 16px;">renew your membership</a></div>
                    <div style="text-align: center"><br/>OR</div>
                    <div style="text-align: center"><br/>If you have paid membership fee and still getting this message, contact support center.</div>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
