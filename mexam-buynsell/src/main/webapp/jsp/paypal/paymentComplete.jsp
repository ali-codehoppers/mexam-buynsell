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

        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/print.css" rel="stylesheet" type="text/css" media="print" />
        <style>
            span
            {
                font-size: 16px;
                margin: 10px;
            }
            .billLayout{
                color:#626262;
                border:1px solid #77A2E0;
                padding:15px;
            }
            .billLayout legend{
                color:#77A2E0;
                font-weight: bold;
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
                        <h1 style="width: 100%; text-align: center" id="listTitle">Payment Receipt</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="listContainer" style="margin:auto; width:500px; margin-top: 25px; font-size: 16px;">

                    <div style="text-align: center; min-width: auto; margin: 10px; font-size: 18px;"><b>Payment Completed</b> <b style="color:green">Successfully.</b></div>
                    <br/>

                    <fieldset class="billLayout">
                        <legend>Customer Info</legend>
                        <div><b>Name</b>: ${firstName} ${lastName}</div>
                        <div><b>Card Type</b>: ${creditCardType}</div>
                        <div><b>Card No</b>: ${secureCreditCardNumber}</div>
                    </fieldset>
                    <br/>
                    <fieldset class="billLayout">
                        <legend>Billing Address</legend>
                        <div><b>Address</b>: ${address1}, ${address2}</div>
                        <div><b>City</b>: ${city}</div>
                        <div><b>State</b>: ${state.name}</div>
                        <div><b>Zip Code</b>: ${zip}</div>
                        <div><b>Country</b>: United States</div>
                        <div><b>Amount</b>: ${amount} USD</div>
                    </fieldset> 

                    <div style="width: 400px; margin: auto">
                        <a href="javascript:window.print()" class="btn" style="min-width: 100px; color: #3a3a3a; margin-top: 25px;">Print Receipt</a>
                        <a href="home" class="btn" style="min-width: 100px; color: #3a3a3a; margin-top: 25px;">Continue</a>
                        <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
