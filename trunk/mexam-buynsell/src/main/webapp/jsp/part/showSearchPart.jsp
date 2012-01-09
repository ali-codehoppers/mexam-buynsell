<%-- 
    Document   : seachPart
    Created on : Nov 28, 2011, 11:29:09 AM
    Author     : AmierHaider
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Mexam BuynSell</title>
    </head>
    <body>
        <div style="width: 50%"> 
            <form method="POST" action="searchPart">
                <div>
                    <div>
                        <div style="float: left; width: 50%">                        
                            Search Text:
                        </div>                        
                        <div style="float: left; width: 50%">                        
                            <input name="searchString"/>
                        </div>
                    </div>

                    <div style="height: 100px"><s:submit value="Submit" align="center"/>
                    </div>

                </div>
            </form>
        </div>
    </body>

</html>
