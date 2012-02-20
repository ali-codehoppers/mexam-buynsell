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
                        <h1 style="width: 100%; text-align: center" id="listTitle">Registration Complete</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="listContainer" style="margin: auto; width: 650px; margin-top: 25px; font-size: 16px;">
                    You company has been successfully registered. However you will not be able to use any of the functionality until you pay your membership fee. 
                    Please <a href="showLogin" style="color: #00a2d7; font-size: 14px;"> login</a> and pay your membership fee.
                </div>


                
                <div style="width: 200px; margin: auto;">
                    <a href="showLogin" class="btn" style="min-width: 80px; color: #3a3a3a; margin-top: 25px;">Continue</a>
                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
