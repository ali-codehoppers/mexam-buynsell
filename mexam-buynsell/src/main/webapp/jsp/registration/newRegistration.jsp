<%-- 
    Document   : addProduct
    Created on : Nov 4, 2011, 11:55:06 AM
    Author     : CodeHopper
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script type="text/javascript" src="js/jstree/_lib/jquery.js"></script>

        <script type="text/javascript">
            
            
            
            function populateStates(id){
                if(id && id > 0)
                {
                    $.ajax({
                        type:       "get",
                        url:        "getStates",
                        data:       {countryId: id},
                        success:    function(msg) {
                            var data = eval('('+msg+')');
                            var html = '<option value=0>--State--</option>';
                            var len = data.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                            }
                            $('#stateId').html(html);
                        }
                    });
                }
                return false;
            }
   
        </script>

        <title>New Registration</title>
    </head>
    <body>
        <h1>New Registration!</h1>
        <div style="width: 50%"> 

            <form method="POST" action="register">

                <div>Required Company Information</div>
                <br/>
                <div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            Name:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="name"/>
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            Address:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textarea name="address"/>
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            City:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="city"/>
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            Country:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:select name="countryId" list="countries" listKey="id" listValue="name" headerKey="0" headerValue="--Country--" onchange="populateStates(this.value)"/>                        
                        </div>
                    </div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            State:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:select name="stateId" list="states" listKey="id" listValue="name" headerKey="0" headerValue="--State--" />            
                        </div>
                    </div>


                    <div>
                        <div style="float: left; width: 50%">                        
                            Phone Number:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="phoneNo"/>
                        </div>
                    </div>


                    <div>
                        <div style="float: left; width: 50%">                        
                            Fax Number:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="faxNo"/>
                        </div>
                    </div>


                    <div>
                        <div style="float: left; width: 50%">                        
                            Zip:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="zip"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Web Address:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="webAddress"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Company Category:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:select name="companyCategoryId" list="companyCategories" listKey="code" listValue="description" headerKey="0" headerValue="--Category--" />                        
                        </div>
                    </div>
                </div>
                        <div><br/><br/></div>
                <div>Company Administrator </div>
                <br/>
                <div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            First Name:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="fistName"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Last Name:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="lastName"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Email:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="email"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            User Name:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:textfield name="userName"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Password:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:password name="password"/>
                        </div>
                    </div>

                    <div>
                        <div style="float: left; width: 50%">                        
                            Verify Password:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <s:password name="verifyPassword"/>
                        </div>
                    </div>
                </div>

                <div style="height: 100px"><s:submit value="Submit" align="center"/>
                </div>
            </form>
        </div>
    </body>
</html>
