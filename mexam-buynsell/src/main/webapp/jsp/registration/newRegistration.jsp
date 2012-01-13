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
            var countries = eval(${countriesJson});
            var companyCategories = eval(${categoriesJson});
            var infoMessage = "${info}";
            var errorMessage = "${error}";
            var successMessage = "${message}";
            
 
            $(document).ready(function () {
                
                countriesHtml="";
                for (var i = 0; i< countries.length; i++) {
                    countriesHtml += '<option value="' + countries[i].id + '">' + countries[i].name + '</option>';
                }
                $("#country").html(countriesHtml);
                
                companyCategoriesHtml="";
                for (var i = 0; i< companyCategories.length; i++) {
                    companyCategoriesHtml += '<option value="' + companyCategories[i].id + '">' + companyCategories[i].description + '</option>';
                }
                $("#companyCategory").html(companyCategoriesHtml);
                
                //alert(conditions);
                if(infoMessage && infoMessage.length>0)
                {
                    $("#messageInfo").show();
                    $("#infoMsg").html(infoMessage);
                }
                else
                {
                    $("#messageInfo").hide();
                }
                if(errorMessage && errorMessage.length>0)
                {
                    $("#messageError").show();
                    $("#errorMsg").html(errorMessage);
                }
                else
                {
                    $("#messageError").hide();
                }
                if(successMessage && successMessage.length>0)
                {
                    $("#messageSuccess").show();
                    $("#successMsg").html(successMessage);
                }     
                else
                {
                    $("#messageSuccess").hide();                        
                }
                populateStates(1);

            });
            function submitForm()
            {
                $("#register").submit();
            }
            
            function hideInfo()
            {
                $("#messageInfo").hide();
            }
            function hideError()
            {
                $("#messageError").hide();
            }
            function hideSuccess()
            {
                $("#messageSuccess").hide();
            }
            
            function populateStates(id){
                if(id && id > 0)
                {
                    $.ajax({
                        type:       "get",
                        url:        "getStates",
                        data:       {countryId: id},
                        success:    function(msg) {
                            var data = eval('('+msg+')');
                            var html = "";
                            var len = data.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                            }
                            $('#state').html(html);
                        }
                    });
                }
                return false;
            }
            
            
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jspf" />
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">

                <div>
                    <jsp:include page="../common/messages.jspf" />
                </div>

                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">New Registration</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="formContainder" style="margin-left: 50px;">
                    <form id ="register" method="POST" action="register">

                        <h3 style="width: 100%; text-align: center">Required Company Information</h3>

                        <div>
<!--                             <div>
                                <div style="float: left; margin: 5px; text-align: left; vertical-align: middle; margin-left: 30%; color: #cd0a0a">                        
                                    
                                </div>                        
                                <div style="clear: both"></div>
                            </div>-->

                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Name:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="name" name="name" class="field_big"/>
                                    <s:fielderror ><param>userName</param></s:fielderror>
                                </div>
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Address:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <textarea id="address" name="address" class="field_big" style="min-height: 75px; min-width: 250px; "></textarea>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    City:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="city" name="city" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Country:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <select id="country" name="country" class="field_big" style="min-width: 20%" onchange="javascript:populateStates(this.value)">                       
                                    </select>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    State:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <select id="state" name="state" class="field_big" style="min-width: 20%">                       
                                    </select>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Phone Number:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input name="phoneNo" id="phoneNo" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Fax Number:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input name="faxNo" id="faxNo" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Zip:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input name="zip" id="zip" class="field_big"/>
                                </div>
                            </div>

                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Web Address:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input name="webAddress" id="webAddress" class="field_big"/>
                                </div>
                            </div>    
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Company Category:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <select id="companyCategory" name="companyCategory" class="field_big" style="min-width: 20%">                       
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both">
                        </div>
                        <div style="margin-top: 50px">
                            <h3 style="width: 100%; text-align: center">Company Administrator</h3>

                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Name:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="fistName" name="fistName" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Email:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="email" name="email" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    User Name::
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="userName" name="userName" class="field_big"/>
                                </div>
                            </div>
                            <div>
                                <div style="float: left; width: 40%; margin: 5px; text-align: right; vertical-align: middle;">                        
                                    Password:
                                </div>                        
                                <div style="float: left; width: 48%; margin: 5px;">                        
                                    <input id="userName" name="userName" class="field_big"/>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both">
                        </div>
                        <div style="width: 100px; margin: auto">
                            <a href="javascript:submitForm()" class="btn" style="margin-top: 25px;">Submit</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jspf" />
    </body>
</html>

