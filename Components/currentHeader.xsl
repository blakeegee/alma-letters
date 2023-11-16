<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="head">
<table cellspacing="0" cellpadding="5" border="0">
	<xsl:attribute name="style">
		<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
<!--LOGO INSERT-->
	<tr>
	<xsl:attribute name="style">
		<xsl:call-template name="headerLogoStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
		<td colspan="2">
		<div id="mailHeader">
              <div id="logoContainer" class="alignLeft">
			  	<xsl:choose>
<!--RS Sharing Module-->
					<xsl:when test="(notification_data/general_data/letter_type='FulIncomingSlipLetter') and (notification_data/incoming_request/rapido_request='false') and (notification_data/partner_system_type='ALMA')">
						<img src="https://www.orbiscascade.org/wp-content/uploads/2021/05/orbis_cascade_logo_215px.png" alt="Orbis Cascade logo" />
					</xsl:when>
					<xsl:when test="(notification_data/general_data/letter_type='FulIncomingSlipLetter') and (notification_data/incoming_request/rapido_request='true') and (notification_data/pod_name='OrCa')">
						<img src="https://www.orbiscascade.org/wp-content/uploads/2021/05/orbis_cascade_logo_215px.png" alt="Orbis Cascade logo" />
					</xsl:when>
<!--Pick From Shelf-->
					<xsl:when test="(notification_data/request_type='Ship physically') and (notification_data/incoming_request/rapido_request='true') and (notification_data/pod_name='OrCa')">
						<img src="https://www.orbiscascade.org/wp-content/uploads/2021/05/orbis_cascade_logo_215px.png" alt="Orbis Cascade logo" />
					</xsl:when>
					<xsl:when test="(notification_data/incoming_request/partner_code='CC') or (notification_data/incoming_request/partner_code='CCC') or (notification_data/incoming_request/partner_code='CHEMEK') or (notification_data/incoming_request/partner_code='COCC') or (notification_data/incoming_request/partner_code='CWU') or (notification_data/incoming_request/partner_code='Central Washington University - Brooks Library') or (notification_data/incoming_request/partner_code='EOU') or (notification_data/incoming_request/partner_code='EVSC') or (notification_data/incoming_request/partner_code='EWU') or (notification_data/incoming_request/partner_code='Evergreen State College -  Olympia Campus Library') or (notification_data/incoming_request/partner_code='GFOX_MLRC') or (notification_data/incoming_request/partner_code='GFOX_PCL') or (notification_data/incoming_request/partner_code='GONZ') or (notification_data/incoming_request/partner_code='LANECC') or (notification_data/incoming_request/partner_code='LCC') or (notification_data/incoming_request/partner_code='LINF_MAC') or (notification_data/incoming_request/partner_code='LINF_PDX') or (notification_data/incoming_request/partner_code='MHCC') or (notification_data/incoming_request/partner_code='OHSU') or (notification_data/incoming_request/partner_code='OIT_KFLS') or (notification_data/incoming_request/partner_code='OIT_WILS') or (notification_data/incoming_request/partner_code='OSU') or (notification_data/incoming_request/partner_code='Oregon Health and Science University - OHSU Library') or (notification_data/incoming_request/partner_code='PCC') or (notification_data/incoming_request/partner_code='PSU') or (notification_data/incoming_request/partner_code='PU_FG') or (notification_data/incoming_request/partner_code='PU_HPC') or (notification_data/incoming_request/partner_code='Portland Community College - Rock Creek') or (notification_data/incoming_request/partner_code='Portland State University - PSU Library') or (notification_data/incoming_request/partner_code='REED') or (notification_data/incoming_request/partner_code='SEAU_LAW') or (notification_data/incoming_request/partner_code='SEAU_LEMIEUX') or (notification_data/incoming_request/partner_code='SOU_RCCM') or (notification_data/incoming_request/partner_code='SOU_SOU') or (notification_data/incoming_request/partner_code='SPU') or (notification_data/incoming_request/partner_code='STMU') or (notification_data/incoming_request/partner_code='Southern Oregon University - Hannon Library') or (notification_data/incoming_request/partner_code='UID_LAW') or (notification_data/incoming_request/partner_code='UID_MAIN') or (notification_data/incoming_request/partner_code='UO') or (notification_data/incoming_request/partner_code='UPORT') or (notification_data/incoming_request/partner_code='UPUGS') or (notification_data/incoming_request/partner_code='UW') or (notification_data/incoming_request/partner_code='University of Oregon - Knight Library') or (notification_data/incoming_request/partner_code='WALLA_PETERSON') or (notification_data/incoming_request/partner_code='WALLA_PORTLAND') or (notification_data/incoming_request/partner_code='WHITC') or (notification_data/incoming_request/partner_code='WOU') or (notification_data/incoming_request/partner_code='WPC') or (notification_data/incoming_request/partner_code='WSU_HOLLTERR') or (notification_data/incoming_request/partner_code='WSU_RPOINT') or (notification_data/incoming_request/partner_code='WSU_TRICITIES') or (notification_data/incoming_request/partner_code='WSU_VANCOUVER') or (notification_data/incoming_request/partner_code='WU_LAW') or (notification_data/incoming_request/partner_code='WU_MOH') or (notification_data/incoming_request/partner_code='WU_PNCA') or (notification_data/incoming_request/partner_code='WWO') or (notification_data/incoming_request/partner_code='WWU') or (notification_data/incoming_request/partner_code='Washington State University - Holland and Terrell Libraries') or (notification_data/incoming_request/partner_code='Washington State University - Vancouver Library')">
						<img src="https://www.orbiscascade.org/wp-content/uploads/2021/05/orbis_cascade_logo_215px.png" alt="Orbis Cascade logo" />
					</xsl:when>
<!--Default Logo-->
					<xsl:otherwise>
						<img src="cid:logo.jpg" alt="WSU Libraries logo"/>
					</xsl:otherwise>
				</xsl:choose>
              </div>
		</div>
		</td>
	</tr>
<!--LETTER NAME INSERT-->
	<tr>
<xsl:choose>
<!--RS Sharing Module-->
	<xsl:when test="notification_data/general_data/letter_type='FulIncomingSlipLetter'">
		<td>
			<h3>Resource Sharing</h3>
		</td>
	</xsl:when>
<!--Pick From Shelf-->
	<xsl:when test="(notification_data/request_type='Ship physically') and (notification_data/incoming_request/rapido_request='true') and (notification_data/pod_name='OrCa')">
		<td>
			<h3>Summit Request</h3>
		</td>
	</xsl:when>
	<xsl:when test="((notification_data/request_type='Ship physically') and notification_data/incoming_request/rapido_request='true')">
		<td>
			<h3>Rapido Request</h3>
		</td>
	</xsl:when>
	<xsl:when test="(notification_data/incoming_request/partner_code='CC') or (notification_data/incoming_request/partner_code='CCC') or (notification_data/incoming_request/partner_code='CHEMEK') or (notification_data/incoming_request/partner_code='COCC') or (notification_data/incoming_request/partner_code='CWU') or (notification_data/incoming_request/partner_code='Central Washington University - Brooks Library') or (notification_data/incoming_request/partner_code='EOU') or (notification_data/incoming_request/partner_code='EVSC') or (notification_data/incoming_request/partner_code='EWU') or (notification_data/incoming_request/partner_code='Evergreen State College -  Olympia Campus Library') or (notification_data/incoming_request/partner_code='GFOX_MLRC') or (notification_data/incoming_request/partner_code='GFOX_PCL') or (notification_data/incoming_request/partner_code='GONZ') or (notification_data/incoming_request/partner_code='LANECC') or (notification_data/incoming_request/partner_code='LCC') or (notification_data/incoming_request/partner_code='LINF_MAC') or (notification_data/incoming_request/partner_code='LINF_PDX') or (notification_data/incoming_request/partner_code='MHCC') or (notification_data/incoming_request/partner_code='OHSU') or (notification_data/incoming_request/partner_code='OIT_KFLS') or (notification_data/incoming_request/partner_code='OIT_WILS') or (notification_data/incoming_request/partner_code='OSU') or (notification_data/incoming_request/partner_code='Oregon Health and Science University - OHSU Library') or (notification_data/incoming_request/partner_code='PCC') or (notification_data/incoming_request/partner_code='PSU') or (notification_data/incoming_request/partner_code='PU_FG') or (notification_data/incoming_request/partner_code='PU_HPC') or (notification_data/incoming_request/partner_code='Portland Community College - Rock Creek') or (notification_data/incoming_request/partner_code='Portland State University - PSU Library') or (notification_data/incoming_request/partner_code='REED') or (notification_data/incoming_request/partner_code='SEAU_LAW') or (notification_data/incoming_request/partner_code='SEAU_LEMIEUX') or (notification_data/incoming_request/partner_code='SOU_RCCM') or (notification_data/incoming_request/partner_code='SOU_SOU') or (notification_data/incoming_request/partner_code='SPU') or (notification_data/incoming_request/partner_code='STMU') or (notification_data/incoming_request/partner_code='Southern Oregon University - Hannon Library') or (notification_data/incoming_request/partner_code='UID_LAW') or (notification_data/incoming_request/partner_code='UID_MAIN') or (notification_data/incoming_request/partner_code='UO') or (notification_data/incoming_request/partner_code='UPORT') or (notification_data/incoming_request/partner_code='UPUGS') or (notification_data/incoming_request/partner_code='UW') or (notification_data/incoming_request/partner_code='University of Oregon - Knight Library') or (notification_data/incoming_request/partner_code='WALLA_PETERSON') or (notification_data/incoming_request/partner_code='WALLA_PORTLAND') or (notification_data/incoming_request/partner_code='WHITC') or (notification_data/incoming_request/partner_code='WOU') or (notification_data/incoming_request/partner_code='WPC') or (notification_data/incoming_request/partner_code='WSU_HOLLTERR') or (notification_data/incoming_request/partner_code='WSU_RPOINT') or (notification_data/incoming_request/partner_code='WSU_TRICITIES') or (notification_data/incoming_request/partner_code='WSU_VANCOUVER') or (notification_data/incoming_request/partner_code='WU_LAW') or (notification_data/incoming_request/partner_code='WU_MOH') or (notification_data/incoming_request/partner_code='WU_PNCA') or (notification_data/incoming_request/partner_code='WWO') or (notification_data/incoming_request/partner_code='WWU') or (notification_data/incoming_request/partner_code='Washington State University - Holland and Terrell Libraries') or (notification_data/incoming_request/partner_code='Washington State University - Vancouver Library')">
		<td>
			<h3>Summit Request</h3>
		</td>
	</xsl:when>
	<xsl:when test="(notification_data/request_type='Ship physically') and (notification_data/incoming_request/rapido_request='false') and (contains(notification_data/incoming_request/partner_code, '01SUNY'))">
		<td>
			<h3>Hybrid Pod Request</h3>
		</td>
	</xsl:when>
<!--
	<xsl:when test="(notification_data/request_type='Ship physically') and (notification_data/incoming_request/rapido_request='false') and (notification_data/partner_system_type='ALMA') and not(contains(notification_data/incoming_request/partner_code, '01SUNY'))">
		<td>
			<h3>Summit Request</h3>
		</td>
	</xsl:when>

	<xsl:when test="(notification_data/incoming_request/rapido_request='false') and not(contains(notification_data/incoming_request/partner_code, '_RAPID'))">
		<td>
			<h3>Hybrid Pod Request</h3>
		</td>
	</xsl:when>
-->
	<xsl:when test="(notification_data/incoming_request/rapido_request='false') and (contains(notification_data/incoming_request/partner_code, '_RAPID'))">
		<td>
			<h3>Rapid ILL Request</h3>
		</td>
	</xsl:when>
<!--Pick from Shelf-->
	<xsl:when test="((notification_data/general_data/letter_name='Resource Request Slip Letter') and (notification_data/request_type='Patron physical item request'))">
		<td>
			<h3>Local Request</h3>
		</td>
	</xsl:when>
	<xsl:when test="((notification_data/general_data/letter_name='Resource Request Slip Letter') and (notification_data/request_type='Patron digitization request'))">
		<td>
			<h3>Local Digitization Request</h3>
		</td>
	</xsl:when>
	<xsl:when test="((notification_data/general_data/letter_name='Resource Request Slip Letter') and (notification_data/request_type='Ship digitally'))">
		<td>
			<h3>Resource Sharing Digitization Request</h3>
		</td>
	</xsl:when>
	<xsl:otherwise>
		<td>
			<h3><xsl:value-of select="notification_data/general_data/letter_name"/></h3>
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
