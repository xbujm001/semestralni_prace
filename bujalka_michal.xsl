<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text"/>
	<xsl:template match="/konfigurace_kuki_TV">
	{
	"konto": {
		"Jmeno": "<xsl:value-of select="konto/jmeno"/>",
		"Prijmeni": "<xsl:value-of select="konto/prijmeni"/>",
		"Datum narozeni": "<xsl:value-of select="konto/datum_narozeni"/>",
		"Adresa": "<xsl:value-of select="konto/adresa"/>",
		"ID Kuki": "<xsl:value-of select="konto/Kuki.ID"/>",
		"Tarif": "<xsl:value-of select="konto/tarif"/>"
	},
	"kanály": {
		<xsl:for-each select="zarizeni">
		"zarizeni": {
			"ID zarizeni": "<xsl:value-of select="@id_zarizeni"/>",
			<xsl:for-each select="nastaveni/poradi_kanalu/pozice">
			"pozice <xsl:value-of select="cislo_pozice"/>":
				{
				"Nazev pozice": "<xsl:value-of select="nazev_pozice"/>",
				<xsl:choose>
					<xsl:when test="@rodicovskyZamek = 1">
				"Rodicovsky zamek:": "Zapnuty"
					</xsl:when>
					<xsl:otherwise>
				"Rodicovsky zamek:": "Vypnuty"
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="@oblibeny = 1">
				"V oblíbených:": "Ano"
					</xsl:when>
					<xsl:otherwise>
				"V oblíbených:": "Ne"
					</xsl:otherwise>
				</xsl:choose>
				}<xsl:if test="position() != last()">,</xsl:if>
			</xsl:for-each>
			}<xsl:if test="position() != last()">,</xsl:if>
		</xsl:for-each>
		}
	}
	</xsl:template>
</xsl:stylesheet>