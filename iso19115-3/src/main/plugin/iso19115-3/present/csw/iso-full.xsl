<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gn="http://www.fao.org/geonetwork"
  xmlns:gco="http://standards.iso.org/19139/gco/1.0/2014-12-25"
  xmlns:gmd="http://standards.iso.org/19115/-3/gmd"
  xmlns:mdb="http://standards.iso.org/19115/-3/mdb/1.0/2014-12-25"
  exclude-result-prefixes="#all">
  
  <xsl:import href="../../convert/ISO19115-3toISO19139.xsl"/>
  
  <xsl:param name="displayInfo"/>
  
  <xsl:template match="/">
    <xsl:for-each select="/*">
      <xsl:variable name="info" select="gn:info"/>
      <xsl:variable name="nameSpacePrefix">
        <xsl:call-template name="getNamespacePrefix"/>
      </xsl:variable>
      <xsl:element name="{concat($nameSpacePrefix,':',local-name(.))}">
        <xsl:call-template name="add-namespaces"/>
        <xsl:apply-templates select="mdb:metadataIdentifier"/>
        <xsl:apply-templates select="mdb:defaultLocale"/>
        <xsl:apply-templates select="mdb:parentMetadata"/>
        <xsl:apply-templates select="mdb:metadataScope"/>
        <xsl:apply-templates select="mdb:contact"/>
        <xsl:apply-templates select="mdb:dateInfo"/>
        <xsl:apply-templates select="mdb:metadataStandard"/>
        <xsl:apply-templates select="mdb:metadataProfile"/>
        <xsl:apply-templates select="mdb:alternativeMetadataReference"/>
        <xsl:apply-templates select="mdb:otherLocale"/>
        <xsl:apply-templates select="mdb:metadataLinkage"/>
        <xsl:apply-templates select="mdb:spatialRepresentationInfo"/>
        <xsl:apply-templates select="mdb:referenceSystemInfo"/>
        <xsl:apply-templates select="mdb:metadataExtensionInfo"/>
        <xsl:apply-templates select="mdb:identificationInfo"/>
        <xsl:apply-templates select="mdb:contentInfo"/>
        <xsl:apply-templates select="mdb:distributionInfo"/>
        <xsl:apply-templates select="mdb:dataQualityInfo"/>
        <xsl:apply-templates select="mdb:resourceLineage"/>
        <xsl:apply-templates select="mdb:portrayalCatalogueInfo"/>
        <xsl:apply-templates select="mdb:metadataConstraints"/>
        <xsl:apply-templates select="mdb:applicationSchemaInfo"/>
        <xsl:apply-templates select="mdb:metadataMaintenance"/>
        <xsl:if test="$displayInfo = 'true'">
          <xsl:copy-of select="$info"/>
        </xsl:if>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>