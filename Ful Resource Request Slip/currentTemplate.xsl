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
					<h2><strong><xsl:value-of select="notification_data/user_for_printing/name"/></strong></h2>
					<h2><strong>@@move_to_library@@: </strong><xsl:value-of select="notification_data/destination"/></h2>
				</xsl:if>
				<xsl:if test="notification_data/incoming_request/note != ''" >
				<xsl:variable name="noteline" select="notification_data/incoming_request/note"/>
				<xsl:variable name="notepart1" select="substring-after($noteline, '||')"/>
				<xsl:variable name="fullname" select="substring-before($notepart1, '||')"/>
				<xsl:variable name="notepart2" select="substring-after($notepart1, '||')"/>
				<xsl:variable name="libraryname" select="substring-after($notepart2, '||')"/>
					<xsl:if test="$fullname != ''" >
						<tr><td><h2><strong><xsl:value-of select="$fullname"/></strong></h2></td></tr>
					</xsl:if>
					<xsl:if test="$libraryname != ''" >
	
						<xsl:if test="notification_data/incoming_request/partner_name='CC'">
							<tr><td><h2><strong>Ship To: CLARK - Clark College</strong></h2></td></tr>
						</xsl:if>
						<xsl:if test="notification_data/incoming_request/partner_name='CCC'">
							<tr><td><h2><strong>Ship To: CLCKM - Clackamas Community College</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='CHEMEK'">
							<tr><td><h2><strong>Ship To: CHEMEK - Chemeketa Community College</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='COCC'">
							<tr><td><h2><strong>Ship To: COCC - Central Oregon Community College</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='CWU'">
							<tr><td><h2><strong>Ship To: CWU - Central Washington University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='EOU'">
							<tr><td><h2><strong>Ship To: EOU - Eastern Oregon University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='EVSC'">
							<tr><td><h2><strong>Ship To: TESC - The Evergreen State College</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='EWU JFK'">
							<tr><td><h2><strong>Ship To: EWU - Eastern Washington University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='GFOX_MLRC'">
							<tr><td><h2><strong>Ship To: GFOX - George Fox University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='GONZ'">
							<tr><td><h2><strong>Ship To: GONZ - Gonzaga University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='LANECC'">
							<tr><td><h2><strong>Ship To: LANE - Lane Community College</strong></h2></td></tr>
						</xsl:if>		
						<xsl:if test="notification_data/incoming_request/partner_name='LCC'">
							<tr><td><h2><strong>Ship To: LEWIS - Lewis &amp; Clark College</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='McMinnville' or $libraryname='OCE via Mail'">
							<tr><td><h2><strong>Ship To: LINF-MAC - Linfield University McMinnville</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Portland' and contains(notification_data/incoming_request/partner_name, 'LINF')">
							<tr><td><h2><strong>Ship To: LINF-PDX - Linfield University Portland</strong></h2></td></tr>
						</xsl:if>		
						<xsl:if test="notification_data/incoming_request/partner_name='MHCC'">
							<tr><td><h2><strong>Ship To: MHCC - Mt. Hood Community College</strong></h2></td></tr>
						</xsl:if>		
						<xsl:if test="notification_data/incoming_request/partner_name='OHSU'">
							<tr><td><h2><strong>Ship To: OHSU - Oregon Health &amp; Science University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Klamath Falls Library'">
							<tr><td><h2><strong>Ship To: OIT-KFLS - Oregon Tech Klamath Falls</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Portland-Metro Library'">
							<tr><td><h2><strong>Ship To: OIT-PM - Oregon Tech Portland Metro</strong></h2></td></tr>
						</xsl:if>
						<xsl:if test="$libraryname='Personal Delivery'and contains(notification_data/incoming_request/partner_name, 'OSU')">
							<tr><td><h2><strong>Ship To: OSU-COR - Oregon State University Corvallis</strong></h2></td></tr>
						</xsl:if>
						<xsl:if test="$libraryname=' Valley Library-Corvallis'">
							<tr><td><h2><strong>Ship To: OSU-COR - Oregon State University Corvallis</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='OSU-Cascades Library-Bend'">
							<tr><td><h2><strong>Ship To: OSU-BEND - Oregon State University Cascades</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Guin Library-Newport'">
							<tr><td><h2><strong>Ship To: OSU-NEWP - Oregon State University Newport</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='PCC'">
							<tr><td><h2><strong>Ship To: PCC - Portland Community College</strong></h2></td></tr>
						</xsl:if>		
						<xsl:if test="notification_data/incoming_request/partner_name='PSU' or notification_data/incoming_request/partner_name='Portland State University - PSU Library' or notification_data/incoming_request/partner_name='Portland State University - PSU Library (Community)'">
							<tr><td><h2><strong>Ship To: PSU - Portland State University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Eugene' or $libraryname='Forest Grove' or $libraryname='Woodburn'">
							<tr><td><h2><strong>Ship To: PU-FG - Pacific University Forest Grove</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Hillsboro'">
							<tr><td><h2><strong>Ship To: PU-HILS - Pacific University Hillsboro</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='REED'">
							<tr><td><h2><strong>Ship To: REED - Reed College</strong></h2></td></tr>
						</xsl:if>		
						<xsl:if test="notification_data/incoming_request/partner_name='SEAU_LEMIEUX'">
							<tr><td><h2><strong>Ship To: SEAU - Seattle University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='SEAU_LAW'">
							<tr><td><h2><strong>Ship To: SEAU - Seattle University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Hannon Library'">
							<tr><td><h2><strong>Ship To: SOU - Southern Oregon University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Medford - RCC'">
							<tr><td><h2><strong>Ship To: RCC - Rogue Community College/SOU</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='SPU'">
							<tr><td><h2><strong>Ship To: SPU - Seattle Pacific University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='STMU'">
							<tr><td><h2><strong>Ship To: STMU - Saint Martin's University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='UID_MAIN'">
							<tr><td><h2><strong>Ship To: UI - University of Idaho</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='UID_LAW'">
							<tr><td><h2><strong>Ship To: UI - University of Idaho</strong></h2></td></tr>
						</xsl:if>
						<xsl:if test="notification_data/incoming_request/partner_name='UO' and contains($libraryname, 'Delivery')">
							<tr><td><h2><strong>Ship To: UO-EUG - University of Oregon Eugene</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Design Library' or $libraryname='John E. Jaqua Law Library' or $libraryname='Knight Library' or $libraryname='Mathematics Library' or $libraryname='Price Science Commons and Research Library'">
							<tr><td><h2><strong>Ship To: UO-EUG - University of Oregon Eugene</strong></h2></td></tr>
						</xsl:if>
						<xsl:if test="$libraryname='Portland Library and Learning Commons' or $libraryname='Portland NE Library'">
							<tr><td><h2><strong>Ship To: UO-PDX - University of Oregon Portland</strong></h2></td></tr>
						</xsl:if>
						<xsl:if test="notification_data/incoming_request/partner_name='UPORT'">
							<tr><td><h2><strong>Ship To: UPORT - University of Portland</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='UPUGS'">
							<tr><td><h2><strong>Ship To: UPUGS - University of Puget Sound</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='UW'">
							<tr><td><h2><strong>Ship To: UW - University of Washington</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='PML' or $libraryname='Billings' or $libraryname='Missoula'">
							<tr><td><h2><strong>Ship To: WALLA - Walla Walla University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Portland' and contains(notification_data/incoming_request/partner_name, 'WALLA')">
							<tr><td><h2><strong>Ship To: WPU - Warner Pacific University / 
									<br/>(Participating) Walla Walla University - School of Nursing</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='WHITC'">
							<tr><td><h2><strong>Ship To: WHITC - Whitman College</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='WOU'">
							<tr><td><h2><strong>Ship To: WOU - Western Oregon University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='WPC'">
							<tr><td><h2><strong>Ship To: WPU - Warner Pacific University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="contains($libraryname, 'Pullman') or $libraryname='WSU Global Campus Delivery' or $libraryname='WSU Extension Office Delivery' or $libraryname='Owen Science and Engineering Library' or $libraryname='Kemble Stout Music Listening Library' or $libraryname='Holland and Terrell Libraries' or $libraryname='Everett Campus Delivery'">
							<tr><td><h2><strong>Ship To: WSU-PUL - Washington State University Pullman</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='WSU Health Sciences Library' or $libraryname='Nursing@Yakima Summit Location'">
							<tr><td><h2><strong>Ship To: WSU-SPOK - Washington State University Spokane</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Tri-Cities Library' or $libraryname='Tri-Cities Office Delivery'">
							<tr><td><h2><strong>Ship To: WSU-TRI - Washington State University TriCities</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='Vancouver Library' or $libraryname='Vancouver Office Delivery'">
							<tr><td><h2><strong>Ship To: WSU-VAN - Washington State University Vancouver</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='MOH' or $libraryname='WU LAW'">
							<tr><td><h2><strong>Ship To: WILL - Willamette University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="$libraryname='PNCA'">
							<tr><td><h2><strong>Ship To: PNCA - PNW College of Art/Willamette University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='WWO'">
							<tr><td><h2><strong>Ship To: WWORTH - Whitworth University</strong></h2></td></tr>
						</xsl:if>	
						<xsl:if test="notification_data/incoming_request/partner_name='WWU'">
							<tr><td><h2><strong>Ship To: WWU - Western Washington University</strong></h2></td></tr>
						</xsl:if>
						<tr><td><h2><strong>Pickup Location: <xsl:value-of select="$libraryname"/></strong></h2></td></tr>
					</xsl:if>
					<xsl:if test="$libraryname = ''" >
						<tr><td><h2><strong><xsl:value-of select="notification_data/partner_name"/></strong></h2></td></tr>
					</xsl:if>					
				</xsl:if>
			<xsl:if test="notification_data/incoming_request/note = ''" >
				<tr><td><h2><strong><xsl:value-of select="notification_data/partner_name"/></strong></h2></td></tr>
			</xsl:if>
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
						<td style="border: 1px solid black;"><strong>@@call_number@@: </strong><xsl:value-of select="notification_data/phys_item_display/call_number"/></td>
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
<!--
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
-->
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
				<tr>
					<td><strong>@@request_type@@: </strong><xsl:value-of select="notification_data/request_type"/></td>
				</tr>
-->
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
<!--
				<xsl:if test="notification_data/request/note != ''" >
					<tr>
						<td><strong>@@request_note@@:</strong> <xsl:value-of select="notification_data/request/note"/></td>
					</tr>
				</xsl:if>
-->
				<xsl:if test="notification_data/incoming_request/note != ''" >
					<tr>
						<td><strong>Request note: </strong> <xsl:value-of select="notification_data/incoming_request/note"/></td>
					</tr>
				</xsl:if>
				<xsl:if test="notification_data/request_type='Ship digitally'" >
					<tr>
						<td><strong>This material may be protected by copyright law (Title 17 U.S. Code)</strong></td>
					</tr>
				</xsl:if>
			</table>
			<table role='presentation'  cellspacing="0" cellpadding="5" border="0" width="45%">
				<xsl:if test="notification_data/request_type='Ship physically' and notification_data/incoming_request/rapido_request='true'" >
					<table cellspacing="0" cellpadding="0" border="1" width="45%">
						<tr>
							<td style="font-size:16px;width:500px">
								<font size="2">Return To: </font>
								<br /><br />
								<center><b><xsl:value-of select="notification_data/organization_unit/name" /></b></center>
								<center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address1" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address2" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address3" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address4" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address5" /></b></center>
							    <center><b>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
						<tr>
							<td style="font-size:16px;width:500px">
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
				<xsl:if test="((notification_data/incoming_request/rapido_request='false') and (notification_data/request_type='Ship physically') and (contains(notification_data/incoming_request/partner_code, '_RAPID')))" >
					<table cellspacing="0" cellpadding="0" border="1" width="45%">
						<tr>
							<td style="font-size:16px;width:500px">
							    <font size="2">Return To: </font>
							    <br /><br />
							    <center><b><xsl:value-of select="notification_data/organization_unit/name" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address1" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address2" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address3" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address4" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address5" /></b></center>
							    <center><b>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
						<tr>
							<td style="font-size:16px;width:500px">
							    <font size="2">Ship To:</font>
							    <br /><br />
							   <center><b><xsl:value-of select="notification_data/partner_name" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address1" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address2" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address3" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address4" /></b></center>
							   <center><b><xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/address5" /></b></center>
							   <xsl:if test="notification_data/partner_shipping_info_list/partner_shipping_info/city != ''" >
								   <center><b>
										 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city" />
										 <xsl:text>, </xsl:text>
										 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state" />
										 <xsl:text> </xsl:text>
										 <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code" />
									</b></center>
								</xsl:if>	 
							    <br />
							</td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="((notification_data/incoming_request/rapido_request='false') and (notification_data/request_type='Ship physically') and (contains(notification_data/incoming_request/partner_code, '01SUNY')))" >
					<table cellspacing="0" cellpadding="0" border="1" width="45%">
						<tr>
							<td style="font-size:16px;width:500px">
								<font size="2">Return To: </font>
								<br /><br />
								<center><b><xsl:value-of select="notification_data/organization_unit/name" /></b></center>
								<center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address1" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address2" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address3" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address4" /></b></center>
							    <center><b><xsl:value-of select="notification_data/phys_item_display/owning_library_details/address5" /></b></center>
							    <center><b>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/state" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/phys_item_display/owning_library_details/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
						<tr>
							<td style="font-size:16px;width:500px">
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
			</table>
		</div>
	</div>
	<!--<xsl:call-template name="lastFooter" />--> <!-- footer.xsl -->
</body>
</html>
</xsl:template>
</xsl:stylesheet>
