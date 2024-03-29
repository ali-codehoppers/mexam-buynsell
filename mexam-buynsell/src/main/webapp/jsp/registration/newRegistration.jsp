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
            .alignField{
                float: left;
                width: 48%;
                margin: 5px;
            }
            .alignFieldLabel{
                float: left;
                width: 40%;
                margin: 5px;
                text-align: right;
                vertical-align: middle;
            }
        </style>

        <script type="text/javascript">
            var countries = eval(${countriesJson});
            var companyCategories = eval(${categoriesJson});
            var infoMessage = "${info}";
            var errorMessage = "${error}";
            var successMessage = "${message}";
            var isValidUserName = false;
 
            $(document).ready(function () {
                
                countriesHtml="";
                for (var i = 0; i< countries.length; i++) {
                    countriesHtml += '<option value="' + countries[i].id + '">' + countries[i].name + '</option>';
                }
                $("#country").html(countriesHtml);
                
                companyCategoriesHtml="";
                for (var i = 0; i< companyCategories.length; i++) {
                    companyCategoriesHtml += '<option value="' + companyCategories[i].description + '">' + companyCategories[i].description + '</option>';
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
                if(isValidUserName){
                    $("#register").submit();
                }
                else{
                    checkUserNameUniqueness(true);
                }
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
            function checkUserNameUniqueness(toSubmit){
                var userName = jQuery("#userNameForm").val();

                jQuery("#loader").attr("src","images/loader16.gif");
                jQuery("#loader").show();
                jQuery("#nameError").hide();
                if($.trim(userName) == ""){
                    isValidUserName = false;
                    jQuery("#loader").attr("src","images/error.png"); 
                    
                    return;
                }
                $.ajax({
                    type:"post",
                    url:"checkUserName",
                    data:"userName="+userName,
                    success:function(msg){
                        var data = eval('('+msg+')');
                        if(data.length>0){
                            isValidUserName = false;
                            jQuery("#loader").attr("src","images/error.png"); 
                            jQuery("#nameError").show();
                        }else{
                            isValidUserName = true;
                            jQuery("#loader").attr("src","images/ok.png");
                            if(toSubmit){
                                submitForm();
                            }
                        }
                    }
                });
            }
            function validateEmailFormat(){
                var patt = /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/;
                var email = jQuery("#email").val();
                if(patt.test(email))
                {
                    $("#validEmailMsg").hide();
                }
                else{
                    $("#validEmailMsg").show();
                }
            }
            
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">

                <div>
                    <jsp:include page="../common/messages.jsp" />
                </div>

                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle">New Registration</h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="formContainder" style="margin-left: 50px;">
                    <form id ="register" method="POST" action="register">

                        <h3 style="width: 100%; text-align: center;margin-bottom: 15px;">Required Company Information</h3>

                        <div>
                            <!--                             <div>
                                                            <div style="float: left; margin: 5px; text-align: left; vertical-align: middle; margin-left: 30%; color: #cd0a0a">                        
                                                                
                                                            </div>                        
                                                            <div style="clear: both"></div>
                                                        </div>-->

                            <div>
                                <div class="alignFieldLabel">                        
                                    Name:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input id="name" name="name" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_name"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>

                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Address:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <textarea id="address" name="address" class="field_big" style="min-height: 50px; min-width: 250px;"></textarea>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_address"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    City:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input id="city" name="city" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_city"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Country:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <select id="country" name="country" class="field_big" style="min-width: 20%" onchange="javascript:populateStates(this.value)"></select>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_country"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    State:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <select id="state" name="stateVal" class="field_big" style="min-width: 20%">                       
                                        </select>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_state"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Phone Number:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input name="phoneNo" id="phoneNo" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_phoneNo"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Fax Number:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input name="faxNo" id="faxNo" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_faxNo"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Zip:
                                </div>                        
                                <div class="alignField">       
                                    <div style="float: left;">    
                                        <input name="zip" id="zip" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_zip"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>

                            <div>
                                <div class="alignFieldLabel">                        
                                    Web Address:
                                </div>                        
                                <div class="alignField">    
                                    <div style="float: left;">    
                                        <input name="webAddress" id="webAddress" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_webAddress"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 

                                </div>
                            </div>    
                            <div>
                                <div class="alignFieldLabel">                        
                                    Company Category:
                                </div>                        
                                <div class="alignField">   
                                    <div style="float: left;">    
                                        <select id="companyCategory" name="companyCategoryId" class="field_big" style="min-width: 20%"></select>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_companyCategory"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                        </div>
                        <div style="clear: both">
                        </div>
                        <div style="margin-top: 50px">
                            <h3 style="width: 100%; text-align: center">Company Administrator</h3>

                            <div>
                                <div class="alignFieldLabel">                        
                                    First Name:
                                </div>                        
                                <div class="alignFieldLabel">                        
                                    <div style="float: left;">    
                                        <input id="firstName" name="firstName" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_firstName"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Last Name:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input id="lastName" name="lastName" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_lastName"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Email:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input id="email" name="email" onkeyup="validateEmailFormat()" class="field_big"/> <span id="validEmailMsg" style="display: none;color:red" ><img src="images/loader16.gif" style="display:none" alt="checking"> Invalid E-mail</span>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_email"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Re-Confirm Email:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input id="verifyEmail" name="verifyEmail" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_verifyEmail"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    User Name:
                                </div>                        
                                <div class="alignField">     
                                    <div style="float: left;">    
                                        <input id="userNameForm" name="userName" class="field_big" onblur="checkUserNameUniqueness(false)" /> <img id="loader" src="images/loader16.gif" style="display:none" alt="checking"> <span id="nameError" style="display: none;color:red" >Username already exists</span>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_userName"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Password:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input type="password" id="password" name="password" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_password"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>
                            <div>
                                <div class="alignFieldLabel">                        
                                    Re-Confirm Password:
                                </div>                        
                                <div class="alignField">                        
                                    <div style="float: left;">    
                                        <input type="password" id="verifyPassword" name="verifyPassword" class="field_big"/>
                                    </div>
                                    <div style="float: left;" class="fieldError">                        
                                        <ch:errortag name="register_verifyPassword"></ch:errortag>
                                    </div>
                                    <div style="clear: both"></div> 
                                </div>
                            </div>

                        </div>
                        <div style="clear: both"></div>
                        <div style="width: 100px; margin: auto">
                            <a href="javascript:submitForm()" class="btn" style="margin-top: 25px; min-width: 100px; text-align: center">Submit</a>
                            <!--<button value="Add Inventory" align="center" class="button">Submit</button>-->
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>

