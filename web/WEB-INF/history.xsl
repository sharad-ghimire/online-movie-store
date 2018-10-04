<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    .artist { font-style: italic; margin-bottom: 20px; }
                </style>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"></link>
            </head>
            <body>
                <h1>History</h1>
                <xsl:apply-templates/>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="Order">
        <div class="card">
            <div class="card-header"></div>
          <div class="card-body">
            <h5 class="card-title"><xsl:value-of select="OrderID"/></h5>
            <p class="card-text"> User: <xsl:value-of select="FullName"/></p>
            <p class="card-text"> Email: <xsl:value-of select="Email"/></p>
            <p class="card-text"> Payment method: <xsl:value-of select="PaymentMethod"/></p>
            <p class="card-text"> Total price: $<xsl:value-of select="TotalPrice"/></p>
            <p class="card-text"> Status: <xsl:value-of select="OrderStatus"/></p>
            Movies:<xsl:apply-templates/>
          </div>
        </div>
    </xsl:template>
    
    <xsl:template match="Order/OrderID|FullName|Email|PaymentMethod|TotalPrice|OrderStatus">
        <!--empty tag-->
    </xsl:template>
    
    <xsl:template match="movie">
         <div class="card">
            <div class="card-header"></div>
          <div class="card-body">
            <p class="card-text"> Title: <xsl:value-of select="Title"/></p>
            <p class="card-text"> Genre: <xsl:value-of select="Genre"/></p>
            <p class="card-text"> Date: <xsl:value-of select="ReleaseDate"/></p>
            <p class="card-text"> Price: $<xsl:value-of select="Price"/></p>
            <p class="card-text"> Copies: <xsl:value-of select="Copies"/></p>
          </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
