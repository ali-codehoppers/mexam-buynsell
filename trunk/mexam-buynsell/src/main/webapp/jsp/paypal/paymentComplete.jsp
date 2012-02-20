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
                        <h1 style="width: 100%; text-align: center" id="listTitle">Payment Receipt</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="listContainer" style="margin: auto; width: 900px; margin-top: 25px; font-size: 16px;">

                    <div style="text-align: center; min-width: 900px; margin: 10px; font-size: 18px;"><b>Payment completed successfully.</b></div>
                    <br/>

                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            First Name:
                        </div>                        
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">      
                            ${firstName}
                        </div>
                        <div style="clear: both"></div> 
                    </div>
                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            Last Name:
                        </div>                        
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">      
                            ${lastName}
                        </div>
                        <div style="clear: both"></div> 
                    </div>


                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            Payment Types:
                        </div>                        
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">      
                            ${creditCardType}
                        </div>
                        <div style="clear: both"></div> 
                    </div>
                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            Card Number:
                        </div>                        
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">      
                            ${secureCreditCardNumber}
                        </div>
                        <div style="clear: both"></div> 
                    </div>

                    <br>
                    <div style="clear: both"></div> 
                    <div style="margin-left: 35%; margin-top:15px;">
                        <span style="font-weight: bold; font-size: 14px;"> Billing Address:</span>
                        <div style="clear: both"></div> 
                    </div>
                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            Address 1:
                        </div>                        
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">      
                            ${address1}
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            Address 2:
                        </div>   
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">                     
                            ${address2}
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            City:
                        </div>   
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">                     
                            ${city}
                        </div>
                        <div style="clear: both"></div>
                    </div>

                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            State:
                        </div>    

                        <div style="float: left; width: 48%; margin: 5px; color: #555555">                     
                            ${state}
                        </div>
                        <div style="clear: both"></div>
                    </div>

                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            ZIP Code:
                        </div>    
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">                     
                            ${zip}
                        </div>
                        <div style="clear: both"></div>
                    </div>

                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            Country:
                        </div>                        
                        <div style="float: left; width: 48%; margin: 5px;"> 
                            United States
                            <div style="clear: both"></div> 
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 48%; margin: 5px; text-align: right; vertical-align: middle;">                        
                            Amount:
                        </div>                        
                        <div style="float: left; width: 48%; margin: 5px; color: #555555">                     
                            ${amount}
                        </div>
                        <div style="clear: both"></div>                     
                    </div>

                    <div style="width: 200px; margin: auto">
                        <a href="home" class="btn" style="min-width: 100px; color: #3a3a3a; margin-top: 25px;">Continue</a>
                        <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
