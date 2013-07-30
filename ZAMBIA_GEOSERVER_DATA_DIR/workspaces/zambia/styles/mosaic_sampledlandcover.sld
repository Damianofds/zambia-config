<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
 xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
 xmlns="http://www.opengis.net/sld" 
 xmlns:ogc="http://www.opengis.net/ogc" 
 xmlns:xlink="http://www.w3.org/1999/xlink" 
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- a Named Layer is the basic building block of an SLD document -->
  <NamedLayer>
    <Name>default_raster</Name>
    <UserStyle>
    <!-- Styles can have names, titles and abstracts -->
      <Title>Default Raster</Title>
      <Abstract>A sample style that draws a raster, good for displaying imagery</Abstract>
      <!-- FeatureTypeStyles describe how to render different features -->
      <!-- A FeatureTypeStyle for rendering rasters -->
      <FeatureTypeStyle>
        <Rule>
          <Name>rule1</Name>
          <Title>Opaque Raster</Title>
          <Abstract>A raster with 100% opacity</Abstract>
          <RasterSymbolizer>
            <ColorMap  type="values">
              <ColorMapEntry color="#000000" quantity="0" label="no data" opacity="0"/>
              <ColorMapEntry color="#009600" quantity="1" label="Forestland" opacity="1"/>
              <ColorMapEntry color="#CDCD00" quantity="2" label="Grassland" opacity="1"/>
              <ColorMapEntry color="#FF9BBE" quantity="3" label="Cropland" opacity="1"/>
              <ColorMapEntry color="#00EEEE" quantity="4" label="Wetlands" opacity="1"/>
              <ColorMapEntry color="#FF0000" quantity="5" label="Settlement" opacity="1"/>              
              <ColorMapEntry color="#FFFFDC" quantity="6" label="Otherlands" opacity="1"/>              
              <ColorMapEntry color="#000000" quantity="7" label="no data" opacity="0"/>              
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>