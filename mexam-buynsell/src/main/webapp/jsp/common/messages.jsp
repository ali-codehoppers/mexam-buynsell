<%-- any content can be specified here e.g.: --%>
<%@ page pageEncoding="windows-1252" %>
<div id="messagesContainer" style="width: 100%; margin: auto; margin-top: 25px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr id="messageError" style="display: none">
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="6%" align="right"><img src="images/error_left.jpg" alt="" width="38" height="34" /></td>
                        <td id="errorMsg" width="88%" align="left" class="error_msg"></td>
                        <td width="5%" align="right" class="error_msg"><a href="#"><img src="images/error_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideError()"/></a></td>
                        <td width="1%" align="left"><img src="images/error_right.jpg" alt="" width="6" height="34" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="messageInfo" style="display: none">
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="6%" align="right"><img src="images/info_left.jpg" alt="" width="38" height="34" /></td>
                        <td id="infoMsg" width="88%" align="left" class="info_msg"></td>
                        <td width="5%" align="right" class="info_msg"><a href="#"><img src="images/info_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideInfo()"/></a></td>
                        <td width="1%" align="left"><img src="images/info_right.jpg" alt="" width="6" height="34" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="messageSuccess" style="display: none">
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="6%" align="right"><img src="images/success_left.jpg" alt="" width="38" height="34" /></td>
                        <td id="successMsg" width="88%" align="left" class="success_msg"></td>
                        <td width="5%" align="right" class="success_msg"><a href="#"><img src="images/success_cross.jpg" alt="" width="18" height="18" border="0" onclick="hideSuccess()"/></a></td>
                        <td width="1%" align="left"><img src="images/success_right.jpg" alt="" width="6" height="34" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>