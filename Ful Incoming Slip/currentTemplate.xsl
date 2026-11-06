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
            <xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
            <xsl:with-param name="label" select="'Bibliographic Information:'"/>
         </xsl:call-template>
</xsl:template>

<xsl:template match="/">
<!--Insert Between <xsl:template match="/"> match and <html>-->

      <xsl:choose>
         <xsl:when test="notification_data/group_qualifier=''">
		 
<!--Insert Between <xsl:template match="/"> match and <html>-->
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
					 <table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>
								<b>@@supplied_to@@: </b>
								<xsl:value-of select="notification_data/partner_name"/>
							</td>
						</tr>
						<tr>
			                <td>
			                  <b>@@borrower_reference@@: </b>
			                   <xsl:call-template name="id-info-hdr"/>
			                </td>
			              </tr>
			          <tr>
							  <td><b>@@my_id@@: </b><img src="externalId.png" alt="externalId" /></td>
				      </tr>
						<tr>
							<td>
								<b>@@format@@: </b>
								<xsl:value-of select="notification_data/incoming_request/format"/>
							</td>
						</tr>

						<xsl:if  test="notification_data/incoming_request/needed_by_dummy/full_date" >
							<tr>
								<td>
									<b>@@date_needed_by@@: </b>
									<xsl:value-of select="notification_data/incoming_request/needed_by"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/note" >
							<tr>
								<td>
									<b>@@request_note@@: </b>
									<xsl:value-of select="notification_data/incoming_request/note"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/requester_email" >
							<tr>
								<td>
									<b>@@requester_email@@: </b>
									<xsl:value-of select="notification_data/incoming_request/requester_email"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/assignee != ''" >
							<tr>
								<td>
									<b>@@assignee@@: </b>
									<xsl:value-of select="notification_data/assignee"/>
								</td>
							</tr>
						</xsl:if>

								<xsl:if test="notification_data/level_of_service !=''">
									<tr>
										<td>
											<b>@@level_of_service@@: </b>
											<xsl:value-of select="notification_data/level_of_service"/>
										</td>

									</tr>
								</xsl:if>

						<xsl:for-each select="notification_data/items/physical_item_display_for_printing">
							<br></br>

							<tr>
							  <td><b>@@item_barcode@@: </b><img src="cid:{concat(concat('Barcode',position()),'.png')}" alt="{concat('Barcode',position())}" /></td>
							</tr>

							<tr>
								<td><xsl:value-of select="title"/></td>
							</tr>

							<tr>
								<td>
									<b>@@library@@: </b>
									<xsl:value-of select="library_name"/>
								</td>
							</tr>

							<tr>
								<td><b>@@location@@: </b><xsl:value-of select="location_name"/></td>
							</tr>

							<xsl:if  test="call_number" >
								<tr>
									<td><b>@@call_number@@: </b><xsl:value-of select="call_number"/></td>
								</tr>
							</xsl:if>

							<xsl:if  test="shelving_location/string" >
								<tr>
									<td><b>@@shelving_location_for_item@@: </b>
									 <xsl:for-each select="shelving_location/string">
										<xsl:value-of select="."/>
									 &#160;
									 </xsl:for-each>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
				</div>
			</div>
	<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
</body>
</html>
<!--Insert Between </html> and </xsl:template>-->		
 
         </xsl:when>
         <xsl:otherwise>
            <html>
               <xsl:if test="notification_data/languages/string">
                  <xsl:attribute name="lang">
                     <xsl:value-of select="notification_data/languages/string" />
                  </xsl:attribute>
               </xsl:if>
               <head>
                  <title>
                     <xsl:value-of select="notification_data/general_data/subject" />
                  </title>
               </head>
               <div class="messageArea">
                  <div class="messageBody">
                     <table width="45%">

   <xsl:if test="notification_data/partner_name != ''" >
          <xsl:variable name="noteline" select="notification_data/incoming_request/note"/>
          <xsl:variable name="notepart1" select="substring-after($noteline, '||')"/>
          <xsl:variable name="fullname" select="substring-before($notepart1, '||')"/>
          <xsl:variable name="notepart2" select="substring-after($notepart1, '||')"/>
         <xsl:variable name="libraryname" select="substring-after($notepart2, '||')"/>
         <tr>
                <td><h3><strong><xsl:value-of select="$fullname"/></strong></h3></td>
        </tr>
      			   <xsl:if test="$libraryname != ''" >
		<tr>
                   <td><h2><strong>Pickup Location: <xsl:value-of select="$libraryname"/></strong></h2></td>
        </tr>
   </xsl:if>
			<xsl:choose>
			<xsl:when test="notification_data/partner_name='CC'">
				<tr><td><h2><strong>Ship To: CLARK - Clark College</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="notification_data/partner_name='CCC'">
				<tr><td><h2><strong>Ship To: CLCKM - Clackamas Comlmunity College</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="contains(notification_data/partner_name, 'Chemeketa') or notification_data/partner_name='CHEMEK'">
				<tr><td><h2><strong>Ship To: CHEMEK - Chemeketa Community College</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="notification_data/partner_name='COCC'">
				<tr><td><h2><strong>Ship To: COCC - Central Oregon Community College</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="contains(notification_data/partner_name, 'Central Washington') or notification_data/partner_name='CWU'">
				<tr><td><h2><strong>Ship To: CWU - Central Washington University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='EOU'">
				<tr><td><h2><strong>Ship To: EOU - Eastern Oregon University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="contains(notification_data/partner_name, 'Evergreen State') or notification_data/partner_name='EVSC'">
				<tr><td><h2><strong>Ship To: TESC - The Evergreen State College</strong></h2></td></tr>
			</xsl:when>				
			<xsl:when test="notification_data/partner_name='EWU JFK'">
				<tr><td><h2><strong>Ship To: EWU - Eastern Washington University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='GFOX_MLRC'">
				<tr><td><h2><strong>Ship To: GFOX - George Fox University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='GONZ'">
				<tr><td><h2><strong>Ship To: GONZ - Gonzaga University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='LANECC'">
				<tr><td><h2><strong>Ship To: LANE - Lane Community College</strong></h2></td></tr>
			</xsl:when>		
			<xsl:when test="notification_data/partner_name='LCC'">
				<tr><td><h2><strong>Ship To: LEWIS - Lewis &amp; Clark College</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='LCC_Law'">
				<tr><td><h2><strong>Ship To: LEWIS - Lewis &amp; Clark College</strong></h2></td></tr>
				<tr><td><h2><strong>Pickup Location: Boley Law Library</strong></h2></td></tr>				
			</xsl:when>
			<xsl:when test="$libraryname='McMinnville' or $libraryname='OCE via Mail'">
				<tr><td><h2><strong>Ship To: LINF-MAC - Linfield University McMinnville</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Portland' and contains(notification_data/partner_name, 'LINF')">
				<tr><td><h2><strong>Ship To: LINF-PDX - Linfield University Portland</strong></h2></td></tr>
			</xsl:when>		
			<xsl:when test="notification_data/partner_name='MHCC'">
				<tr><td><h2><strong>Ship To: MHCC - Mt. Hood Community College</strong></h2></td></tr>
			</xsl:when>		
			<xsl:when test="contains(notification_data/partner_name, 'Oregon Health') or notification_data/partner_name='OHSU'">
				<tr><td><h2><strong>Ship To: OHSU - Oregon Health &amp; Science University</strong></h2></td></tr>
			</xsl:when>				
			<xsl:when test="$libraryname='Klamath Falls Library'">
				<tr><td><h2><strong>Ship To: OIT-KFLS - Oregon Tech Klamath Falls</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Portland-Metro Library'">
				<tr><td><h2><strong>Ship To: OIT-PM - Oregon Tech Portland Metro</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Personal Delivery'and contains(notification_data/partner_name, 'OSU')">
				<tr><td><h2><strong>Ship To: OSU-COR - Oregon State University Corvallis</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="$libraryname=' Valley Library-Corvallis' or notification_data/partner_name='OSU'">
				<tr><td><h2><strong>Ship To: OSU-COR - Oregon State University Corvallis</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='OSU-Cascades Library-Bend' or notification_data/partner_name='OSU_BEND'">
				<tr><td><h2><strong>Ship To: OSU-BEND - Oregon State University Cascades</strong></h2></td></tr>
			</xsl:when>	
            <xsl:when test="$libraryname='Guin Library-Newport' or notification_data/partner_name='OSU_NEWPORT'">
                <tr><td><h2><strong>Ship To: OSU-NEWP - Oregon State University Newport</strong></h2></td></tr>
            </xsl:when>
			<xsl:when test="contains(notification_data/partner_name, 'Rock Creek') or notification_data/partner_name='PCC'">
				<tr><td><h2><strong>Ship To: PCC - Portland Community College</strong></h2></td></tr>
			</xsl:when>				
			<xsl:when test="contains(notification_data/partner_name, 'PSU')">
				<tr><td><h2><strong>Ship To: PSU - Portland State University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Eugene' or $libraryname='Forest Grove' or $libraryname='Woodburn'">
				<tr><td><h2><strong>Ship To: PU-FG - Pacific University Forest Grove</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Hillsboro'">
				<tr><td><h2><strong>Ship To: PU-HILS - Pacific University Hillsboro</strong></h2></td></tr>
			</xsl:when>		
			<xsl:when test="contains (notification_data/partner_name, 'Reed') or notification_data/partner_name='REED'">
				<tr><td><h2><strong>Ship To: REED - Reed College</strong></h2></td></tr>
			</xsl:when>		
			<xsl:when test="notification_data/partner_name='SEAU_LEMIEUX' or notification_data/partner_name='SEAU_LAW'">
				<tr><td><h2><strong>Ship To: SEAU - Seattle University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Hannon Library' or contains(notification_data/partner_name, 'Southern Oregon')">
				<tr><td><h2><strong>Ship To: SOU - Southern Oregon University</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="$libraryname='Medford - RCC'">
				<tr><td><h2><strong>Ship To: RCC - Rogue Community College/SOU</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='SPU'">
				<tr><td><h2><strong>Ship To: SPU - Seattle Pacific University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='STMU'">
				<tr><td><h2><strong>Ship To: STMU - Saint Martin's University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="contains(notification_data/partner_name, 'UI ') or contains(notification_data/partner_name, 'UID')">
				<tr><td><h2><strong>Ship To: UI - University of Idaho</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="notification_data/partner_name='UO' and contains($libraryname, 'Delivery')">
				<tr><td><h2><strong>Ship To: UO-EUG - University of Oregon Eugene</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Design Library' or $libraryname='John E. Jaqua Law Library' or $libraryname='Knight Library' or $libraryname='Mathematics Library' or $libraryname='Price Science Commons and Research Library'">
				<tr><td><h2><strong>Ship To: UO-EUG - University of Oregon Eugene</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="contains(notification_data/partner_name, 'Knight Library')">
				<tr><td><h2><strong>Ship To: UO-EUG - University of Oregon Eugene</strong></h2></td></tr>
			</xsl:when>				
			<xsl:when test="$libraryname='UO Portland Library'">
				<tr><td><h2><strong>Ship To: UO-PDX - University of Oregon Portland</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="notification_data/partner_name='UPORT'">
				<tr><td><h2><strong>Ship To: UPORT - University of Portland</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UPUGS'">
				<tr><td><h2><strong>Ship To: UPUGS - University of Puget Sound</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UW'">
				<tr><td><h2><strong>Ship To: UW - University of Washington</strong></h2></td></tr>
			</xsl:when>		
			<xsl:when test="$libraryname='PML' or $libraryname='Billings' or $libraryname='Missoula'">
				<tr><td><h2><strong>Ship To: WALLA - Walla Walla University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='Portland' and contains(notification_data/partner_name, 'WALLA')">
				<tr><td><h2><strong>Ship To: WPU - Warner Pacific University / 
						<br/>(Participating) Walla Walla University - School of Nursing</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WHITC'">
				<tr><td><h2><strong>Ship To: WHITC - Whitman College</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WOU' or contains(notification_data/partner_name, 'Western Oregon')">
				<tr><td><h2><strong>Ship To: WOU - Western Oregon University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WPC'">
				<tr><td><h2><strong>Ship To: WPU - Warner Pacific University</strong></h2></td></tr>
			</xsl:when>		
			<xsl:when test="contains($libraryname, 'Pullman') or $libraryname='WSU Global Campus Delivery' or $libraryname='WSU Extension Office Delivery' or $libraryname='Owen Science and Engineering Library' or $libraryname='Kemble Stout Music Listening Library' or $libraryname='Holland and Terrell Libraries' or $libraryname='Everett Campus Delivery'">
				<tr><td><h2><strong>Ship To: WSU-PUL - Washington State University Pullman</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="contains(notification_data/partner_name, 'Holland')">
				<tr><td><h2><strong>Ship To: WSU-PUL - Washington State University Pullman</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='WSU Health Sciences Library' or $libraryname='Nursing@Yakima Summit Location'">
				<tr><td><h2><strong>Ship To: WSU-SPOK - Washington State University Spokane</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="contains(notification_data/partner_name, 'WSU Health')">
				<tr><td><h2><strong>Ship To: WSU-SPOK - Washington State University Spokane</strong></h2></td></tr>
			</xsl:when>			
			<xsl:when test="$libraryname='Tri-Cities Library' or $libraryname='Tri-Cities Office Delivery'">
				<tr><td><h2><strong>Ship To: WSU-TRI - Washington State University TriCities</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="contains(notification_data/partner_name, 'Tri-Cities')">
				<tr><td><h2><strong>Ship To: WSU-TRI - Washington State University TriCities</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="$libraryname='Vancouver Library' or $libraryname='Vancouver Office Delivery'">
				<tr><td><h2><strong>Ship To: WSU-VAN - Washington State University Vancouver</strong></h2></td></tr>
			</xsl:when>
			<xsl:when test="contains(notification_data/partner_name, 'Vancouver')">
				<tr><td><h2><strong>Ship To: WSU-VAN - Washington State University Vancouver</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='MOH' or $libraryname='WU LAW'">
				<tr><td><h2><strong>Ship To: WILL - Willamette University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="$libraryname='PNCA'">
				<tr><td><h2><strong>Ship To: PNCA - PNW College of Art/Willamette University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WW'">
				<tr><td><h2><strong>Ship To: WWORTH - Whitworth University</strong></h2></td></tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WWU'">
				<tr><td><h2><strong>Ship To: WWU - Western Washington University</strong></h2></td></tr>
			</xsl:when>	
<!--This says if none of the above tests are triggered, print the partner code from the XML in the Ship To: line -->
			<xsl:otherwise>
				<tr><td><h2><strong>Ship To: <xsl:value-of select="notification_data/partner_name"/></strong></h2></td></tr>
			</xsl:otherwise>
		</xsl:choose>
   </xsl:if>

                        <xsl:if test="notification_data/incoming_request/format='PHYSICAL' ">
							<xsl:if test="notification_data/pod_name !=''">
                           <tr>
                              <td>
                                 <b>Pod:&#160;</b>
                                 <xsl:value-of select="notification_data/pod_name" />
                              </td>
                           </tr>
						   </xsl:if>
                        </xsl:if>
                     </table>
                     <tr>
                        <td />
                     </tr>
                     <table width="45%">
					 <tr><td><xsl:call-template name="head" /> <!-- header.xsl --></td></tr>
                     </table>
                     <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                        <!--Book-->
                        <xsl:if test="notification_data/incoming_request/format='PHYSICAL' ">
                           <table width="45%">
                              <tr>
                                 <td>
                                    <b>Library:&#160;</b>
                                    <font color="black">
                                       <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/library_name" />
                                    </font>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <b>@@location@@:&#160;</b>
                                    <font color="black">
                                       <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name" />
                                    </font>
                                 </td>
                              </tr>
                              <tr>
                                 <td style="border: 1px solid black;">
                                    <b>@@call_number@@:&#160;</b>
                                    <font color="black">
                                       <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number" />
                                    </font>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <b>Barcode:&#160;</b>
                                    <font color="black">
                                       <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/barcode" />
                                    </font>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <b>Title:&#160;</b>
                                    <xsl:value-of select="substring(notification_data/metadata/title, 1, 100)" />
                                 </td>
                              </tr>
                              <xsl:if test="not(notification_data/metadata/author='')">
                                 <tr>
                                    <td>
                                       <b>Author:&#160;</b>
                                       <xsl:value-of select="substring(notification_data/metadata/author, 1, 100)" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/metadata/volume='')">
                                 <tr>
                                    <td>
                                       <b>@@volume@@:&#160;</b>
                                       <xsl:value-of select="notification_data/metadata/volume" />
                                    </td>
                                 </tr>
                              </xsl:if>
                           <xsl:if test="notification_data/incoming_request/note != ''">
                              <tr>
                                 <td>
									<b>Note: </b>
                                    <font color="black">
										<xsl:value-of select="notification_data/incoming_request/note" />
									</font>
                                 </td>
                              </tr>
                           </xsl:if>
                           </table>
                           <br />
                           <xsl:if test="notification_data/group_qualifier != ''">
                              <tr>
                                 <td>
                                    <img src="cid:group_qualifier.png" alt="group_qualifier" />
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <br />
                              </td>
                           </tr>
                           <xsl:choose>
                              <xsl:when test="(notification_data/partner_system_type!='ALMA')">
                                 <table width="45%">
                                    <tr><td><b>@@Title@@:&#160;</b>
                                    <xsl:value-of select="substring(notification_data/metadata/title, 1, 100)" /></td></tr>
                                    <br />
                                    <tr><td><b>@@external_identifier@@:&#160;</b>
                                    <xsl:value-of select="notification_data/group_qualifier" /></td></tr>
                                 </table>
                                 <table cellspacing="0" cellpadding="0" border="1" width="45%">
									<tr>
										<td style="font-size:16px;width:500px">
											<font size="2">Return To: </font>
											<br /><br />
											<center><b><xsl:value-of select="notification_data/organization_unit/name" /></b></center>
											<center><b><xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address1" /></b></center>
											<center><b><xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address2" /></b></center>
											<center><b><xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address3" /></b></center>
											<center><b><xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address4" /></b></center>
											<center><b><xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address5" /></b></center>
											<center><b>
												 <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/city" />
												 <xsl:text>, </xsl:text>
												 <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/state" />
												 <xsl:text> </xsl:text>
												 <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/postal_code" /></b></center>
										   <br />
										</td>
									</tr>
								<xsl:if test="notification_data/borrowing_library_address !=''">
						<tr>
							<td style="font-size:16px;width:500px">
							   <font size="2">Ship To:</font>
							   <br /><br />
							   <center><b><xsl:value-of select="notification_data/partner_name" /></b></center>
							   <center><b><xsl:value-of select="notification_data/borrowing_library_address/line1" /></b></center>
							   <center><b><xsl:value-of select="notification_data/borrowing_library_address/line2" /></b></center>
							   <center><b><xsl:value-of select="notification_data/borrowing_library_address/line3" /></b></center>
							   <center><b><xsl:value-of select="notification_data/borrowing_library_address/line4" /></b></center>
							   <center><b><xsl:value-of select="notification_data/borrowing_library_address/line5" /></b></center>
							   <center><b>
									 <xsl:value-of select="notification_data/borrowing_library_address/city" />
									 <xsl:text>, </xsl:text>
									 <xsl:value-of select="notification_data/borrowing_library_address/state_province" />
									 <xsl:text> </xsl:text>
									 <xsl:value-of select="notification_data/borrowing_library_address/postal_code" /></b></center>
							   <br />
							</td>
						</tr>
								</xsl:if>
								<xsl:if test="notification_data/borrowing_library_address =''">
						<tr>
							<td style="font-size:16px;width:500px">
							    <font size="2">Ship To:</font>
							    <br /><br />
<!--
Examples of contact_address strings

Interlibrary Loan &amp; Library Express, Zimmerman Library, University of New Mexico, 1900 Roma Ave NE, Albuquerque, NM 87131-0001 , (5 internal commas)
UT Libraries - Interlibrary Services, 101 E 21st STOP S5463, First Floor Dock, Austin, TX 78712-1492 (4 internal commas)
Blake's office, 123 Library Lane, Pullman, WA 99163 (3 internal commas)
Blake's office, Pullman, WA 99163 (2 internal commas)
-->
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
							    <center><b><xsl:value-of select="notification_data/partner_name" /></b></center>
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
							    <br />
							</td>
						</tr>
								</xsl:if>
                                 </table>
                              </xsl:when>
                              <xsl:otherwise>
                                 <!-- Home Library -->
                                 <xsl:if test="(notification_data/organization_unit/description='ADD YOUR DESCRIPTION HERE')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Supplied By</b>
                                             </center>
                                             <center>
                                                <img src="ADD THE URL FOR YOUR LOGO HERE" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>

                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:if>
                        <!--Article-->
                        <xsl:if test="notification_data/incoming_request/format='DIGITAL' ">
                           <xsl:if test="notification_data/metadata/material_type='Article' ">
                              <xsl:if test="notification_data/partner_name">
                                 <tr>
                                    <td>
                                       <img src="cid:externalId.png" alt="externalId" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <table width="45%">
                                 <tr>
                                    <td />
                                 </tr>
                                 <xsl:if test="not(notification_data/metadata/journal_title='')">
                                    <tr>
                                       <td>
                                          <b>@@journal_title@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="substring(notification_data/metadata/journal_title, 1, 100)" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/normalized_title='')">
                                    <tr>
                                       <td>
                                          <b>Article Title:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="substring(notification_data/metadata/normalized_title, 1, 100)" />
                                       </td>
                                    </tr>
                                 </xsl:if>
<!--Workaround to alert staff when non-matched holdings result in Alma selecting a Related Record for an Article request-->
<!--Define variables-->
								<xsl:variable name="material-type" select="notification_data/items/physical_item_display_for_printing/material_type" />
<!--No need to display Paging Title unless it is a book-->
								<xsl:if test="not(notification_data/items/physical_item_display_for_printing/title='') and ($material-type = 'BOOK')">
                                    <tr>
                                       <td>
                                          <b>Paging Title:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="substring(notification_data/items/physical_item_display_for_printing/title, 1, 100)" />
                                       </td>
                                    </tr>
                                 </xsl:if>
<!--Define variables-->
								<xsl:variable name="metadata-title" select="notification_data/metadata/title" />
								<xsl:variable name="paging-title" select="notification_data/items/physical_item_display_for_printing/title" />
<!--Test whether there is a mismatch between the requested title and the supplied title, but only if the supplied material type is BOOK-->
								<xsl:if test="not($metadata-title = $paging-title) and ($material-type = 'BOOK')">
<!--If there is a mismatch, print an alert for staff-->
									<tr><td><br/></td></tr>
									<tr><td style="border: 1px solid black;">
										<b>Alert! the Article Title and the Paging Title do not match!</b>
									</td></tr>
									<tr><td><br/></td></tr>
								</xsl:if>
<!--End workaround-->
                                 <tr>
                                    <td>
                                       <b>Author:&#160;</b>
                                       <xsl:value-of select="substring(notification_data/metadata/author, 1, 100)" />
                                    </td>
                                 </tr>
                                 <xsl:if test="not(notification_data/metadata/publication_date='')">
                                    <tr>
                                       <td>
                                          <b>@@year@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/publication_date" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/volume='')">
                                    <tr>
                                       <td>
                                          <b>@@volume@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/volume" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/issue='')">
                                    <tr>
                                       <td>
                                          <b>@@issue@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/issue" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/pages='')">
                                    <tr>
                                       <td>
                                          <b>@@pages@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/pages" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/issn='')">
                                    <tr>
                                       <td>
                                          <b>ISSN:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/issn" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/oclc_number='')">
                                    <tr>
                                       <td>
                                          <b>OCLC#:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/oclc_number" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
<tr><td>
	<xsl:variable name="unique-holdings" select="//summary_holding[not(.=preceding::summary_holding)]"/>
	<xsl:variable name="unique-statement" select="//summary_holding[not(.=preceding::summary_holding)] | //call_number[not(.=preceding::call_number)] | //location_name[not(.=preceding::location_name)]" />   
	<xsl:if test="count($unique-holdings[2]) = 1">
		<b>Alert! Check for correct location and call number:</b><br/>
		<xsl:for-each select="$unique-statement">
			<xsl:value-of select="." /><br/>
		</xsl:for-each><br/>
	</xsl:if>
</td></tr>
                                 <xsl:if test="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number">
                                    <tr>
                                       <td style="border: 1px solid black;">
                                          <b>@@call_number@@:&#160;</b>
                                          <xsl:text />
                                          <font color="black">
                                             <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number" />
                                          </font>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name">
                                    <tr>
                                       <td>
                                          <b>@@location@@:&#160;</b>
                                          <xsl:text />
                                          <font color="black">
                                             <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name" />
                                          </font>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="(notification_data/items='')">
                                    <tr>
                                       <td style="font-size:20px">
                                          <font color="black">
                                             <xsl:text>ELECTRONIC</xsl:text>
                                          </font>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
                              </table>
                              <tr>
                                 <td>
                                    <img src="cid:resource_sharing_request_id.png" />
                                 </td>
                              </tr>
                           </xsl:if>
                           <!--Book Chapter-->
                           <xsl:if test="notification_data/metadata/material_type='Book' ">
                              <xsl:if test="notification_data/partner_name">
                                 <tr>
                                    <td>
                                       <img src="cid:externalId.png" alt="externalId" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <table width="45%">
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <b>Library:&#160;</b>
                                       <xsl:text />
                                       <font color="black">
                                          <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/library_name" />
                                       </font>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <b>@@location@@:&#160;</b>
                                       <xsl:text />
                                       <font color="black">
                                          <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name" />
                                       </font>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="border: 1px solid black;">
                                       <b>@@call_number@@:&#160;</b>
                                       <xsl:text />
                                       <font color="black">
                                          <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number" />
                                       </font>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <b>Barcode:&#160;</b>
                                       <xsl:text />
                                       <font color="black">
                                          <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/barcode" />
                                       </font>
                                    </td>
                                 </tr>
                                 <xsl:if test="not(notification_data/metadata/title='')">
                                    <tr>
                                       <td>
                                          <b>Book Title:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="substring(notification_data/metadata/title, 1, 100)" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/chapter='')">
                                    <tr>
                                       <td>
                                          <b>@@chapter_title@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="substring(notification_data/metadata/chapter, 1, 100)" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/chapter_title='')">
                                    <tr>
                                       <td>
                                          <b>@@chapter_title@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="substring(notification_data/metadata/chapter_title, 1, 100)" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/chapter_author='')">
                                    <tr>
                                       <td>
                                          <b>@@chapter_author@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="substring(notification_data/metadata/chapter_author, 1, 100)" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td />
                                 </tr>
                                 <xsl:if test="not(notification_data/metadata/volume='')">
                                    <tr>
                                       <td>
                                          <b>@@volume@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/volume" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/items/physical_item_display_for_printing/publication_date='')">
                                    <tr>
                                       <td>
                                          <b>@@year@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/items/physical_item_display_for_printing/publication_date" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/pages='')">
                                    <tr>
                                       <td>
                                          <b>@@pages@@:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/pages" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/isbn='')">
                                    <tr>
                                       <td>
                                          <b>ISBN:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/isbn" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="not(notification_data/metadata/oclc_number='')">
                                    <tr>
                                       <td>
                                          <b>OCLC#:&#160;</b>
                                          <xsl:text />
                                          <xsl:value-of select="notification_data/metadata/oclc_number" />
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
                                 <xsl:if test="(notification_data/incoming_request/format='DIGITAL')">
<tr><td>
<!--    <xsl:variable name="unique-library" select="//physical_item_display_for_printing[not(.=preceding::physical_item_display_for_printing)]"/> -->
	<xsl:variable name="unique-libcode" select="//physical_item_display_for_printing/available_items/available_item/library_code[not(.=preceding::physical_item_display_for_printing/available_items/available_item/library_code)]" />
	<xsl:variable name="unique-libname" select="//physical_item_display_for_printing/available_items/available_item/library_name[not(.=preceding::physical_item_display_for_printing/available_items/available_item/library_name)]" />
        <xsl:if test="count($unique-libcode[2]) = 1">
<!--	    <xsl:if test="($unique-libcode[1] = 'hollterr') and (($unique-libcode[2] = 'rpoint') or ($unique-libcode[2] = 'tricities') or ($unique-libcode[2] = 'vancouver'))"> -->
<!--	        <xsl:if test="($unique-libcode[1] = 'hollterr') and not($unique-libcode[2] = 'hollterr')"> -->
		        <b>Alert! Check to see if this request has already been filled by:</b><br/>
		        <xsl:for-each select="$unique-libname">
			        <xsl:value-of select="." /><br/>
		        </xsl:for-each><br/>
<!--	        </xsl:if> -->
	    </xsl:if>
</td></tr>
                                    <tr>
                                       <td style="font-size:20px">
                                          <font color="black">
                                             <xsl:text>ELECTRONIC</xsl:text>
                                          </font>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
<!--
                                 <tr>
                                    <td>
                                       <b>External ID:&#160;</b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/group_qualifier" />
                                    </td>
                                 </tr>
-->
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
                              </table>
                              <tr>
                                 <td>
                                    <img src="cid:resource_sharing_request_id.png" />
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <br />
                              </td>
                           </tr>
                           <table width="45%">
                              <tr>
                                 <td>
                                    <font size="1">This material may be protected by copyright law (Title 17 U.S. Code)</font>
                                 </td>
                              </tr>
                           </table>
                        </xsl:if>
                     </table>
                  </div>
               </div>
            </html>
         </xsl:otherwise>
      </xsl:choose>
	  
<!--Original code till end-->

	</xsl:template>
</xsl:stylesheet>
