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

			<div class="messageArea">
				<div class="messageBody">

<table cellspacing="0" cellpadding="4" border="0" width="47%">
				<tr><td><xsl:call-template name="head" /></td></tr> <!-- header.xsl -->
<xsl:choose>
<!--
<xsl:when test="(notification_data/partner_code='CC') or (notification_data/partner_code='CCC') or (notification_data/partner_code='CHEMEK') or (notification_data/partner_code='COCC') or (notification_data/partner_code='CWU') or (notification_data/partner_code='Central Washington University - Brooks Library') or (notification_data/partner_code='EOU') or (notification_data/partner_code='EVSC') or (notification_data/partner_code='EWU') or (notification_data/partner_code='Evergreen State College -  Olympia Campus Library') or (notification_data/partner_code='GFOX_MLRC') or (notification_data/partner_code='GFOX_PCL') or (notification_data/partner_code='GONZ') or (notification_data/partner_code='LANECC') or (notification_data/partner_code='LCC') or (notification_data/partner_code='LINF_MAC') or (notification_data/partner_code='LINF_PDX') or (notification_data/partner_code='MHCC') or (notification_data/partner_code='OHSU') or (notification_data/partner_code='OIT_KFLS') or (notification_data/partner_code='OIT_WILS') or (notification_data/partner_code='OSU') or (notification_data/partner_code='Oregon Health and Science University - OHSU Library') or (notification_data/partner_code='PCC') or (notification_data/partner_code='PSU') or (notification_data/partner_code='PU_FG') or (notification_data/partner_code='PU_HPC') or (notification_data/partner_code='Portland Community College - Rock Creek') or (notification_data/partner_code='Portland State University - PSU Library') or (notification_data/partner_code='REED') or (notification_data/partner_code='SEAU_LAW') or (notification_data/partner_code='SEAU_LEMIEUX') or (notification_data/partner_code='SOU_RCCM') or (notification_data/partner_code='SOU_SOU') or (notification_data/partner_code='SPU') or (notification_data/partner_code='STMU') or (notification_data/partner_code='Southern Oregon University - Hannon Library') or (notification_data/partner_code='UID_LAW') or (notification_data/partner_code='UID_MAIN') or (notification_data/partner_code='UO') or (notification_data/partner_code='UPORT') or (notification_data/partner_code='UPUGS') or (notification_data/partner_code='UW') or (notification_data/partner_code='University of Oregon - Knight Library') or (notification_data/partner_code='WALLA_PETERSON') or (notification_data/partner_code='WALLA_PORTLAND') or (notification_data/partner_code='WHITC') or (notification_data/partner_code='WOU') or (notification_data/partner_code='WPC') or (notification_data/partner_code='WSU_HOLLTERR') or (notification_data/partner_code='WSU_RPOINT') or (notification_data/partner_code='WSU_TRICITIES') or (notification_data/partner_code='WSU_VANCOUVER') or (notification_data/partner_code='WU_LAW') or (notification_data/partner_code='WU_MOH') or (notification_data/partner_code='WU_PNCA') or (notification_data/partner_code='WWO') or (notification_data/partner_code='WWU') or (notification_data/partner_code='Washington State University - Holland and Terrell Libraries') or (notification_data/partner_code='Washington State University - Vancouver Library')">
-->
<xsl:when test="(notification_data/incoming_request/rapido_request='true') and (notification_data/pod_name='OrCa')">
<tr><td>SUMMIT REQUEST</td></tr>
</xsl:when>
<xsl:when test="notification_data/incoming_request/rapido_request='true'">
<tr><td>RAPIDO REQUEST</td></tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/rapido_request='false') and (notification_data/partner_system_type='ALMA') and (contains(notification_data/partner_code, '01SUNY'))">
<tr><td>HYBRID POD REQUEST</td></tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/rapido_request='false') and (notification_data/partner_system_type='ALMA')and not(contains(notification_data/partner_code, '01SUNY'))">
<tr><td>SUMMIT REQUEST</td></tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/rapido_request='false') and not(contains(notification_data/partner_code, '_RAPID'))" >
<tr><td>HYBRID POD REQUEST</td></tr>
</xsl:when>
<xsl:otherwise>
<tr><td>RAPID ILL REQUEST</td></tr>
</xsl:otherwise>
</xsl:choose>

<tr><td>&#160;</td></tr>
			            <tr>
			                <td>
			                    <b>External ID: </b>
     			                  <xsl:value-of select="notification_data/group_qualifier"/>
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
					<tr>
								<td>
									<b>@@call_number@@: </b><xsl:value-of select="notification_data/item/call_number"/>
								</td>
					</tr>
					<tr>
							  <td><b>Barcode: </b><img src="Barcode1.png" alt="Barcode1" /></td>
					</tr>
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
<!--
							<tr>
								<td><xsl:value-of select="notification_data/item/title"/></td>
							</tr>
-->

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
			<table role='presentation'  cellspacing="0" cellpadding="5" border="0" width="47%">
<!--Rapido Requests-->
				<xsl:if test="(notification_data/incoming_request/rapido_request='true') and (notification_data/pod_name!='OrCa')">
					<table cellspacing="0" cellpadding="0" border="1" width="47%">
						<tr>
							<td style="font-size:15px;width:500px">
								<font size="2">Return To: </font>
								<br /><br />
								<center><b><xsl:value-of select="notification_data/item/library_name" /></b></center>
								<center><b><xsl:value-of select="notification_data/item/owning_library_details/address1" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address2" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address3" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address4" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address5" /></b></center>
							    <center><b>
									 <xsl:value-of select="notification_data/item/owning_library_details/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
						<tr>
							<td style="font-size:15px;width:500px">
							   <font size="2">Ship To:</font>
							   <br /><br />
							   <center><b><xsl:value-of select="notification_data/partner_name" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address1" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address2" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address3" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address4" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address5" /></b></center>
							   <center><b>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
					</table>
				</xsl:if>
<!--Hybrid Pod Requests. 01SUNY partner code-->
				<xsl:if test="(notification_data/incoming_request/rapido_request='false') and (notification_data/partner_system_type='ALMA') and (contains(notification_data/partner_code, '01SUNY'))">
					<table cellspacing="0" cellpadding="0" border="1" width="47%">
						<tr>
							<td style="font-size:15px;width:500px">
								<font size="2">Return To: </font>
								<br /><br />
								<center><b><xsl:value-of select="notification_data/item/library_name" /></b></center>
								<center><b><xsl:value-of select="notification_data/item/owning_library_details/address1" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address2" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address3" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address4" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address5" /></b></center>
							    <center><b>
									 <xsl:value-of select="notification_data/item/owning_library_details/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
						<tr>
							<td style="font-size:15px;width:500px">
							   <font size="2">Ship To:</font>
							   <br /><br />
							   <center><b><xsl:value-of select="notification_data/partner_name" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address1" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address2" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address3" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address4" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address5" /></b></center>
							   <center><b>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
					</table>
				</xsl:if>
<!--Hybrid Pod Requests. Other partner code-->
				<xsl:if test="((notification_data/incoming_request/rapido_request='false') and not(notification_data/partner_system_type='ALMA') and not(contains(notification_data/partner_code, '_RAPID')))" >
					<table cellspacing="0" cellpadding="0" border="1" width="47%">
						<tr>
							<td style="font-size:15px;width:500px">
								<font size="2">Return To: </font>
								<br /><br />
								<center><b><xsl:value-of select="notification_data/item/library_name" /></b></center>
								<center><b><xsl:value-of select="notification_data/item/owning_library_details/address1" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address2" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address3" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address4" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address5" /></b></center>
							    <center><b>
									 <xsl:value-of select="notification_data/item/owning_library_details/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
						<tr>
							<td style="font-size:15px;width:500px">
							   <font size="2">Ship To:</font>
							   <br /><br />
							   <center><b><xsl:value-of select="notification_data/partner_name" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address1" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address2" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address3" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address4" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address5" /></b></center>
							   <center><b>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
					</table>
				</xsl:if>
<!--RapidILL Requests-->
				<xsl:if test="((notification_data/incoming_request/rapido_request='false') and (contains(notification_data/partner_code, '_RAPID')))" >
					<table cellspacing="0" cellpadding="0" border="1" width="47%">
						<tr>
							<td style="font-size:15px;width:500px">
							    <font size="2">Return To: </font>
							    <br /><br />
							    <center><b><xsl:value-of select="notification_data/item/library_name" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address1" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address2" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address3" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address4" /></b></center>
							    <center><b><xsl:value-of select="notification_data/item/owning_library_details/address5" /></b></center>
							    <center><b>
									 <xsl:value-of select="notification_data/item/owning_library_details/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/item/owning_library_details/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
						<tr>
							<td style="font-size:15px;width:500px">
							    <font size="2">Ship To:</font>
							    <br /><br />
<!--RapidILL Requests without addresses-->
<!--According to ExL, we can file a ticket to get their branch shipping address updated in RapidILL-->
									<xsl:if test="((notification_data/incoming_request/contact_address='') and (notification_data/incoming_request/borrowing_institution='Arizona State University'))" >
										<center><b>Arizona State University - ILL</b></center>
										<center><b>601 E Tyler Mall</b></center>
										<center><b>Tempe, AZ 85281</b></center>
									</xsl:if>
<!--RapidILL Requests with addresses-->
<!--They are all one long string, so have to parse-->
<!--Examples of contact_address strings:
Interlibrary Loan &amp; Library Express, Zimmerman Library, University of New Mexico, 1900 Roma Ave NE, Albuquerque, NM 87131-0001 , (5 internal commas)
UT Libraries - Interlibrary Services, 101 E 21st STOP S5463, First Floor Dock, Austin, TX 78712-1492 (4 internal commas)
Blake's office, 123 Library Lane, Pullman, WA 99163 (3 internal commas)
Blake's office, Pullman, WA 99163 (2 internal commas)-->
									<xsl:if test="(notification_data/incoming_request/contact_address!='')" >
										<xsl:variable name="rapidAddress" select="normalize-space(notification_data/incoming_request/contact_address)"/>
										<xsl:variable name="raPart1" select="substring-before($rapidAddress, ',')"/>
										<xsl:variable name="raPart2" select="substring-after($rapidAddress, ',')"/>
										<xsl:variable name="raPart3" select="substring-before($raPart2, ',')"/>
										<xsl:variable name="raPart4" select="substring-after($raPart2, ',')"/>
										<xsl:variable name="raPart5" select="substring-before($raPart4, ',')"/>
										<xsl:variable name="raPart6" select="substring-after($raPart4, ',')"/>
										<xsl:variable name="raPart7" select="substring-before($raPart6, ',')"/>
										<xsl:variable name="raPart8" select="substring-after($raPart6, ',')"/>
										<xsl:variable name="raPart9" select="substring-before($raPart8, ',')"/>
										<xsl:variable name="raPart10" select="substring-after($raPart8, ',')"/>
											<center><b><xsl:value-of select="notification_data/incoming_request/borrowing_institution" /></b></center>
											<xsl:choose>
												<xsl:when test="($raPart10 != '')" >
													<center><b><xsl:value-of select="$raPart1" /></b></center>
													<center><b><xsl:value-of select="$raPart3" /></b></center>
													<center><b><xsl:value-of select="$raPart5" /></b></center>
													<center><b><xsl:value-of select="$raPart7" /></b></center>
													<center><b><xsl:value-of select="$raPart8" /></b></center>
												</xsl:when>
												<xsl:when test="(($raPart10 = '') and ($raPart8 != ''))" >
													<center><b><xsl:value-of select="$raPart1" /></b></center>
													<center><b><xsl:value-of select="$raPart3" /></b></center>
													<center><b><xsl:value-of select="$raPart5" /></b></center>
													<center><b><xsl:value-of select="$raPart6" /></b></center>
												</xsl:when>
												<xsl:when test="(($raPart10 = '') and ($raPart8 = '') and ($raPart6 != ''))" >
													<center><b><xsl:value-of select="$raPart1" /></b></center>
													<center><b><xsl:value-of select="$raPart3" /></b></center>
													<center><b><xsl:value-of select="$raPart4" /></b></center>
												</xsl:when>
												<xsl:when test="(($raPart10 = '') and ($raPart8 = '') and ($raPart6 ='') and ($raPart4 != ''))" >
													<center><b><xsl:value-of select="$raPart1" /></b></center>
													<center><b><xsl:value-of select="$raPart2" /></b></center>
												</xsl:when>
												<xsl:otherwise>
													<center><b><xsl:value-of select="notification_data/incoming_request/contact_address" /></b></center>
												</xsl:otherwise>
											</xsl:choose>
									</xsl:if>
								<br />
							</td>
						</tr>
					</table>
				</xsl:if>
			</table>
		</div>
	</div>
<br/>
<!--	<xsl:call-template name="lastFooter" /> --><!-- footer.xsl -->
</body>
</html>
	</xsl:template>
</xsl:stylesheet>
