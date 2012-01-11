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
            #prodDesc
            {
                font-weight: bold!important;
                font-size: 1.5em!important;
                padding: 8px;
                color: #083152;
            }
            #prodLongDesc
            {
                font-size: 1.2em!important;
                padding: 8px;
                text-align:justify;
                font-size: 10pt!important;
            }

            .prodDescTitle
            {
                background-color: #4B4B4B;
                border-radius:4px;
                padding: 8px;
                color: #FFFFFF;
                font-weight: bold!important;
                font-size: 10pt!important;
            }

            .prodDescContent
            {
                font-size: 10pt!important;
            }


        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                //alert(conditions);
                $("#tabs").tabs();
            });
 
            
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jspf" />

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">

                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle"><s:property value="part.partNo" /></h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="prodDetailCont" style="margin-top: 10px">
                    <div id="prodImageCont" style="float: left">
                        <s:if test="part.images.get(0).id>0">
                            <img src="getImage?imageId=<s:property value="part.images.get(0).id" />"/>
                        </s:if>
                        <s:else>
                            <img src='images/default.png'/>
                        </s:else>
                    </div>

                    <div id="prodDescCont" style="float: left">
                        <div id="prodDesc" style="text-align: left">
                            <s:property value="part.description" escape="false"/><br>
                        </div>

                        <div id="prodLongDesc" style="max-width: 530px">
                            <s:property value="part.overview" escape="false"/><br>
                        </div>
                    </div>
                </div>

                <div style="clear: both">
                </div>
                <div id="tabs">
                    <ul>
                        <li><a href="#productInfo"><span>Product Information</span></a></li>
                        <li><a href="#parts"><span>Parts & Pricing</span></a></li>
                        <li><a href="#docs"><span>Related Documents</span></a></li>
                        <li><a href="#reviews"><span>Customer Reviews</span></a></li>
                        <li><a href="#questions"><span>Products Q&A</span></a></li>
                    </ul>
                    <div id="productInfo">
                        <div style="text-align: left; margin-top: 10px; padding-top: 15px">
                            <div class="prodDescTitle">
                                Features 
                            </div>
                            <div style="padding: 8px" class="prodDescContent">
                                <s:property value="part.features" escape="false"/>
                            </div>

                            <div class="prodDescTitle">
                                Specifications
                            </div>
                            <div style="padding: 8px" class="prodDescContent">
                                <s:property value="part.specifications" escape="false"/>
                            </div>

                            <div style="clear: both">
                            </div>
                        </div>
                    </div>
                    <div id="parts" style="min-height: 300px">


                    </div>
                    <div id="docs" style="min-height: 300px">


                    </div>
                    <div id="reviews" style="min-height: 300px">

                        <div style="clear: both"></div>
                    </div>
                    <div id="questions" style="min-height: 300px">

                    </div>
                </div>
                <div style="clear: both">
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="../common/footer.jspf" />

</body>
</html>
