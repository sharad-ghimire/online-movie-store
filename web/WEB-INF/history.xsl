<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>OMS</title>
                <!-- Font Awesome -->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></link>
                <!-- Bootstrap core CSS -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet"></link>
                <!-- Material Design Bootstrap -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.11/css/mdb.min.css" rel="stylesheet"></link>
            </head>
            <body>
                <xsl:apply-templates/>
                <!-- JQuery -->
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <!-- Bootstrap tooltips -->
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
                <!-- Bootstrap core JavaScript -->
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
                <!-- MDB core JavaScript -->
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.11/js/mdb.min.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="order">
        <xsl:variable name="orderStatus" select="orderStatus" />
        <xsl:choose>
            <xsl:when test="$orderStatus = 'Cancelled'">
                
            </xsl:when>
            <xsl:otherwise>
                <tr>
                    <td>
                        <xsl:value-of select="orderId"/>
                    </td>
                    <td>
                        <xsl:value-of select="orderDate"/>
                    </td>
                    <td>
                        <xsl:apply-templates/>
                    </td>
                    <td>
                        <a class="btn btn-danger" href="profile.jsp?cancelId={orderId}">Cancel Order <i class=" ml-3 close fa fa-times"></i></a>
                    </td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>    
    </xsl:template> 
    
    <xsl:template match="orderId|orderDate|name|email|paymentMethod|totalPrice|orderStatus"/>
   
    <xsl:template match="movie">
        <h2 class="badge badge-default">
            <xsl:value-of select="title"/> 
        </h2>
    </xsl:template>
    <xsl:template match="id|title|genre|date|price|copies|status|img"/>
</xsl:stylesheet>