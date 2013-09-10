<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
 xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
 xmlns="http://www.opengis.net/sld" 
 xmlns:ogc="http://www.opengis.net/ogc" 
 xmlns:xlink="http://www.w3.org/1999/xlink" 
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- a Named Layer is the basic building block of an SLD document -->
  <NamedLayer>
    <Name>Deforestation</Name>
    <UserStyle>
    <!-- Styles can have names, titles and abstracts -->
      <Title>Deforestation</Title>
      <Abstract>A sample style that draws Deforest and Reforest areas</Abstract>
      <!-- FeatureTypeStyles describe how to render different features -->
      <!-- A FeatureTypeStyle for rendering rasters -->
      <FeatureTypeStyle>
        <Rule>
          <Name>rule1</Name>
          <Title>Forest Changes</Title>
          <Abstract>A simple style to keep clear where the deforestation nad reforestation areas are</Abstract>
          <RasterSymbolizer>
            <ColorMap  type="values">
              <ColorMapEntry color="#000000" quantity="-2" label="no data" opacity="0"/>
              <ColorMapEntry color="#FF0000" quantity="-1" label="Deforested" opacity="1"/>
              <ColorMapEntry color="#FFFFFF" quantity="0" label="No Changes" opacity="0"/>              
              <ColorMapEntry color="#336600" quantity="1" label="Reforested" opacity="1"/>              
              <ColorMapEntry color="#000000" quantity="2" label="no data" opacity="0"/>              
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>