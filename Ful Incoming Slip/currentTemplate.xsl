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
        <tr>
<xsl:choose>
<xsl:when test="notification_data/partner_code='PULL_RAPID'">
                <td><h3><strong>Pickup at: PULLMAN RAPID ILL</strong></h3></td>
</xsl:when>
<xsl:when test="notification_data/partner_code='SPOK_RAPID'">
                <td><h3><strong>Pickup at: SPOKANE RAPID ILL</strong></h3></td>
</xsl:when>
<xsl:when test="notification_data/partner_code='TRIC_RAPID'">
                <td><h3><strong>Pickup at: TRICITIES RAPID ILL</strong></h3></td>
</xsl:when>
<xsl:when test="notification_data/partner_code='VANC_RAPID'">
                <td><h3><strong>Pickup at: VANCOUVER RAPID ILL</strong></h3></td>
</xsl:when>
<xsl:when test="(notification_data/items/physical_item_display_for_printing/library_code='hollterr') and (notification_data/incoming_request/format='PHYSICAL') and (notification_data/incoming_request/rapido_request='true') and (notification_data/partner_system_type!='ALMA')">
               <td><h3><strong>Pickup at: PULLMAN RAPIDO</strong></h3></td>
</xsl:when>
<xsl:when test="(notification_data/items/physical_item_display_for_printing/library_code='rpoint') and (notification_data/incoming_request/format='PHYSICAL') and (notification_data/incoming_request/rapido_request='true') and (notification_data/partner_system_type!='ALMA')">
               <td><h3><strong>Pickup at: SPOKANE RAPIDO</strong></h3></td>
</xsl:when>
<xsl:when test="(notification_data/items/physical_item_display_for_printing/library_code='tricities') and (notification_data/incoming_request/format='PHYSICAL') and (notification_data/incoming_request/rapido_request='true') and (notification_data/partner_system_type!='ALMA')">
               <td><h3><strong>Pickup at: TRI-CITIES RAPIDO</strong></h3></td>
</xsl:when>
<xsl:when test="(notification_data/items/physical_item_display_for_printing/library_code='vancouver') and (notification_data/incoming_request/format='PHYSICAL') and (notification_data/incoming_request/rapido_request='true') and (notification_data/partner_system_type!='ALMA')">
               <td><h3><strong>Pickup at: VANCOUVER RAPIDO</strong></h3></td>
</xsl:when>
<xsl:otherwise>
                <td><h3><strong>Pickup at: <xsl:value-of select="$libraryname"/></strong></h3></td>

</xsl:otherwise>
</xsl:choose>
        </tr>
   </xsl:if>
						<tr><xsl:choose>
			<xsl:when test="notification_data/partner_name='CC'">
				<tr>			
					<td><h3><strong>Partner: Clark College</strong></h3></td>
				</tr>
			</xsl:when>
			<xsl:when test="notification_data/partner_name='CCC'">
				<tr>			
					<td><h3><strong>Partner: Clackamas Community College</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='CHEMEK'">
				<tr>			
					<td><h3><strong>Partner: Chemeketa Community College</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='COCC'">
				<tr>			
					<td><h3><strong>Partner: Central Oregon Community College</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='CWU'">
				<tr>			
					<td><h3><strong>Partner: Central Washington University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='EOU'">
				<tr>			
					<td><h3><strong>Partner: Eastern Oregon University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='EVSC'">
				<tr>			
					<td><h3><strong>Partner: The Evergreen State College</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='EWU JFK'">
				<tr>			
					<td><h3><strong>Partner: Eastern Washington University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='EWU_RIVER'">
				<tr>			
					<td><h3><strong>Partner: Spokane Academic - EWU</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='GFOX_MLRC'">
				<tr>			
					<td><h3><strong>Partner: George Fox University - Newberg</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='GFOX_PCL'">
				<tr>			
					<td><h3><strong>Partner: George Fox University - Portland</strong></h3></td>
				</tr>
			</xsl:when>
			<xsl:when test="notification_data/partner_name='GONZ'">
				<tr>			
					<td><h3><strong>Partner: Gonzaga University</strong></h3></td>
				</tr>
			</xsl:when>
			
			<xsl:when test="notification_data/partner_name='LANECC'">
				<tr>			
					<td><h3><strong>Partner: Lane Community College</strong></h3></td>
				</tr>
			</xsl:when>		
			<xsl:when test="notification_data/partner_name='LCC'">
				<tr>			
					<td><h3><strong>Partner: Lewis &amp; Clark College</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='LINF_MAC'">
				<tr>			
					<td><h3><strong>Partner: Linfield University - McMinnville</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='LINF_PDX'">
				<tr>			
					<td><h3><strong>Partner: Linfield University - Portland</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='MHCC'">
				<tr>			
					<td><h3><strong>Partner: Mount Hood Community College</strong></h3></td>
				</tr>
			</xsl:when>		
			<xsl:when test="notification_data/partner_name='OHSU'">
				<tr>			
					<td><h3><strong>Partner: Oregon Health and Science University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='OIT_KFLS'">
				<tr>			
					<td><h3><strong>Partner: Oregon Tech - Klamath Falls</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='OIT_WILS'">
				<tr>			
					<td><h3><strong>Partner: Oregon Tech - Wilsonville</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='OSU'">
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
			<xsl:when test="notification_data/partner_name='PCC'">
				<tr>			
					<td><h3><strong>Partner: Portland Community College</strong></h3></td>
				</tr>
			</xsl:when>		
			<xsl:when test="notification_data/partner_name='PSU'">
				<tr>			
					<td><h3><strong>Partner: Portland State University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='PU_FG'">
				<tr>			
					<td><h3><strong>Partner: Pacific University - Forest Grove</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='PU_HPC'">
				<tr>			
					<td><h3><strong>Partner: Pacific University - Hillsboro</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='REED'">
				<tr>			
					<td><h3><strong>Partner: Reed College</strong></h3></td>
				</tr>
			</xsl:when>		
			<xsl:when test="notification_data/partner_name='SEAU_LEMIEUX'">
				<tr>			
					<td><h3><strong>Partner: Seattle University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='SEAU_LAW'">
				<tr>			
					<td><h3><strong>Partner: Seattle University - Law</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='SOU_SOU'">
				<tr>			
					<td><h3><strong>Partner: Southern Oregon University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='SOU_RCCM'">
				<tr>			
					<td><h3><strong>Partner: Rogue Community College - SOU</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='SPU'">
				<tr>			
					<td><h3><strong>Partner: Seattle Pacific University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='STMU'">
				<tr>			
					<td><h3><strong>Partner: Saint Martin's University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UID_MAIN'">
				<tr>			
					<td><h3><strong>Partner: University of Idaho</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UID_LAW'">
				<tr>			
					<td><h3><strong>Partner: University of Idaho - Law</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UO'">
				<tr>			
					<td><h3><strong>Partner: University of Oregon</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UPORT'">
				<tr>			
					<td><h3><strong>Partner: University of Portland</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UPUGS'">
				<tr>			
					<td><h3><strong>Partner: University of Puget Sound</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='UW'">
				<tr>			
					<td><h3><strong>Partner: University of Washington</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WALLA_PETERSON'">
				<tr>			
					<td><h3><strong>Partner: Walla Walla University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WALLA_PORTLAND'">
				<tr>			
					<td><h3><strong>Partner: Walla Walla University - Portland</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WHITC'">
				<tr>			
					<td><h3><strong>Partner: Whitman College</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WOU'">
				<tr>			
					<td><h3><strong>Partner: Western Oregon University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WPC'">
				<tr>			
					<td><h3><strong>Partner: Warner Pacific University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WSU_HOLLTERR'">
				<tr>			
					<td><h3><strong>Partner: Washington State University - Pullman</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WSU_RPOINT'">
				<tr>			
					<td><h3><strong>Partner: Washington State University - Spokane</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WSU_TRICITIES'">
				<tr>			
					<td><h3><strong>Partner: Washington State University - TriCities</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WSU_VANCOUVER'">
				<tr>			
					<td><h3><strong>Partner: Washington State University - Vancouver</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WU_MOH'">
				<tr>			
					<td><h3><strong>Partner: Willamette University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WU_LAW'">
				<tr>			
					<td><h3><strong>Partner: Willamette University - Law</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WU_PNCA'">
				<tr>			
					<td><h3><strong>Partner: Willamette University - PNCA</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WWO'">
				<tr>			
					<td><h3><strong>Partner: Whitworth University</strong></h3></td>
				</tr>
			</xsl:when>	
			<xsl:when test="notification_data/partner_name='WWU'">
				<tr>			
					<td><h3><strong>Partner: Western Washington University</strong></h3></td>
				</tr>
			</xsl:when>
			
			<xsl:otherwise>

                                 <tr><td><h3><strong>Partner: <xsl:value-of select="notification_data/partner_name" /></strong></h3></td></tr>
            </xsl:otherwise>
			</xsl:choose>
</tr>

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
<!--
                        <xsl:choose>
                           <xsl:when test="not(notification_data/pod_name='California State Network')">
                              <tr>
                                 <td>
                                    <center>
                                       <img src="ADD THE URL FOR YOUR LOGO HERE" alt="Lending Library Logo" />
                                    </center>
                                 </td>
                              </tr>
                           </xsl:when>
                           <xsl:otherwise>
                              <tr>
                                 <td>
                                    <center>
                                       <img src="https://ispiecsu.files.wordpress.com/2023/03/csu-plus-small.png" alt="CSU Plus Logo" />
                                    </center>
                                 </td>
                              </tr>
                           </xsl:otherwise>
                        </xsl:choose>
-->
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
                                 <td>
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
<!--
                           <xsl:if test="notification_data/incoming_request/rapido_allow_renew= 'false'">
                              <tr>
                                 <td style="font-size:20px">
                                    <font color="black">NO RENEWALS</font>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <b>Item Condition Report</b>
                              </td>
                           </tr>
                           <table cellspacing="0" cellpadding="5" border="1">
                              <tr>
                                 <td>
                                    <b>__Binding Issues</b>
                                 </td>
                                 <td>
                                    <b>__Writing/Highlighting</b>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <b>__Cover/Spine Issues</b>
                                 </td>
                                 <td>
                                    <b>__Liquid Damage/Stained</b>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <b>__Other (describe below)</b>
                                 </td>
                                 <td>
                                    <b>__Missing CD/DVD</b>
                                 </td>
                              </tr>
                           </table>
-->
                           <tr>
                              <td>
                                 <b>
                                    <xsl:text>_______________________________________________</xsl:text>
                                 </b>
                                 <br />
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
                                 <table cellspacing="0" cellpadding="0" border="1">
                                    <tr>
                                       <td style="font-size:16px;width:350px">
                                          <font size="2">Return To:&#160;</font>
                                          <br />
                                          <br />
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address1" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address2" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address3" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address4" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address5" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/city" />
                                                <xsl:text>,&#160;</xsl:text>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/state" />
                                                <xsl:text />
                                                <xsl:text>&#160;</xsl:text>
                                                <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/postal_code" />
                                             </b>
                                          </center>
                                          <br />
                                       </td>
                                    </tr>
								<xsl:if test="notification_data/borrowing_library_address !=''">
                                    <tr>
                                       <td style="font-size:18px;width:350px">
                                          <font size="2">Ship To:&#160;</font>
                                          <br />
                                          <br />
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line1" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line2" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line3" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line4" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line5" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/city" />
                                                <xsl:text>,&#160;</xsl:text>
                                                <xsl:value-of select="notification_data/borrowing_library_address/state_province" />
                                                <xsl:text />
                                                <xsl:text>&#160;</xsl:text>
                                                <xsl:value-of select="notification_data/borrowing_library_address/postal_code" />
                                             </b>
                                          </center>
                                          <br />
                                       </td>
                                    </tr>
								</xsl:if>
								<xsl:if test="notification_data/borrowing_library_address =''">
                                    <tr>
                                       <td style="font-size:18px;width:350px">
                                          <font size="2">Ship To:&#160;</font>
                                          <br />
                                          <br />
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/incoming_request/contact_address" />
                                             </b>
                                          </center>
										  <br/>
<!--
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line2" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line3" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line4" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/line5" />
                                             </b>
                                          </center>
                                          <center>
                                             <b>
                                                <xsl:value-of select="notification_data/borrowing_library_address/city" />
                                                <xsl:text>,&#160;</xsl:text>
                                                <xsl:value-of select="notification_data/borrowing_library_address/state_province" />
                                                <xsl:text />
                                                <xsl:text>&#160;</xsl:text>
                                                <xsl:value-of select="notification_data/borrowing_library_address/postal_code" />
                                             </b>
                                          </center>
                                          <br />
-->
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
                                 <!-- Borrowing Libraries Start -->
                                 <!-- Bakersfield -->
                                 <xsl:if test="(notification_data/partner_name='CSU Bakersfield - CSUB Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/bakersfield.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Channel Islands -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Channel Islands - John Spoor Broome Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/channel-islands.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Chico -->
                                 <xsl:if test="(notification_data/partner_name='CSU, Chico - Meriam Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/chico-2.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Dominguez Hills -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Dominguez Hills - University Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/dominguez-hills.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- East Bay -->
                                 <xsl:if test="(notification_data/partner_name='California State University, East Bay - Hayward')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/east-bay.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Fresno -->
                                 <xsl:if test="(notification_data/partner_name='Fresno State - FRESNO STATE MAIN')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/fresno-1.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Fullerton -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Fullerton - Pollak Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/fullerton-23.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Humboldt -->
                                 <xsl:if test="(notification_data/partner_name='Cal Poly Humboldt - Humboldt State University Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/humboldt.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Long Beach -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Long Beach - University Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/long-beach.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Los Angeles -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Los Angeles - John F Kennedy Memorial Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/los-angeles.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Maritime -->
                                 <xsl:if test="(notification_data/partner_name='Cal Maritime - California Maritime Academy Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/maritime.jpg" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Monterey Bay -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Monterey Bay - CSU Monterey Bay Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/monterey-bay.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Moss Landing -->
                                 <xsl:if test="(notification_data/partner_name='California State University Moss Landing Marine Laboratories - MLML/MBARI Research Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/moss-landing.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Northridge -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Northridge - Interlibrary Loan')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/northridge-2.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Pomona -->
                                 <xsl:if test="(notification_data/partner_name='California State Polytechnic University Pomona - Cal Poly Pomona University Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/pomona.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Sacramento -->
                                 <xsl:if test="(notification_data/partner_name='Sacramento State - University Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/sacramento.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- San Diego -->
                                 <xsl:if test="(notification_data/partner_name='San Diego State University Library - SDSU Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/san-diego.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- San Francisco -->
                                 <xsl:if test="(notification_data/partner_name='San Francisco State University - Main Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/san-francisco.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- San Jose -->
                                 <xsl:if test="(notification_data/partner_name='San Jose State University - SJSU Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/san-jose-2.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- San Luis Obispo -->
                                 <xsl:if test="(notification_data/partner_name='Cal Poly University San Luis Obispo - Robert E. Kennedy Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/san-luis-obispo-2.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- San Marcos -->
                                 <xsl:if test="(notification_data/partner_name='California State University San Marcos - Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/san-marcos.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!--Sonoma -->
                                 <xsl:if test="(notification_data/partner_name='Sonoma State University - University Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/sonoma-1.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
                                 <!-- Stanislaus -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Stanislaus - CSU Stanislaus Library')">
                                    <table width="45%">
                                       <tr>
                                          <td>
                                             <center>
                                                <b>Delivered To</b>
                                             </center>
                                             <center>
                                                <img src="https://ispiecsu.files.wordpress.com/2023/03/stanislaus-1.png" />
                                             </center>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:if>
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
                                 <xsl:if test="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number">
                                    <tr>
                                       <td>
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
                                    <td>
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
                                    <font size="1">The copyright law of the United States (Title 17, United States Code), governs the making of photocopies or other reproductions of copyrighted material. Under certain conditions specified in the law, libraries and archives are authorized to furnish a photocopy or other reproduction. One of these specified conditions is that the photocopy or reproduction is not to be "used for any purpose other than private study, scholarship, or research." If a user makes a request for, or later uses, a photocopy or reproduction for purposes in excess of "fair use," that user may be liable for copyright infringement. This institution reserves the right to refuse to accept a copying order, if, in its judgment, fulfillment of the order would involve violation of copyright law.</font>
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
