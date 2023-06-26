<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />
  <xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
  <xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />
  <xsl:variable name="fileUploaded" select="/notification_data/file_uploaded" />

  <xsl:template match="/">
    <html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

      <head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head" />
        <!-- header.xsl -->
        <xsl:call-template name="senderReceiver" />
        <!-- SenderReceiver.xsl -->
        <div class="messageArea">
          <div class="messageBody">

          	<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
          		<tr>
					<td>@@your_request@@.</td>
				</tr>
				<tr>
					<td>@@title@@: <xsl:value-of select="notification_data/phys_item_display/title"/></td>
				</tr>

                <xsl:if test="notification_data/terms_of_use != ''">
                    <tr>
                        <td>@@terms_of_use@@:<xsl:value-of select="notification_data/terms_of_use"/> </td>
                    </tr>
                </xsl:if>
                <xsl:if test="((notification_data/download_url_local != '' ) or (notification_data/download_url_saml != '') or (notification_data/download_url_cas != ''))" >
                     <tr>
                         <td>@@to_see_the_resource@@</td>
                     </tr>
                 </xsl:if>	
                 <xsl:if test="notification_data/download_url_local != ''">
                     <tr>
                         <td>@@for_local_users@@<a>
                                 <xsl:attribute name="href">
                                     <xsl:value-of select="notification_data/download_url_local" />
                                 </xsl:attribute>@@click_here@@</a>
                         </td>
                     </tr>
                 </xsl:if>	
                 <xsl:if test="notification_data/download_url_saml != ''">
                     <tr>
                         <td>@@for_saml_users@@<a>
                                 <xsl:attribute name="href">
                                     <xsl:value-of select="notification_data/download_url_saml" />
                                 </xsl:attribute>@@click_here@@</a>
                         </td>
                     </tr>
                 </xsl:if>	
                 <xsl:if test="notification_data/download_url_cas != ''">
                    <tr>
                        <td>@@for_cas_users@@<a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="notification_data/download_url_cas" />
                                </xsl:attribute>@@click_here@@</a>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="notification_data/borrowing_document_delivery_max_num_of_views != ''">
                        <tr>
                            <td>@@max_num_of_views@@ <xsl:value-of select="notification_data/borrowing_document_delivery_max_num_of_views"/>.</td>
                        </tr>
                    </xsl:when>
					<xsl:when test="(notification_data/request/document_delivery_max_num_of_views != '') and ((notification_data/download_url_local != '' ) or (notification_data/download_url_saml != '') or (notification_data/download_url_cas != ''))">
                        <tr>
                            <td>@@max_num_of_views@@ <xsl:value-of select="notification_data/request/document_delivery_max_num_of_views"/>.</td>
                        </tr>
                    </xsl:when>
                </xsl:choose>	
				<xsl:if test="/notification_data/url_list/string">
					<tr>
						<td>@@attached_are_the_urls@@:</td>
					</tr>

					<xsl:for-each select="/notification_data/url_list/string">	
						<tr>
							<td>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="." />
									</xsl:attribute>
									<xsl:value-of select="." />
								</a>
							</td>
						</tr>

					</xsl:for-each>
				</xsl:if>	
				<tr>
					<td>@@sincerely@@<br />@@department@@</td>
				</tr>
          	</table>
          </div>
        </div>
        <xsl:call-template name="lastFooter" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
