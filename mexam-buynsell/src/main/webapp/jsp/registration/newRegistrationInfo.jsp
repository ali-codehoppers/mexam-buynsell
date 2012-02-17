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
        <link href="css/css_sheet.css" rel="stylesheet" type="text/css" />
        <style>
            .infoSection
            {
                margin-top: 20px;

            }
            .infoTitle
            {
                margin: 10px;
                font-size: 19px;
                color: #77A2E0;
            }
            .infoDesc
            {
                font-size: 15px;
                margin-left: 15px;
            }

            .infoSection li
            {
                margin: 5px;
                margin-top:8px;
                margin-bottom: 8px;
                type:circle;
            }

        </style>

        <script type="text/javascript">
 
            function submitForm()
            {
                $("#register").submit();
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
                        <h1 style="width: 100%; text-align: center" id="listTitle">New Registration</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="infoContainer" style="width: 650px; margin: auto">
                    <div class="infoSection"> 
                        <div class="infoTitle">
                            Register and Start Selling Today
                        </div>
                        <div class="infoDesc">

                            <span style="font-size: 15px"> Please have the following before you begin:</span>
                            <br/>
                            <ul style="margin-left: 50px; margin-top: 10px;">
                                <li>Your business name, address, and contact information.</li>
                                <li>An internationally-chargeable credit card with valid billing address.</li>
                                <li>A phone number where you can be reached during this registration process.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="infoSection"> 
                        <div class="infoTitle">
                            Important Notice for International Sellers
                        </div>
                        <div class="infoDesc">
                            <span style="font-size: 15px">If you are registering from a country which is outside of the United States, there are important steps you must take before you begin selling on our Buy-n-Sell website to ensure a great experience for you and for customers. These steps include:</span>
                            <ul style="margin-left: 50px; margin-top: 10px;">
                                <li>You will have to provide a bank account in a country supported by Paypal in order to be paid.</li>
                                <li>You must accurately state the 'shipping from' country in your Buy-n-Sell seller profile for display to customers.</li>
                                <li>You will be responsible for assuring that you will meet the shipping expectations for all orders you receive.</li>
                                <li>Products must be listed in US Dollars.</li>
                                <li>All customer facing content and communications must be in English.</li>
                                <li>You should understand the laws that apply to you as a seller on our website and only list, sell, and export products that comply with those laws.</li>
                            </ul>
                        </div>
                    </div>
                    
                     <div style="width: 100px; margin: auto; margin-top: 20px">
                         <a href="showRegistration" class="btn" style="color: #000; min-width: 120px; text-align: center">Continue</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>
                    
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>

