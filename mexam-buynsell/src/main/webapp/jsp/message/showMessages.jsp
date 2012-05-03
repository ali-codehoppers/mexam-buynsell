<%-- 
    Document   : showMessageRFQ
    Created on : Apr 27, 2012, 12:53:10 PM
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
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <script type="text/javascript" src="js/grid/i18n/grid.locale-en.js"></script>                                
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>  
        <title>Buy &amp; Sell - Messages</title>
        <script type="text/javascript" >
            $(document).ready(function(){
                $( "#dialog" ).dialog({
                    autoResize:true,
                    autoOpen: false,
                    modal: true,
                    width:'450'
                });
                $( "#tabs" ).tabs(); 

                jQuery("#userMessages").jqGrid({
                    url:'getMessages?type=USER',
                    datatype: "json",
                    height: 250,
                    editurl:'deleteMessage',
                    //colNames:['PartNo','Name','Quantity','Price'],
                    colNames:['Sent By','Subject',''],
                    colModel:[
                        {name:'cell.senderName',index:'creationDate', width:200, align:"center",sortable:true,formatter:isNewFormatter},                                                
                        {name:'cell.subject',index:'title', width:400, align:"center" , sortable:true,formatter:isNewFormatter},                      
                        {name:'',jsonmap:'cell.id', align:"center" , sortable:true,formatter:openMessage},                      
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager_user',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "User Messages",
                    onSelectRow: function(ids) {
                        // getMessage(ids);
                    },
                    loadComplete:function(){
                        jQuery("#messageId").val("0");
                        closeMessage();
                    },
                    jsonReader : { 
                        root: "rows", 
                        page: "page", 
                        total: "total", 
                        records: "records", 
                        repeatitems: false, 
                        cell: "cell", 
                        id: "id"
                    }
                });
                jQuery("#userMessages").jqGrid('navGrid','#pager_user',{edit:false,add:false,del:true});
                jQuery("#rfqMessages").jqGrid({
                    url:'getMessages?type=RFQ',
                    datatype: "json",
                    height: 250,
                    editurl:'deleteMessage',
                    //colNames:['PartNo','Name','Quantity','Price'],
                    colNames:['Sent By','Subject',''],
                    colModel:[
                        {name:'cell.senderName',index:'creationDate', width:200, align:"center",sortable:true,formatter:isNewFormatter},                                                
                        {name:'cell.subject',index:'title', width:400, align:"center" , sortable:true,formatter:isNewFormatter},                      
                        {name:'',jsonmap:'cell.id', align:"center" , sortable:true,formatter:openMessage},                      
                    ],
                    rowNum:10,
                    rowList:[10,20,30],
                    pager: '#pager_rfq',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "RFQ Messages",
                    onSelectRow: function(ids) {
                        // getMessage(ids);
                    },
                    loadComplete:function(){
                        jQuery("#messageId").val("0");
                        closeMessage();
                    },
                    jsonReader : { 
                        root: "rows", 
                        page: "page", 
                        total: "total", 
                        records: "records", 
                        repeatitems: false, 
                        cell: "cell", 
                        id: "id"
                    }
                });
                jQuery("#rfqMessages").jqGrid('navGrid','#pager_rfq',{edit:false,add:false,del:true});
                var type='${type}';
                $("#"+type+"-tab").show();
            });
            function openMessage(cellvalue, options, rowObject){
                return "<a href='javascript:getMessage("+cellvalue+")' class='btn dark' style='float:none'>Open</a>";
            }
            function isNewFormatter (cellvalue, options, rowObject)
            {
                // alert(rowObject.cell.unread);
                if(rowObject.cell.unread==true)
                    return "<b>"+cellvalue+"</b>";
                else
                    return cellvalue;
            }
            function getMessage(id){
                $.ajax({
                    type:       "get",
                    url:        "getMessageById?id="+id,
                    data:       {},
                    success:    function(msg) {
                        var data = eval('('+msg+')');
                        jQuery("#messageId").val(id);
                        jQuery("#subject").html(data.subject);
                        jQuery("#senderName").html(data.senderName);                
                        jQuery("#sentTo").html(data.sentTo);
                        jQuery("#message").html(data.message);                         
                        $("#dialog").dialog("open");
                        

                    }
                });
                
            }
            function closeMessage(){
                var id = jQuery("#messageId").val();
                $.ajax({
                    type:       "get",
                    url:        "markMessageAsRead?id="+id,
                    data:       {},
                    success:    function(msg) { 
                        var data = eval('('+msg+')');
                        $("#userMessageCount").html(data.userMessageCount);
                        $("#rfqMessageCount").html(data.rfqMessageCount);
                        $("#bnsMessageCount").html(data.bnsMessageCount);
                        $("#totalMessageCount").html(data.totalMessageCount);
                        if(id!=0){
                            $("#userMessages").trigger('reloadGrid');
                            $("#rfqMessages").trigger('reloadGrid');
                            //$("#rfqMessages").trigger('reloadGrid');
                        }
                        $("#dialog").dialog("close");
                        

                    }
                });
            }
        </script>
        <style type="text/css">
            .message th{
                text-align: left;
            }
            a.dark:hover{
                color:#666666;

            }

        </style>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" >
            <jsp:param name="currentTab" value="messages"/>
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
                            <li><a href="#user-tab">User (<span id="userMessageCount">${userMessageCount}</span>)</a></li>
                            <li><a href="#rfq-tab">RFQ (<span id="rfqMessageCount">${rfqMessageCount}</span>)</a></li>
                            <li><a href="#bns-tab">Buy N Sell (<span id="rfqMessageCount">${bnsMessageCount}</span>)</a></li>
                        </ul>
                        <div id="user-tab">
                            <table id="userMessages"></table>
                            <div id="pager_user"></div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <div id="rfq-tab">
                            <table id="rfqMessages"></table>
                            <div id="pager_rfq"></div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <div id="bns-tab">
                            <table id="bnsMessages"></table>
                            <div id="pager_bns"></div>
                            <div style="clear: both">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div id="dialog" title="Message">
            <input type="hidden" id="messageId" value="" />
            <table class="message">
                <tr>
                    <th>From:</th><td><div id="senderName"></div></td>
                </tr>
                <tr>
                    <th>To:</th><td><div id="sentTo"></div></td>
                </tr>
                <tr>
                    <th>Subject:</th><td><div id="subject">Hay</div></td>
                </tr>
            </table>
            <fieldset>
                <legend style="padding:3px">Message</legend>
                <div id="message" style="padding:10px">

                </div>
            </fieldset>
            <div style="text-align: center">
                <a href="javascript:closeMessage()" class="btn" style="float:none" >Close</a>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
