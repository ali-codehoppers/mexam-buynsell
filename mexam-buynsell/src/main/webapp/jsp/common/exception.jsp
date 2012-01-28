<%-- 
    Document   : exception
    Created on : Nov 15, 2011, 6:23:27 PM
    Author     : AmierHaider
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Mexam-BuynSell</title>
    </head>
    <body>
        <h2>An unexpected error has occurred</h2>
        <p>
            Please report this error to your system administrator
            or appropriate technical support personnel.
            Thank you for your cooperation.
        </p>
        <hr/>
        <h3>Error Message</h3>
        <s:actionerror/>
        <p>
            <s:property value="%{exception.message}"/>
        </p>
        <hr/>
        <h3>Technical Details</h3>
        <p>
            <s:property value="%{exceptionStack}"/>
        </p>
    </body>
</html>
