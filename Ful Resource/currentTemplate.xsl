<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
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
			<table role='presentation'  cellspacing="0" cellpadding="5" border="0" width="45%">
				<xsl:if test="notification_data/user_for_printing/name != ''" >
					<h3><strong><xsl:value-of select="notification_data/user_for_printing/name"/></strong></h3>
					<h3><strong>@@move_to_library@@: </strong><xsl:value-of select="notification_data/destination"/></h3>
				</xsl:if>
				<xsl:if test="notification_data/incoming_request/note != ''" >
				<xsl:variable name="noteline" select="notification_data/incoming_request/note"/>
				<xsl:variable name="notepart1" select="substring-after($noteline, '||')"/>
				<xsl:variable name="fullname" select="substring-before($notepart1, '||')"/>
				<xsl:variable name="notepart2" select="substring-after($notepart1, '||')"/>
				<xsl:variable name="libraryname" select="substring-after($notepart2, '||')"/>
				<tr>
					<td><h3><strong><xsl:value-of select="$fullname"/></strong></h3></td>
				</tr>
				<tr>
					<td><h3><strong>Pickup at: <xsl:value-of select="$libraryname"/></strong></h3></td>
				</tr>
				</xsl:if>			
				<xsl:choose>
					<xsl:when test="notification_data/incoming_request/partner_name='CC'">
						<tr>			
							<td><h3><strong>Partner: Clark College</strong></h3></td>
						</tr>
					</xsl:when>
					<xsl:when test="notification_data/incoming_request/partner_name='CCC'">
						<tr>			
							<td><h3><strong>Partner: Clackamas Community College</strong></h3></td>
						</tr>
					</xsl:when>
					<xsl:when test="notification_data/incoming_request/partner_name='CHEMEK'">
						<tr>			
							<td><h3><strong>Partner: Chemeketa Community College</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='COCC'">
						<tr>			
							<td><h3><strong>Partner: Central Oregon Community College</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='CWU'">
						<tr>			
							<td><h3><strong>Partner: Central Washington University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='EOU'">
						<tr>			
							<td><h3><strong>Partner: Eastern Oregon University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='EVSC'">
						<tr>			
							<td><h3><strong>Partner: The Evergreen State College</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='EWU JFK'">
						<tr>			
							<td><h3><strong>Partner: Eastern Washington University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='GFOX_MLRC'">
						<tr>			
							<td><h3><strong>Partner: George Fox University - Newberg</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='GFOX_PCL'">
						<tr>			
							<td><h3><strong>Partner: George Fox University - Portland</strong></h3></td>
						</tr>
					</xsl:when>
								<xsl:when test="notification_data/incoming_request/partner_name='GONZ'">
						<tr>			
							<td><h3><strong>Partner: Gonzaga University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='LANECC'">
						<tr>			
							<td><h3><strong>Partner: Lane Community College</strong></h3></td>
						</tr>
					</xsl:when>		
					<xsl:when test="notification_data/incoming_request/partner_name='LCC'">
						<tr>			
							<td><h3><strong>Partner: Lewis &amp; Clark College</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='LINF_MAC'">
						<tr>			
							<td><h3><strong>Partner: Linfield University - McMinnville</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='LINF_PDX'">
						<tr>			
							<td><h3><strong>Partner: Linfield University - Portland</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='MHCC'">
						<tr>			
							<td><h3><strong>Partner: Mount Hood Community College</strong></h3></td>
						</tr>
					</xsl:when>		
					<xsl:when test="notification_data/incoming_request/partner_name='OHSU'">
						<tr>			
							<td><h3><strong>Partner: Oregon Health and Science University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='OIT_KFLS'">
						<tr>			
							<td><h3><strong>Partner: Oregon Tech - Klamath Falls</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='OIT_WILS'">
						<tr>			
							<td><h3><strong>Partner: Oregon Tech - Wilsonville</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='OSU'">
						<tr>			
							<td><h3><strong>Partner: Oregon State University</strong></h3></td>
						</tr>
					</xsl:when>
					<xsl:when test="notification_data/incoming_request/partner_name='OSU_BEND'">
						<tr>			
							<td><h3><strong>Partner: OSU Cascades – Bend</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='OSU_NEWPORT'">
						<tr>			
							<td><h3><strong>Partner: OSU Hatfield Marine Science Center</strong></h3></td>
						</tr>
					</xsl:when>			
					<xsl:when test="notification_data/incoming_request/partner_name='PCC'">
						<tr>			
							<td><h3><strong>Partner: Portland Community College</strong></h3></td>
						</tr>
					</xsl:when>		
					<xsl:when test="notification_data/incoming_request/partner_name='PSU'">
						<tr>			
							<td><h3><strong>Partner: Portland State University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='PU_FG'">
						<tr>			
							<td><h3><strong>Partner: Pacific University - Forest Grove</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='PU_HPC'">
						<tr>			
							<td><h3><strong>Partner: Pacific University - Hillsboro</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='REED'">
						<tr>			
							<td><h3><strong>Partner: Reed College</strong></h3></td>
						</tr>
					</xsl:when>		
					<xsl:when test="notification_data/incoming_request/partner_name='SEAU_LEMIEUX'">
						<tr>			
							<td><h3><strong>Partner: Seattle University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='SEAU_LAW'">
						<tr>			
							<td><h3><strong>Partner: Seattle University - Law</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='SOU_SOU'">
						<tr>			
							<td><h3><strong>Partner: Southern Oregon University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='SOU_RCCM'">
						<tr>			
							<td><h3><strong>Partner: Rogue Community College - SOU</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='SPU'">
						<tr>			
							<td><h3><strong>Partner: Seattle Pacific University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='STMU'">
						<tr>			
							<td><h3><strong>Partner: Saint Martin's University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='UID_MAIN'">
						<tr>			
							<td><h3><strong>Partner: University of Idaho</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='UID_LAW'">
						<tr>			
							<td><h3><strong>Partner: University of Idaho - Law</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='UO'">
						<tr>			
							<td><h3><strong>Partner: University of Oregon</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='UPORT'">
						<tr>			
							<td><h3><strong>Partner: University of Portland</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='UPUGS'">
						<tr>			
							<td><h3><strong>Partner: University of Puget Sound</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='UW'">
						<tr>			
							<td><h3><strong>Partner: University of Washington</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WALLA_PETERSON'">
						<tr>			
							<td><h3><strong>Partner: Walla Walla University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WALLA_PORTLAND'">
						<tr>			
							<td><h3><strong>Partner: Walla Walla University - Portland</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WHITC'">
						<tr>			
							<td><h3><strong>Partner: Whitman College</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WOU'">
						<tr>			
							<td><h3><strong>Partner: Western Oregon University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WPC'">
						<tr>			
							<td><h3><strong>Partner: Warner Pacific University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WSU_HOLLTERR'">
						<tr>			
							<td><h3><strong>Partner: Washington State University - Pullman</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WSU_RPOINT'">
						<tr>			
							<td><h3><strong>Partner: Washington State University - Spokane</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WSU_TRICITIES'">
						<tr>			
							<td><h3><strong>Partner: Washington State University - TriCities</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WSU_VANCOUVER'">
						<tr>			
							<td><h3><strong>Partner: Washington State University - Vancouver</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WU_MOH'">
						<tr>			
							<td><h3><strong>Partner: Willamette University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WU_LAW'">
						<tr>			
							<td><h3><strong>Partner: Willamette University - Law</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WU_PNCA'">
						<tr>			
							<td><h3><strong>Partner: Willamette University - PNCA</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WWO'">
						<tr>			
							<td><h3><strong>Partner: Whitworth University</strong></h3></td>
						</tr>
					</xsl:when>	
					<xsl:when test="notification_data/incoming_request/partner_name='WWU'">
						<tr>			
							<td><h3><strong>Partner: Western Washington University</strong></h3></td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<td>
							<h3><xsl:value-of select="notification_data/partner_name"/></h3>
						</td>
					</xsl:otherwise>
				</xsl:choose>
				<tr>
					<td><xsl:call-template name="head" /> <!-- header.xsl --></td>
				</tr>
			</table>
	<div class="messageArea">
		<div class="messageBody">
			<table role='presentation'  cellspacing="0" cellpadding="5" border="0" width="45%">
				<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
					<tr>
						<td><strong>@@note_item_specified_request@@.</strong></td>
					</tr>
				</xsl:if>
				<xsl:if  test="notification_data/request/manual_description != ''" >
					<tr>
						<td><strong>@@please_note@@: </strong>@@manual_description_note@@ - <xsl:value-of select="notification_data/request/manual_description"/></td>
					</tr>
				</xsl:if>
				<tr>
					<td><strong>Library: </strong><xsl:value-of select="notification_data/phys_item_display/library_name"/></td>
				</tr>
				<tr>
					<td><strong>@@location@@: </strong><xsl:value-of select="notification_data/phys_item_display/location_name"/></td>
				</tr>
				<xsl:if test="notification_data/phys_item_display/call_number != ''">
					<tr>
						<td><strong>@@call_number@@: </strong><xsl:value-of select="notification_data/phys_item_display/call_number"/></td>
					</tr>
				</xsl:if>
				<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
					<tr>
						<td><strong>@@item_barcode@@: </strong><xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode" /></td>
					</tr>
				</xsl:if>
				<xsl:if  test="notification_data/incoming_request/external_request_id != ''" >
					<tr>
						<td><strong>@@external_id@@: </strong><img src="cid:externalId.png" alt="External Request ID"/></td>
					</tr>
				</xsl:if>
				<tr>
					<td><strong>Title: </strong><xsl:call-template name="recordTitle" /></td>
				</tr>
				<xsl:if test="notification_data/phys_item_display/isbn != ''">
					<tr>
						<td><strong>@@isbn@@: </strong><xsl:value-of select="notification_data/phys_item_display/isbn"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="notification_data/phys_item_display/issn != ''">
					<tr>
						<td><strong>@@issn@@: </strong><xsl:value-of select="notification_data/phys_item_display/issn"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="notification_data/phys_item_display/edition != ''">
					<tr>
						<td><strong>@@edition@@: </strong><xsl:value-of select="notification_data/phys_item_display/edition"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="notification_data/phys_item_display/imprint != ''">
					<tr>
						<td><strong>@@imprint@@: </strong><xsl:value-of select="notification_data/phys_item_display/imprint"/></td>
					</tr>
				</xsl:if>
				<tr>	
					<xsl:if test="notification_data/phys_item_display/accession_number != ''">
						<td><h3><strong>@@accession_number@@: </strong><xsl:value-of select="notification_data/phys_item_display/accession_number"/></h3></td>
					</xsl:if>
				</tr>
				<xsl:if  test="notification_data/phys_item_display/shelving_location/string" >
					<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
						<tr>
							<td><strong>@@shelving_location_for_item@@: </strong>
							 <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
								<xsl:value-of select="."/>
							 &#160;
							 </xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
						<tr>
							<td><strong>@@shelving_locations_for_holding@@: </strong>
							<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
								<xsl:value-of select="."/>
							&#160;
							 </xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
						<tr>
							<td><strong>@@shelving_locations_for_holding@@: </strong>
							<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
								<xsl:value-of select="."/>
							&#160;
							 </xsl:for-each>
							</td>
						</tr>
					</xsl:if>
				</xsl:if>	
				<xsl:if  test="notification_data/phys_item_display/display_alt_call_numbers/string" >
					<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
						<tr>
							<td><strong>@@alt_call_number@@: </strong>
							 <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
								<xsl:value-of select="."/>
							 &#160;
							 </xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
						<tr>
							<td><strong>@@alt_call_number@@: </strong>
							<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
								<xsl:value-of select="."/>
							&#160;
							 </xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
						<tr>
							<td><strong>@@alt_call_number@@: </strong>
							<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
								<xsl:value-of select="."/>
							&#160;
							 </xsl:for-each>
							</td>
						</tr>
					</xsl:if>
				</xsl:if>
<!--
				<tr>
					<td><strong>@@move_to_library@@: </strong><xsl:value-of select="notification_data/destination"/></td>
				</tr>
-->
				<tr>
					<td><strong>@@request_type@@: </strong><xsl:value-of select="notification_data/request_type"/></td>
				</tr>
				<xsl:if test="notification_data/request/chapter_article_title != ''">
					<tr>
						<td><strong>@@enum_h@@:  </strong><xsl:value-of select="notification_data/request/chapter_article_title"/>, pp. <xsl:value-of select="notification_data/request/pages"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="notification_data/request/system_notes != ''">
					<tr>
						<td><strong>@@system_notes@@:</strong><xsl:value-of select="notification_data/request/system_notes"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="notification_data/request/note != ''" >
					<tr>
						<td><strong>@@request_note@@:</strong> <xsl:value-of select="notification_data/request/note"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="notification_data/request_type='Ship digitally'" >
					<tr>
						<td><strong>The copyright law of the United States (title 17, United States Code) governs the making of photocopies or other reproductions of copyrighted material.</strong>
Under certain conditions specified in the law, libraries and archives are authorized to furnish a photocopy or other reproduction. One of these specific conditions is that the photocopy or reproduction is not to be “used for any purpose other than private study, scholarship, or research.” If a user makes a request for, or later uses, a photocopy or reproduction for purposes in excess of “fair use,” that user may be liable for copyright infringement.</td>
					</tr>
				</xsl:if>
			</table>
			<table role='presentation'  cellspacing="0" cellpadding="5" border="0" width="45%">
				<xsl:if test="notification_data/request_type='Ship physically' and notification_data/incoming_request/rapido_request='true'" >
					<tr>
						<td><b><xsl:text>_______________________________________________</xsl:text></b></td>
					</tr>
<!--<p style="page-break-before: always"></p> -->
					<table cellspacing="0" cellpadding="0" border="1" width="45%">
						<tr>
						<td style="font-size:16px;width:500px">
						   <font size="2">Return To: </font>
						   <br />
						   <br />
						  <center>
							  <b>
								 <xsl:value-of select="notification_data/organization_unit/name" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address1" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address2" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address3" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address4" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address5" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/city" />
								 <xsl:text>, </xsl:text>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/state" />
								 <xsl:text> </xsl:text>
								 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/postal_code" />
							  </b>
						   </center>
						   <br />
						</td>
					 </tr>
					 <tr>
						<td style="font-size:16px;width:500px">
						   <font size="2">Ship To:</font>
						   <br />
						   <br />
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/partner_name" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address1" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address2" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address3" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address4" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address5" />
							  </b>
						   </center>
						   <center>
							  <b>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city" />
								 <xsl:text>, </xsl:text>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state" />
								 <xsl:text> </xsl:text>
								 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code" />
							  </b>
						   </center>
						   <br />
						</td>
					 </tr>
				  </table>
					</xsl:if>
						<xsl:if test="((notification_data/incoming_request/rapido_request='false') and (notification_data/request_type='Ship physically') and (contains(notification_data/incoming_request/partner_code, '_RAPID')))" >
                              <tr>
                                 <td>
                                    <b>
                                       <xsl:text>_______________________________________________</xsl:text>
                                    </b>
                                 </td>
                              </tr>
<!--<p style="page-break-before: always"></p> -->
                              <table cellspacing="0" cellpadding="0" border="1" width="45%">
                                 <tr>
                                    <td style="font-size:16px;width:500px">
                                       <font size="2">Return To: </font>
                                       <br />
                                       <br />
                                      <center>
                                          <b>
                                             <xsl:value-of select="notification_data/organization_unit/name" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address1" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address2" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address3" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address4" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/address5" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/city" />
                                             <xsl:text>, </xsl:text>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/state" />
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="notification_data/phys_item_display/owning_library_details/postal_code" />
                                          </b>
                                       </center>
                                       <br />
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="font-size:16px;width:500px">
                                       <font size="2">Ship To:</font>
                                       <br />
                                       <br />
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/partner_name" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/incoming_request/contact_address" />
                                          </b>
                                       </center>
<!--
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address1" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address2" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address3" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address4" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address5" />
                                          </b>
                                       </center>
                                       <center>
                                          <b>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city" />
                                             <xsl:text>, </xsl:text>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state" />
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code" />
                                          </b>
                                       </center>
-->
                                       <br />
                                    </td>
                                 </tr>
                              </table>
							</xsl:if>
				</table>
		</div>
	</div>
	<!--<xsl:call-template name="lastFooter" />--> <!-- footer.xsl -->
</body>
</html>
	</xsl:template>
</xsl:stylesheet>
