<%-- 
    Document   : addProduct
    Created on : Nov 4, 2011, 11:55:06 AM
    Author     : CodeHopper
--%>
<%@page import="com.mt.hibernate.entities.User"%>
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
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <script type="text/javascript" src="js/grid/i18n/grid.locale-en.js"></script>                                
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>    
        <script type="text/javascript" src="js/userDashboard.js"></script>    
        <title>Buy &amp; Sell - Dashboard</title>
        <style>
            .myClass{
                /*float:left;
                 border: 1px solid black;*/
                width:auto;
                height: 30%;
                padding:10px;
                margin:5px;
            }
            .submitBtn2{
                display:inline-block;
                line-height:35px;
                color:#B2B2B2;
                font-weight:bold;
                font-size:13px;
                text-shadow:0 1px 0 #fff;
                margin-top: 5px;
                border:1px solid #DFDFDF;

                -moz-border-radius:8px;
                -webkit-border-radius:8px;
                border-radius:8px;
                text-align: center;
                width: 50px;
                height: 37px;
                padding:0px;

            }
            .submitBtn2:hover {
                color:#333;
                border-color:#cacaca;
                background:#F8F8F8;
                text-align: center;
            }
            a.dark:hover{
                color:#666666;
                text-decoration: underline;
            }
        </style>
        <script type="text/javascript">
           
        
        
        </script>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="user"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;height: 100%" >
            <div style="float:left">
                <div class="accordion" style="width: 250px;padding-top: 20px">
                    <h3><a href="#">Search</a></h3>
                    <div>
                        <div>Search Parts:</div>
                        <div><input type="text"/></div>
                        <div style="text-align:center"><input type="button" class="submitBtn2" value="Go" /></div>
                    </div>
                </div>
                <div class="accordion" style="width: 250px;padding-top: 0px">
                    <h3><a href="#">Info</a></h3>
                    <div>
                        <div><b>Comapany</b>:</div>
                        <div><%= ((User) session.getAttribute("user")).getCompany().getName()%></div>
                        <div><b>Manager</b>:</div>
                        <div><%=((User) session.getAttribute("user")).getFirstName()%> <%=((User) session.getAttribute("user")).getLastName()%></div>
                        <div><b>Category</b>:</div>
                        <div><%=((User) session.getAttribute("user")).getCompany().getCompanyCategory()%></div>
                        <div><b>Location</b>:</div>
                        <div><%=((User) session.getAttribute("user")).getCompany().getCity()%>, <%=((User) session.getAttribute("user")).getCompany().getState().getName()%></div>
                        <div style="text-align: right;font-size: 10pt"><a href="editUser" class="dark">Edit</a></div>
                        <hr/><br/>
                        <div>Total Inventory: <s:property value="totalInventory" /></div>
                        <div>Favorite Vendors: <s:property value="totalVendors" /></div>
                    </div>
                </div>
                <div class="accordion" style="width: 250px;padding-top:0px">
                    <h3><a href="#">Recent Activity</a></h3>
                    <div>
                        <div>New Inventory: <s:property value="latestInventory" /> </div>
                        <div>New Favorites: <s:property value="latestVendors" /> </div>
                        <div>New Messages: 0</div>
                        <div>New RFQ Received: <s:property value="latestRFQsReceived" /> </div>
                        <div>New RFQ Sent: <s:property value="latestRFQsSent" /></div>

                    </div>
                </div>
            </div>    
            <div style="float:left">
                <div id="title"> 
                    <div style="margin:auto">
                        <h3 style="width: 100%; text-align: center" id="listTitle">Latest Activity</h3>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="content">
                    <div>
                        <div class="myClass" style="padding-bottom:2px">
                            <table id="messagesLatest"></table>
                            <div id="pager_messagesLatest"></div>
                        </div> 
                        <div class="myClass" style="padding-top:0px">

                            <div id="tabsLatest" style="width: auto">

                                <div id="received" style="padding-bottom:7px;margin: auto;">
                                    <table id="rfqsListReceivedLatest"></table>
                                    <div id="pager_rfqsListReceivedLatest"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                                <div id="sent" style="margin: auto">
                                    <table id="rfqsListSentLatest"></table>
                                    <div id="pager_rfqsListSentLatest"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div style="clear:both"></div>
                    </div>
                </div>
                <div id="title"> 
                    <div style="margin:auto">
                        <h3 style="width: 100%; text-align: center" id="listTitle">Activity for Last 7 Days</h3>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="content">
                    <div>
                        <div class="myClass" style="float: left">
                            <table id="inventoryList"></table>
                            <div id="pager_inventoryList"></div>
                        </div> 
                        <div class="myClass" style="float: left">
                            <table id="vendorList"></table>
                            <div id="pager_vendorList"></div>
                        </div> 
                        <div style="clear:both"></div>
                    </div>
                    <div>
                        <div class="myClass">
                            <table id="messagesWeek"></table>
                            <div id="pager_messagesWeek" ></div>
                        </div> 
                        <div class="myClass">

                            <div id="tabsWeek" style="width: auto">
                                <ul>
                                    <li><a href="#received"><span>RFQ Received</span></a></li>
                                    <li><a href="#sent"><span>RFQ Sent</span></a></li>
                                </ul>
                                <div id="received" style="margin: auto">
                                    <table id="rfqsListReceivedWeek"></table>
                                    <div id="pager_rfqsListReceivedWeek"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                                <div id="sent" style="margin: auto">
                                    <table id="rfqsListSentWeek"></table>
                                    <div id="pager_rfqsListSentWeek"></div>
                                    <div style="clear: both">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div style="clear:both"></div>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
