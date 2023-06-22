<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="head">
<table cellspacing="0" cellpadding="5" border="0">
	<xsl:attribute name="style">
		<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
	<!-- LOGO INSERT -->
	<tr>
	<xsl:attribute name="style">
		<xsl:call-template name="headerLogoStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
		<td colspan="2">
		<div id="mailHeader">
              <div id="logoContainer" class="alignLeft">
			  	<xsl:choose>
					<xsl:when test="((notification_data/request_type='Ship physically') and (notification_data/incoming_request/rapido_request='false')  and not(contains(notification_data/incoming_request/partner_code, '_RAPID')))">
						<img src="https://www.orbiscascade.org/wp-content/uploads/2021/05/orbis_cascade_logo_215px.png" alt="Orbis Cascade logo" />
					</xsl:when>
<xsl:when test="(((notification_data/general_data/letter_type='FulIncomingSlipLetter') and (notification_data/incoming_request/rapido_request='false') and (notification_data/partner_system_type='ALMA')))">
						<img src="https://www.orbiscascade.org/wp-content/uploads/2021/05/orbis_cascade_logo_215px.png" alt="Orbis Cascade logo" />
					</xsl:when>
					<xsl:otherwise>
						<img src="cid:logo.jpg" alt="WSU Libraries logo"/>
					</xsl:otherwise>
				</xsl:choose>
              </div>
		</div>
		</td>
	</tr>
<!-- END OF LOGO INSERT -->
	<tr>

<xsl:choose>
	<xsl:when test="notification_data/general_data/letter_type='FulIncomingSlipLetter'">
		<td>
			<h1>Resource Sharing</h1>
		</td>
	</xsl:when>
	<xsl:when test="((notification_data/incoming_request/rapido_request='false') and (notification_data/request_type='Ship physically') and not(contains(notification_data/incoming_request/partner_code, '_RAPID')))">
		<td>
			<h1>Summit Request</h1>
		</td>
	</xsl:when>
<!--
	<xsl:when test="((notification_data/incoming_request/rapido_request='false') and (notification_data/request_type='Ship physically') and (notification_data/incoming_request/partner_code!='VANC_RAPID'))">
		<td>
			<h1>Summit Request</h1>
		</td>
	</xsl:when>
-->
	<xsl:when test="((notification_data/incoming_request/rapido_request='false') and (notification_data/request_type='Ship physically'))">
		<td>
			<h1>Rapid ILL Request</h1>
		</td>
	</xsl:when>
	<xsl:when test="((notification_data/incoming_request/rapido_request='true') and (notification_data/request_type='Ship physically'))">
		<td>
			<h1>Rapido Request</h1>
		</td>
	</xsl:when>

	<xsl:when test="((notification_data/general_data/letter_name='Resource Request Slip Letter') and (notification_data/request_type='Patron physical item request'))">
		<td>
			<h1>Local Request</h1>
		</td>
	</xsl:when>
	<xsl:when test="((notification_data/general_data/letter_name='Resource Request Slip Letter') and (notification_data/request_type='Patron digitization request'))">
		<td>
			<h1>Local Digitization Request</h1>
		</td>
	</xsl:when>
	<xsl:when test="((notification_data/general_data/letter_name='Resource Request Slip Letter') and (notification_data/request_type='Ship digitally'))">
		<td>
			<h1>Resource Sharing Digitization Request</h1>
		</td>
	</xsl:when>
	<xsl:otherwise>
		<td>
			<h1><xsl:value-of select="notification_data/general_data/letter_name"/></h1>
		</td>
	</xsl:otherwise>
</xsl:choose>

	<td align="right">
		<xsl:value-of select="notification_data/general_data/current_date"/>
	</td>
</tr>
</table>
</xsl:template>
</xsl:stylesheet>
