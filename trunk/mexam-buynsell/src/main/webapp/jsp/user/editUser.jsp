<%-- 
    Document   : editUser
    Created on : Apr 18, 2012, 8:20:29 PM
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
        <title>Buy &amp; Sell - Edit User</title>
        <script type="text/javascript">
            var countries = eval(${countriesJson});
            var companyCategories = eval(${categoriesJson});
            var message = "${message}";
            var errorType = "${errorType}";
            var countryId = "${user.company.state.country.id}";
            var state = "${user.company.stateId}";
            var companyCategory = "${user.company.companyCategory}";
            $(document).ready(function(){
                /*  alert(countryId);
                alert(state);
                alert(companyCategory);*/
                countriesHtml="";
                for (var i = 0; i< countries.length; i++) {
                    var select = "";
                    if(countryId==countries[i].id){
                        select = "selected=selected";
                    }
                    countriesHtml += '<option value="' + countries[i].id + '" '+select+'>' + countries[i].name + '</option>';
                }
                $("#country").html(countriesHtml);
                
                companyCategoriesHtml="";
                for (var i = 0; i< companyCategories.length; i++) {
                    var select = "";
                    if(companyCategory==companyCategories[i].description){
                        select = "selected=selected";
                    }
                    companyCategoriesHtml += '<option value="' + companyCategories[i].description + '" '+select+'>' + companyCategories[i].description + '</option>';
                }
                $("#companyCategory").html(companyCategoriesHtml);
                populateStates($("#country").val());
                if(message != ""){
                    $("#messageContainer").show();
                    if(errorType=="PASSWORD_MISMATCH" || errorType=="PASSWORD_EMPTY"){
                        window.location+="#password-tab";
                    }
                    else if(errorType=="COMPANY_EMPTY"){
                        window.location+="#company-tab";
                    }
                    else if(errorType=="USER_EMPTY"){
                        window.location+="#manager-tab";
                    }
                }
                $( "#tabs" ).tabs();

            });
            function populateStates(country){
                if(country && country > 0)
                {
                    $.ajax({
                        type:       "get",
                        url:        "getStates",
                        data:       {countryId: country},
                        success:    function(msg) {
                            var data = eval('('+msg+')');
                            var html = "";
                            var len = data.length;
                            for (var i = 0; i< len; i++) {
                                var select = "";
                                if(state==data[i].id){
                                    select = "selected=selected";
                                }
                                html += '<option value="' + data[i].id + '" '+select+'>' + data[i].name + '</option>';
                            }
                            $('#state').html(html);
                        }
                    });
                }
                return false;
            }
            function validateCompanyForm(){
                alert('hello');
                $(".company").each(function(i,t){
                    //alert($(t).attr("name"));
                    if($(t).val()==""){
                        $("#errorMsg").html("Can not leave any field empty");
                        $("#messageContainer").show();
                        return false;
                    }
                });
                //$('#companyEdit').submit();
                return true;
                
            }
            function validateUserForm(){
                $(".user").each(function(i,t){
                    //alert($(t).attr("name"));
                    if($(t).val()==""){
                        $("#errorMsg").html("Can not leave any field empty");
                        $("#messageContainer").show();
                        return false;
                    }
                    if($(t).attr("name")== "email" ){
                        var patt = /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/;
                        var email = $(t).val();
                        if(patt.test(email))
                        {
                            //$("#validEmailMsg").hide();
                        }
                        else{
                            $("#errorMsg").html("Invalid email format");
                            $("#messageContainer").show();
                            return false;
                        }
                    }
                });
                return true;
            }
            function validatePasswordForm(){
                $(".password").each(function(i,t){
                    if($(t).val()==""){
                        $("#errorMsg").html("Can not leave any field empty");
                        $("#messageContainer").show();
                        return false;
                    }
                    if($("#new").val()!=$("#reNew").val()){
                        $("#errorMsg").html("The new passwords do not match");
                        $("#messageContainer").show();
                        return false;
                    }
                });
                return true;
            }
            
        </script>
        <style>
            #tabs div{
                height: 300px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="user"/>
        </jsp:include>
        <div id="container" class="container" style="min-height: 335px;height: 100%" >
            <div id="content">
                <div id="title"> 
                    <div style="margin:auto">
                        <h3 style="width: 100%; text-align: center" id="listTitle">Edit User</h3>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>
                <div id="messageContainer" style="display: none;position:absolute;top:33%;left:30%;z-index: 1000">
                    <table id="messageError" width="80%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="1%" align="right"><img src="images/error_left.jpg" alt="" width="38" height="34" /></td>
                            <td id="errorMsg" width="88%" align="left" class="error_msg">${message}</td>
                            <td width="5%" align="right" class="error_msg"><a href="javascript:$('#messageContainer').hide()"><img src="images/error_cross.jpg" alt="" width="18" height="18" border="0" onclick=""/></a></td>
                            <td width="1%" align="left"><img src="images/error_right.jpg" alt="" width="6" height="34" /></td>
                        </tr>
                    </table>
                </div>
                <div id="formContainder" style="width:100%;margin-left: 50px;" >
                    <div id="tabs">
                        <ul>
                            <li><a href="#company-tab">Company</a></li>
                            <li><a href="#manager-tab">Manager</a></li>
                            <li><a href="#password-tab">Change Password</a></li>
                        </ul>
                        <div id="company-tab">
                            <form id="companyEdit" action="saveEditCompany" onsubmit="validateCompanyForm();" method="POST">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <input type="hidden" name="companyId" value="${user.companyId}"/>
                                <table>
                                    <tr>
                                        <td>Company Name:</td><td><input type="text" name="name" class="company" value="${user.company.name}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Address:</td><td><textarea name="address" class="company" cols="21">${user.company.address}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td>City:</td><td><input type="text" name="city" class="company" value="${user.company.city}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Country:</td><td><select id="country" name="country" class="company" style="width: 190px" onchange="populateStates(this.value)"></select></td>
                                    </tr>
                                    <tr>
                                        <td>State:</td><td><select id="state" name="state" class="company" style="width: 190px"></select></td>
                                    </tr>
                                    <tr>
                                        <td>Phone Number:</td><td><input type="text" name="phoneNo" class="company" value="${user.company.phoneNo}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Fax Number:</td><td><input type="text" name="faxNo" class="company" value="${user.company.faxNo}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Zip:</td><td><input type="text" name="zip" class="company" value="${user.company.zip}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Web Address:</td><td><input type="text" name="webAddress" class="company" value="${user.company.webAddress}"/></td>
                                    </tr>

                                    <tr>
                                        <td>Company Category:</td><td><select id="companyCategory" name="companyCategory" class="company" style="width: 190px"></select></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td><td align="center"><a href="javascript:$('#companyEdit').submit();" class="btn" style="float:none;">Save</a></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div id="manager-tab">
                            <form id="userEdit" action="saveEditUser" onsubmit="validateUserForm();" method="POST">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <table>
                                    <tr>
                                        <td>First Name:</td><td><input type="text" name="firstName" class="user" value="${user.firstName}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Last Name:</td><td><input type="text" name="lastName" class="user" value="${user.lastName}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td><td><input type="text" name="email" class="user" value="${user.email}"/></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td><td align="center"><a href="javascript:$('#userEdit').submit();" class="btn" style="float:none;">Save</a></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div id="password-tab">
                            <form id="passwordEdit" action="saveEditPassword" onsubmit="validatePasswordForm();" method="POST" >
                                <table>
                                    <tr>
                                        <td>Old Password:</td><td><input type="password" class="password" name="oldPassword"/></td>
                                    </tr>
                                    <tr>
                                        <td>New Password:</td><td><input type="password" id="new" class="password" name="newPassword"/></td>
                                    </tr>
                                    <tr>
                                        <td>Re-Type New Password:</td><td><input type="password" id="reNew" class="password"/></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td><td align="center"><a href="javascript:$('#passwordEdit').submit();" class="btn" style="float:none;">Save</a></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
