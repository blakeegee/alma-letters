<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
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

				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>

				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>
								<td>
									<strong>@@returned@@</strong>
								</td>
							</tr>
							<tr>
								<td>
								<br/>
									<strong> @@returned_to@@: </strong>
									<xsl:value-of select="notification_data/partner_name"/>
								</td>
							</tr>
							<xsl:if test="notification_data/request/return_info !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/request/return_info"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong> @@address@@: </strong>
								</td>
							</tr>
							<xsl:if test="notification_data/partner_address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line1"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line2"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line3"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line4"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/line5"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/city"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/partner_address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/partner_address/country"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong> @@email@@: </strong>
									<xsl:value-of select="notification_data/partner_email/email"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@phone@@: </strong>
									<xsl:value-of select="notification_data/partner_phone/phone"/>
								</td>
							</tr>
							<tr>
								<td><strong> @@request_id@@: </strong><img src="externalId.png" alt="externalId"/></td>
							</tr>
							<tr><td><br/></td></tr>
							<xsl:if test="notification_data/request/display/title !=''">
								<tr>
									<td>
										<strong> @@title@@: </strong>
										<xsl:value-of select="notification_data/request/display/title"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/journal_title !=''">
								<tr>
									<td>
										<strong> @@journal_title@@: </strong>
										<xsl:value-of select="notification_data/request/display/journal_title"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong> @@author@@: </strong>
									<xsl:value-of select="notification_data/request/display/author"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@volume@@: </strong>
									<xsl:value-of select="notification_data/request/display/volume"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@issue@@: </strong>
									<xsl:value-of select="notification_data/request/display/issue"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<strong> @@arrival_date@@: </strong>
									<xsl:value-of select="notification_data/request/item_arrival_date"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@required_return_date@@: </strong>
									<xsl:value-of select="notification_data/request/due_date"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<strong> @@note_to_partner@@: </strong>
									<xsl:value-of select="notification_data/note_to_partner"/>
								</td>
							</tr>
						</table>

						<br/><br/>

						<table role='presentation' >
							<tr>
								<td>@@signature@@</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="notification_data/library/name"/>
								</td>
							</tr>
							<xsl:if test="notification_data/library/address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line1"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line2"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line3"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line4"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line5"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/city"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/country"/>
									</td>
								</tr>

							</xsl:if>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
