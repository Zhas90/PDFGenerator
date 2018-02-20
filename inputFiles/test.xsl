<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="xmlInfo">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <fo:layout-master-set>
    <fo:simple-page-master master-name="my-page">
      <fo:region-body margin="1in"/>
    </fo:simple-page-master>
  </fo:layout-master-set>

  <fo:page-sequence master-reference="my-page">
    <fo:flow flow-name="xsl-region-body">
        <fo:block>
            <fo:external-graphic src="image\forte_logo1.gif"
                                 content-height="scale-to-fit" height="2.00in"
                                 content-width="6.00in" scaling="non-uniform"/>
        </fo:block>
        <fo:block font-family="Arial" font-size="8pt">
      	<fo:table>
      		 <fo:table-body>
      		 	<fo:table-row>
                	<fo:table-cell border="solid 1px black" text-align="center" font-weight="bold">
                		<fo:block>
                            Дата отражения по счету
                  		</fo:block>
                	</fo:table-cell>
                	<fo:table-cell border="solid 1px black" text-align="center" font-weight="bold">
                		<fo:block>
                            Детали транзакций
                  		</fo:block>
                	</fo:table-cell>
                	<fo:table-cell border="solid 1px black" text-align="center" font-weight="bold">
                		<fo:block>
                            <![CDATA[Сумма в валюте операции]]>
                  		</fo:block>
                	</fo:table-cell>
                    <fo:table-cell border="solid 1px black" text-align="center" font-weight="bold">
                        <fo:block>
                            Зачисление в валюте счета
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell border="solid 1px black" text-align="center" font-weight="bold">
                        <fo:block>
                            Списание в валюте счета
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell border="solid 1px black" text-align="center" font-weight="bold">
                        <fo:block>
                            Остаток на конец дня
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell border="solid 1px black" text-align="center" font-weight="bold">
                        <fo:block>
                           Вид операции
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                   <xsl:for-each select="./depoAccount/accountInfo/details">
                       <fo:table-row>
                           <fo:table-cell border="solid 1px black" text-align="center">
                               <fo:block>
                                   <xsl:value-of select="reflectionDate"/>
                               </fo:block>
                           </fo:table-cell>
                           <fo:table-cell border="solid 1px black" text-align="center">
                               <fo:block>
                                   <xsl:value-of select="transactionDetails"/>
                               </fo:block>
                           </fo:table-cell>
                           <fo:table-cell border="solid 1px black" text-align="center">
                               <fo:block>
                                   <xsl:value-of select="amountCurr"/>
                               </fo:block>
                           </fo:table-cell>
                           <fo:table-cell border="solid 1px black" text-align="center">
                               <fo:block>
                                   <xsl:value-of select="enrollment"/>
                               </fo:block>
                           </fo:table-cell>
                           <fo:table-cell border="solid 1px black" text-align="center">
                               <fo:block>
                                   <xsl:value-of select="writeOff"/>
                               </fo:block>
                           </fo:table-cell>
                           <fo:table-cell border="solid 1px black" text-align="center">
                               <fo:block>
                                   <xsl:value-of select="endDayBalance"/>
                               </fo:block>
                           </fo:table-cell>
                           <fo:table-cell border="solid 1px black" text-align="center">
                               <fo:block>
                                   <xsl:value-of select="operType"/>
                               </fo:block>
                           </fo:table-cell>
                       </fo:table-row>
                   </xsl:for-each>
      		 </fo:table-body>
      	</fo:table>
      </fo:block>
    </fo:flow>
  </fo:page-sequence>
</fo:root>
</xsl:template>
</xsl:stylesheet>