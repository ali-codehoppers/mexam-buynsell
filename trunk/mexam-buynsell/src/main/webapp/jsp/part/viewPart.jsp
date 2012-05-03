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
        <script type="text/javascript" src="js/lightbox/jquery.lightbox-0.5.js"></script>
        <link rel="stylesheet" type="text/css" href="css/lightbox/jquery.lightbox-0.5.css" media="screen" />

        <style>
            #prodDesc
            {
                font-weight: bold!important;
                font-size: 1.5em!important;
                padding: 8px;
                color: #4B4B4B;
            }
            .heading{
                font-weight: bold!important;
                font-size: 1em!important;
                /*padding: 8px;*/
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
            #prodImageCont
            {
                margin-right: 20px;
                margin-bottom: 20px;
            }


            #gallery {
                background-color: #444;
                padding: 10px;
                width: 520px;
            }
            #gallery ul { list-style: none; }
            #gallery ul li { display: inline; }
            #gallery ul img {
                border: 5px solid #3e3e3e;
                border-width: 5px 5px 20px;
            }
            #gallery ul a:hover img {
                border: 5px solid #fff;
                border-width: 5px 5px 20px;
                color: #fff;
            }
            #gallery ul a:hover { color: #fff; }

        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                //alert(conditions);
                $("#tabs").tabs();
                $('#prodImageCont a').lightBox();
            });
 
            
        </script>
        <title>Buy & Sell</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />

        <div id="container" class="container" style="min-height: 335px;">
            <div id="content">

                <div id="title"> 
                    <div style="margin:auto">
                        <h1 style="width: 100%; text-align: center" id="listTitle"><s:property value="part.manufacturer" escape="false"/> <s:property value="part.name" escape="false"/> <s:property value="part.partNo" escape="false"/></h1>
                        <img style="width: 100%; text-align: center" src="images/under_line.jpg" width="553" height="16" alt="" />
                    </div>
                </div>

                <div id="prodDetailCont" style="margin-top: 10px">
                    <div id="prodImageCont" style="float: left">
                        <s:if test="part.images.get(0).id>0">
                            <a href="getImage?imageId=<s:property value='part.images.get(0).id' />&imageType=0" title="">
                                <img src="getImage?imageId=<s:property value='part.images.get(0).id' />&imageType=2"/>
                            </a>
                        </s:if>
                        <s:else>
                            <img src='images/no-product-image.jpg'/>
                        </s:else>
                    </div>
                    <div>
                        <div id="prodDescCont" style="float: left">
                            <div id="prodDesc" style="text-align: left">
                                <s:property value="part.overview" escape="false"/>
                            </div>
                            <div>
                                <div class="heading">
                                    Features
                                </div>
                                <div><s:if test="%{!part.features.equals('')}">${part.features}</s:if><s:else>${msg}</s:else></div>
                                <br/>
                                <div class="heading">
                                    Specifications
                                </div>
                                <div><s:if test="%{!part.specifications.equals('')}">${part.specifications}</s:if><s:else>${msg}</s:else></div>
                                <br/>
                                <div id="prodDescCont" style="float: left">
                                    <div class="heading">
                                        Codes
                                    </div>
                                    <div><b>BSIN:</b><s:if test="%{!part.bsin.equals('')}">${part.bsin}</s:if><s:else>${msg}</s:else></div>
                                    <div><b>UPC/EAN:</b><s:if test="%{!part.upc_ean.equals('')}">${part.upc_ean}</s:if><s:else>${msg}</s:else></div>
                                    <div><b>NSN:</b><s:if test="%{!part.nsn.equals('')}">${part.nsn}</s:if><s:else>${msg}</s:else></div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <div style="clear: both">
                </div>
                <div style="clear: both">
                </div>
            </div>

        </div>
        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
