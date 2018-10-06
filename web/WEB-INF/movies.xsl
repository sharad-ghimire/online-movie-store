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
    <xsl:template match="movie">
        <div class="container">
            <div class="row">
                <div class="col-2"></div>
                <div class="col-6">
                    <div class="card mt-2 mb-2">
<!--                        <div class="view overlay">
                            <img class="card-img-top" src="img/{img}" width="544" height="362" alt="{title}"></img>
                            <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>-->
                        <div class="card-body">
                            <h4 class="card-title">
                                <i class="fa fa-film"></i><xsl:value-of select="title"/>
                            </h4>
                            <p class="card-text">
                                <xsl:value-of select="details"/><br></br><br></br>
                                <i class="fa fa-dollar" aria-hidden="true"></i> <span class="text-dark center"><xsl:value-of select="price"/></span>
                                <br></br>
                            </p>
                            <xsl:variable name="status" select="status" />
                                 <xsl:choose>
                                    <xsl:when test="$status = 'available'">
                                     <p> Availablility: <i class="fa fa-check" aria-hidden="true"></i>
                                    </p>
                                    <a href="checkout.jsp?id={id}" class="btn btn-primary">Purchase</a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <p> Availablility: <i class="fa fa-times" aria-hidden="true"></i><br></br>
                                       <small>Sorry! This movie is not available right now!</small>
                                        </p>
                                        <button  type="button" class="btn btn-primary" disabled="disabled">Purchase</button>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                
                                
                                
                            
                            
                            
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
               
            </div>
        </div>
    </xsl:template>
    <xsl:template match="id|title|genre|date|price|copies|status|img|details"/>
    
    
</xsl:stylesheet>