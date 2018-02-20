<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="root">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		    <fo:layout-master-set>
                <fo:simple-page-master master-name="my-page"
                                       margin-top="2cm">
                    <fo:region-body margin="1in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="my-page">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-family="Arial" font-size="12pt">                    
                        <fo:table>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell number-columns-spanned="2">
                                        <fo:block>ПЛАТЕЖ ПРОВЕДЕН</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>НОМЕР КВИТАНЦИИ</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>№ <xsl:value-of select="invoiceNumber"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block padding-top="15pt" color="#C1C5C4">ПЛАТЕЛЬЩИК:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block padding-top="15pt"><xsl:value-of select="payer"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block color="#C1C5C4">ПОЛУЧАТЕЛЬ:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block><xsl:value-of select="recipient"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block color="#C1C5C4">ОПЛАЧЕННАЯ СУММА:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block><xsl:value-of select="amount"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block color="#C1C5C4">КОМИССИЯ:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block><xsl:value-of select="comission"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block padding-top="25pt" color="#C1C5C4">РЕКВИЗИТ ПЛАТЕЖА:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block padding-top="25pt"><xsl:value-of select="paymentInfo"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block color="#C1C5C4">ОПЛАЧЕНО СО СЧЕТА:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block><xsl:value-of select="paidFromN"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block color="#C1C5C4">ДАТА ПЛАТЕЖА:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block><xsl:value-of select="paymentDate"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>                      
                    </fo:block>
                    <fo:block text-align-last="justify">
                        <fo:leader/>
                        <fo:external-graphic src="image\stamp.jpg"
                                 content-height="scale-to-fit" height="1.00in"
                                 content-width="2.00in" scaling="non-uniform"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>