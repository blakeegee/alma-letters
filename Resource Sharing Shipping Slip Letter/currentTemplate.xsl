<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="counter" select="0"/>


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<xsl:template name="id-info">
   <xsl:param name="line"/>
   <xsl:variable name="first" select="substring-before($line,'//')"/>
   <xsl:variable name="rest" select="substring-after($line,'//')"/>
    <xsl:if test="$first = '' and $rest = '' ">
          <!--br/-->
      </xsl:if>
   <xsl:if test="$rest != ''">
       <xsl:value-of select="$rest"/><br/>
   </xsl:if>
   <xsl:if test="$rest = ''">
       <xsl:value-of select="$line"/><br/>
   </xsl:if>

</xsl:template>

  <xsl:template name="id-info-hdr">
        <xsl:call-template name="id-info">
        	<xsl:if test="notification_data/incoming_request/rapidr_external_request_id!=''">
            	<xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
            </xsl:if>
        	<xsl:if test="notification_data/incoming_request/rapidr_external_request_id=''">
            	<xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
            </xsl:if>
            <xsl:with-param name="label" select="'Bibliographic Information:'"/>
         </xsl:call-template>
</xsl:template>

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->


			<div class="messageArea">
				<div class="messageBody">

<table cellspacing="0" cellpadding="4" border="0">
					<tr>
						<td><strong>Is this a Rapido request? <xsl:value-of select="notification_data/incoming_request/rapido_request"/></strong></td>
					</tr>

<xsl:choose>
<xsl:when test="notification_data/organization_unit/partner_code='CC' or 'CCC' or 'CHEMEK' or 'COCC' or 'CWU' or 'Central Washington University - Brooks Library' or 'EOU' or 'EVSC' or 'EWU' or 'Evergreen State College -  Olympia Campus Library' or 'GFOX_MLRC' or 'GFOX_PCL' or 'GONZ' or 'LANECC' or 'LCC' or 'LINF_MAC' or 'LINF_PDX' or 'MHCC' or 'OHSU' or 'OIT_KFLS' or 'OIT_WILS' or 'OSU' or 'Oregon Health and Science University - OHSU Library' or 'PCC' or 'PSU' or 'PU_FG' or 'PU_HPC' or 'Portland Community College - Rock Creek' or 'Portland State University - PSU Library' or 'REED' or 'SEAU_LAW' or 'SEAU_LEMIEUX' or 'SOU_RCCM' or 'SOU_SOU' or 'SPU' or 'STMU' or 'Southern Oregon University - Hannon Library' or 'UID_LAW' or 'UID_MAIN' or 'UO' or 'UPORT' or 'UPUGS' or 'UW' or 'University of Oregon - Knight Library' or 'WALLA_PETERSON' or 'WALLA_PORTLAND' or 'WHITC' or 'WOU' or 'WPC' or 'WSU_HOLLTERR' or 'WSU_RPOINT' or 'WSU_TRICITIES' or 'WSU_VANCOUVER' or 'WU_LAW' or 'WU_MOH' or 'WU_PNCA' or 'WWO' or 'WWU' or 'Washington State University - Holland and Terrell Libraries' or 'Washington State University - Vancouver Library'">
<tr><td>SUMMIT REQUEST (Partner code)</td></tr>
</xsl:when>
<xsl:otherwise>
<tr><td>RAPIDO REQUEST (Partner code)</td></tr>
</xsl:otherwise>
</xsl:choose>

<xsl:if test="notification_data/partner_system_type='ALMA'">
<tr><td>SUMMIT REQUEST (SysType)</td></tr>
</xsl:if>
<xsl:if test="notification_data/partner_system_type='NGRS'">
<tr><td>RAPIDO REQUEST (SysType)</td></tr>
</xsl:if>

<tr><td>&#160;</td></tr>
			            <tr>
			                <td>
			                    <b>@@title@@: </b>
     			                  <xsl:value-of select="notification_data/item/title"/>
							</td>
						</tr>

						<tr>
							<td>
                                <b>@@author@@: </b>
			                      <xsl:value-of select="notification_data/item/author"/>
							</td>
						</tr>
						<tr>
							<td>
             	                <b>@@volume@@: </b>
			                      <xsl:value-of select="notification_data/item/volume"/>&#160;&#160;<b>@@issue@@: </b>
			                      <xsl:value-of select="notification_data/item/issue"/>
							</td>
						</tr>
<!--
						<tr>
							<td>
			                    <b>@@issue@@: </b>
			                      <xsl:value-of select="notification_data/item/issue"/>
			                 </td>
			            </tr>
-->
							<tr>
							  <td><b>@@item_barcode@@: </b><img src="Barcode1.png" alt="Barcode1" /></td>
							</tr>
<!--
							<tr>
								<td><xsl:value-of select="notification_data/item/title"/></td>
							</tr>
-->
							<tr>
								<td>
									<b>@@call_number@@: </b><xsl:value-of select="notification_data/item/call_number"/>
								</td>
							</tr>
							<tr>
								<td>
									<b>@@library@@: </b><xsl:value-of select="notification_data/item/library_name"/>
								</td>
							</tr>
							<tr>
								<td>
									<b>@@location@@: </b><xsl:value-of select="notification_data/item/location_name"/>
								</td>
							</tr>
<tr><td>&#160;</td></tr>
                              <xsl:if test="not(notification_data/incoming_request/due_date='')">
                                 <tr>
                                    <td>
                                       <font size="4">
                                          <b>Patron Due Date: </b>
                                          <font color="red">
                                             <xsl:value-of select="notification_data/incoming_request/due_date" />
                                          </font>
                                       </font>
                                    </td>
                                 </tr>
                              </xsl:if>
<!--							<tr>
								<td><b>@@email@@: </b><xsl:value-of select="notification_data/email"/></td>
							</tr>
							<tr>
								<td><b>@@phone@@: </b><xsl:value-of select="notification_data/phone"/></td>
							</tr>
-->
<!--
				     <tr>
			                <td>
			                  <b>@@borrower_reference@@: </b>
			                   <xsl:call-template name="id-info-hdr"/>
			                </td>
			         </tr>
-->
<!--
			          <tr>
							  <td><b>@@my_id@@: </b><img src="externalId.png" alt="externalId" /></td>
				      </tr>
-->
<!--
				      <xsl:if  test="notification_data/qualifier != ''" >
					      <tr>
								  <td><b>@@qualifier@@: </b><img src="qualifier.png" alt="qualifier" /></td>
					      </tr>
				      </xsl:if>

				      <xsl:if  test="notification_data/group_qualifier != ''" >
					      <tr>
								  <td><b>@@group_qualifier@@: </b><img src="group_qualifier.png" alt="group_qualifier" /></td>
					      </tr>
				      </xsl:if>
-->
<!--
						<tr>
							<td>
								<b>@@format@@: </b>
								<xsl:value-of select="notification_data/incoming_request/format"/>
							</td>
						</tr>
-->
<!--
						<xsl:if  test="notification_data/incoming_request/needed_by_dummy/full_date" >
							<tr>
								<td>
									<b>@@date_needed_by@@: </b>
									<xsl:value-of select="notification_data/incoming_request/needed_by"/>
								</td>
							</tr>
						</xsl:if>
-->
<!--
						<xsl:if test="notification_data/incoming_request/note !=''" >
							<tr>
								<td>
									<b>@@request_note@@: </b>
									<xsl:value-of select="notification_data/incoming_request/note"/>
								</td>
							</tr>
						</xsl:if>
-->
<!--
						<xsl:if  test="notification_data/incoming_request/requester_email" >
							<tr>
								<td>
									<b>@@requester_email@@: </b>
									<xsl:value-of select="notification_data/incoming_request/requester_email"/>
								</td>
							</tr>
						</xsl:if>
-->
<!--
						<xsl:if  test="notification_data/assignee != ''" >
							<tr>
								<td>
									<b>@@assignee@@: </b>
									<xsl:value-of select="notification_data/assignee"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if test="notification_data/item != ''" >
							<xsl:if test="call_number != ''"  >
								<tr>
									<td><b>@@call_number@@: </b><xsl:value-of select="notification_data/item/call_number"/></td>
								</tr>
							</xsl:if>

							<xsl:if test="shelving_location/string" >
								<tr>
									<td><b>@@shelving_location_for_item@@: </b>
									 <xsl:for-each select="shelving_location/string">
										<xsl:value-of select="."/>
									 </xsl:for-each>
									</td>
								</tr>
							</xsl:if>
						</xsl:if>
-->
</table>
<br/>
<table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>
								<b>@@supplied_to@@: </b>
								<xsl:value-of select="notification_data/partner_name"/>
							</td>
						</tr>

			            <tr>
			                <td>
			                  <b>@@shipping_address@@: </b>
			                </td>
			            </tr>
			            
			            <xsl:if test="notification_data/incoming_request/borrowing_institution!=''">
                            <tr><td> <xsl:value-of select="notification_data/incoming_request/borrowing_institution"/></td></tr>
                        </xsl:if>

                        <xsl:if test="notification_data/incoming_request/borrowing_library!=''">
                           <tr><td> <xsl:value-of select="notification_data/incoming_request/borrowing_library"/></td></tr>
                        </xsl:if>
							<table cellspacing="0" cellpadding="5" border="0">
								<xsl:attribute name="style">
									<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
									<tr><td><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address1"/></td></tr>
									<xsl:if test="notification_data/partner_shipping_info_list/partner_shipping_info/address2!=''">
									<tr><td><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address2"/></td></tr>
									</xsl:if>
									<xsl:if test="notification_data/partner_shipping_info_list/partner_shipping_info/address4!=''">
									<tr><td><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address4"/></td></tr>
									</xsl:if>
									<xsl:if test="notification_data/partner_shipping_info_list/partner_shipping_info/address5!=''">
									<tr><td><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address5"/></td></tr>
									</xsl:if>
									<xsl:if test="notification_data/partner_shipping_info_list/partner_shipping_info/city!=''">
									<tr><td><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city"/>,&#160;<xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state"/>&#160;<xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code"/></td></tr></xsl:if>
<!--
<xsl:if test="notification_data/partner_code='SEAU_LEMIEUX'">
<tr><td>Lemieux Library</td></tr>
<tr><td>901 12th Avenue</td></tr>
<tr><td>Seattle, WA 98122</td></tr>
</xsl:if>
-->
							</table>
<br/>
							<table cellspacing="0" cellpadding="5" border="0">
								<xsl:attribute name="style">
									<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
			            <tr>
			                <td>
			                  <b>Return to: </b>
			                </td>
			            </tr>
									<tr><td><xsl:value-of select="notification_data/item/owning_library_details/address1"/></td></tr>
									<xsl:if test="notification_data/item/owning_library_details/address2!=''">
									<tr><td><xsl:value-of select="notification_data/item/owning_library_details/address2"/></td></tr>
									</xsl:if>
									<xsl:if test="notification_data/item/owning_library_details/address4!=''">
									<tr><td><xsl:value-of select="notification_data/item/owning_library_details/address4"/></td></tr>
									</xsl:if>
									<xsl:if test="notification_data/item/owning_library_details/address5!=''">
									<tr><td><xsl:value-of select="notification_data/item/owning_library_details/address5"/></td></tr>
									</xsl:if>
									<xsl:if test="notification_data/item/owning_library_details/city!=''">
									<tr><td><xsl:value-of select="notification_data/item/owning_library_details/city"/>,&#160;<xsl:value-of select="notification_data/item/owning_library_details/state"/>&#160;<xsl:value-of select="notification_data/item/owning_library_details/postal_code"/></td></tr></xsl:if>

							</table>
					</table>
				</div>
			</div>
<br/>
<!--	<xsl:call-template name="lastFooter" /> --><!-- footer.xsl -->
</body>
</html>
	</xsl:template>
</xsl:stylesheet>
