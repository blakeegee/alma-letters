<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template match="/">
<xsl:if  test="notification_data/pod_name='Summit 3 Rota'" >
	<xsl:message terminate="yes">Stops the label for Summit libraries</xsl:message>
</xsl:if>
<xsl:if  test="notification_data/pod_name='OrCa'" >
	<xsl:message terminate="yes">Stops the label for OrCa libraries</xsl:message>
</xsl:if>
<xsl:if  test="notification_data/pod_name=''" >
	<xsl:message terminate="yes">Stops the label for libraries with no pod names and thus no addresses</xsl:message>
</xsl:if>
    <html>
               <head>
                  <xsl:call-template name="generalStyle" />
               </head>
               <body>
                  <xsl:attribute name="style">
                     <xsl:call-template name="bodyStyleCss" />
                     <!-- style.xsl -->
                  </xsl:attribute>
                  <xsl>
                     <br />
					 <table cellspacing="0" cellpadding="0" border="0" width="48%">
                              <tr>
                                 <td>
                     <font size="2">
                        <b>@@title@@: </b>
                        <xsl:value-of select="notification_data/request/display/title" />
                     </font>
                                 </td>
                              </tr>
                     <br />
                              <tr>
                                 <td>
                     <font size="2">
                        <b>External ID: </b>
                        <xsl:value-of select="notification_data/request/external_request_id" />
                     </font>
                                 </td>
                              </tr>
					 </table>
                     <table cellspacing="0" cellpadding="0" border="1" width="48%">
                        <tr>
                           <td style="font-size:16px;width:500px">
                              <font size="2">Return To:</font>
                              <br />
                              <br />
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/library/address/line1" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/library/address/line2" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/library/address/line3" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/library/address/line4" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/library/address/line5" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/library/address/city" />
<xsl:text>, </xsl:text>
                                       <xsl:value-of select="notification_data/library/address/state_province" />
<xsl:text> </xsl:text>
                                       <xsl:value-of select="notification_data/library/address/postal_code" />
                                    </b>
                                 </center>
                              <br />
                           </td>
                        </tr>
                        <tr>
                           <td style="font-size:16px;width:500px">
                              <font size="2">Ship To:</font>
                              <br />
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/partner_name" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                    <xsl:value-of select="notification_data/partner_address/line1" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/partner_address/line2" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/partner_address/line3" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/partner_address/line4" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
                                       <xsl:value-of select="notification_data/partner_address/line5" />
                                    </b>
                                 </center>
                                 <center>
                                    <b>
<xsl:if  test="notification_data/partner_address/city !=''" ><xsl:value-of select="notification_data/partner_address/city" />
<xsl:text>, </xsl:text>
</xsl:if>
<xsl:if  test="notification_data/partner_address/state_province !=''" ><xsl:value-of select="notification_data/partner_address/state_province" />
<xsl:text> </xsl:text>
</xsl:if>
<xsl:if  test="notification_data/partner_address/postal_code !=''" ><xsl:value-of select="notification_data/partner_address/postal_code" />
</xsl:if>
                                    </b>
                                 </center>
                                 <br />
                           </td>
                        </tr>
                     </table>
                  </xsl>
               </body>
            </html>
	</xsl:template>
</xsl:stylesheet>
