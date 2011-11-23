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
        </script>

        <title>Login</title>
    </head>
    <body>
        <h1>Login!</h1>

        <div style="width: 50%"> 

            <form method="POST" action="login">
                <div>
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
                </div>

                <div style="height: 100px"><s:submit value="Submit" align="center"/>
                </div>
            </form>
        </div>
    </body>
</html>