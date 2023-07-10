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
		<head>
		<xsl:call-template name="generalStyle" />
		</head>
			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<!--<xsl:call-template name="toWhomIsConcerned" />--> <!-- mailReason.xsl -->
		<div class="messageArea">
				<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td><!--@@on@@ <xsl:value-of select="notification_data/general_data/current_date"/> -->@@we_cancel_y_req_of@@ <xsl:value-of select="notification_data/request/create_date"/> @@detailed_below@@ :</td></tr>
						<tr>
							<td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
						</tr>
	<xsl:if test="notification_data/request/note != ''">
							<tr>
								<td><strong> @@request_note@@: </strong> <xsl:value-of select="notification_data/request/note"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td><strong> @@reason_deleting_request@@: </strong> <xsl:value-of select="notification_data/request/status_note_display"/></td>
						</tr>
						<xsl:if test="notification_data/request/cancel_reason != ''">
							<tr>
								<td><strong> @@request_cancellation_note@@: </strong> <xsl:value-of select="notification_data/request/cancel_reason"/></td>
							</tr>
						</xsl:if>
<xsl:for-each select="notification_data">
					<tr>
						<td><strong>Barcode: </strong><xsl:value-of select="phys_item_display/barcode"/></td>
					</tr>
                                        <tr>
						<td><strong>Call Number: </strong><xsl:value-of select="phys_item_display/call_number"/></td>
					</tr>
				</xsl:for-each>
<xsl:if test="notification_data/request/resource_sharing_request_id != ''">
                                                 <tr>
                                                     <td><xsl:variable name="title">
                                                        <xsl:value-of select="notification_data/phys_item_display/title" />                                                         
                                                    </xsl:variable>
                                                    <xsl:variable name="author">
                                                        <xsl:value-of select="notification_data/phys_item_display/author" />                                                         
                                                    </xsl:variable>
                                               <xsl:variable name="isbn">
                                                        <xsl:value-of select="notification_data/phys_item_display/isbn" />                                                         
                                                    </xsl:variable>

<br/><br/><strong>Request item through Interlibrary Loan (may take up to two weeks) using one of the following links:</strong>
<br/><br/>
                                                   <a href="https://wsu.illiad.oclc.org/illiad/PUL/illiad.dll/OpenURL?Action=10&amp;Form=30&amp;rfr_id=Summit&amp;rft_val_fmt=info:ofi/fmt:key:mtx:book&amp;rft.genre=book&amp;citedin=Summit&amp;rft.btitle={$title}&amp;rft.aulast={$author}&amp;rft.isbn={$isbn}">Pullman Library (includes Global, Everett, and Extension) Patrons</a>
<br/><br/>

                                                    <a href="https://wsu.illiad.oclc.org/illiad/cal/illiad.dll/OpenURL?Action=10&amp;Form=30&amp;rfr_id=Summit&amp;rft_val_fmt=info:ofi/fmt:key:mtx:book&amp;rft.genre=book&amp;citedin=Summit&amp;rft.btitle={$title}&amp;rft.aulast={$author}&amp;rft.isbn={$isbn}">Spokane Academic Library Patrons </a>
<br/><br/>

                                                    <a href="http://www.tricity.wsu.edu/Library/ILL_book.php">Tri-Cities Library Patrons </a>                                                    
<br/><br/>


                                                     <a href="https://wsu.illiad.oclc.org/illiad/VAN/illiad.dll/OpenURL?Action=10&amp;Form=30&amp;rfr_id=Summit&amp;rft_val_fmt=info:ofi/fmt:key:mtx:book&amp;rft.genre=book&amp;citedin=Summit&amp;rft.btitle={$title}&amp;rft.aulast={$author}&amp;rft.isbn={$isbn}">Vancouver Library Patrons </a>


 
                                             </td></tr>
                                              </xsl:if> 
					
					</table>
					<br />
				<table>

						<!--<tr><td>@@sincerely@@</td></tr> -->
						<!--<tr><td>@@department@@</td></tr> -->

				</table>
				</div>
			</div>
			<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			<!--<xsl:call-template name="contactUs" /> -->
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
