<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
    xmlns="http://www.opengis.net/sld" 
    xmlns:ogc="http://www.opengis.net/ogc" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
    <Name>Aboreground Biomass</Name>
    <UserStyle>
      <Title>Aboreground Biomass</Title>
        <FeatureTypeStyle>
          <Rule>          
            <Name>border</Name>
            <PolygonSymbolizer>
              <Stroke>
                <CssParameter name="stroke">#002400</CssParameter>
                <CssParameter name="stroke-width">1</CssParameter> 
              </Stroke>
            </PolygonSymbolizer>
          </Rule>
          <Rule>
            <MaxScaleDenominator>7000000</MaxScaleDenominator>            
            <MinScaleDenominator>2000000</MinScaleDenominator>            
            <TextSymbolizer>
              <Geometry>
                 <ogc:Function name="centroid">
                    <ogc:PropertyName>the_geom</ogc:PropertyName>
                 </ogc:Function>
              </Geometry>
              <Label>
                <![CDATA[Aboveground Biomass 
                ]]>
                <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName><![CDATA[ tonnes per ha]]>
              </Label>
              <Font>
                <CssParameter name="font-family">SansSerif</CssParameter>
                <CssParameter name="font-size">10</CssParameter>
                <CssParameter name="font-style">normal</CssParameter>
                <CssParameter name="font-weight">bold</CssParameter>
              </Font>
              <LabelPlacement>
                <PointPlacement>
                  <AnchorPoint>
                    <AnchorPointX>0.5</AnchorPointX>
                    <AnchorPointY>0.5</AnchorPointY>
                  </AnchorPoint>
                </PointPlacement>
              </LabelPlacement>
              <Halo>
                <Radius>1</Radius>
                <Fill>
                  <CssParameter name="fill">#000000</CssParameter>
                </Fill>
              </Halo>
              <Fill>
                <CssParameter name="fill">#FFFFFF</CssParameter>
              </Fill>
              <!-- <VendorOption name="autoWrap">60</VendorOption> -->
              <VendorOption name="maxDisplacement">150</VendorOption>
            </TextSymbolizer>
          </Rule>
          <Rule>
            <MinScaleDenominator>7000000</MinScaleDenominator>            
            <TextSymbolizer>
              <Geometry>
                 <ogc:Function name="centroid">
                    <ogc:PropertyName>the_geom</ogc:PropertyName>
                 </ogc:Function>
              </Geometry>
              <Label>
                <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
              </Label>
              <Font>
                <CssParameter name="font-family">SansSerif</CssParameter>
                <CssParameter name="font-size">10</CssParameter>
                <CssParameter name="font-style">normal</CssParameter>
                <CssParameter name="font-weight">bold</CssParameter>
              </Font>
              <LabelPlacement>
                <PointPlacement>
                  <AnchorPoint>
                    <AnchorPointX>0.5</AnchorPointX>
                    <AnchorPointY>0.5</AnchorPointY>
                  </AnchorPoint>
                </PointPlacement>
              </LabelPlacement>
              <Halo>
                <Radius>1</Radius>
                <Fill>
                  <CssParameter name="fill">#000000</CssParameter>
                </Fill>
              </Halo>
              <Fill>
                <CssParameter name="fill">#FFFFFF</CssParameter>
              </Fill>
              <!-- <VendorOption name="autoWrap">60</VendorOption> -->
              <VendorOption name="maxDisplacement">150</VendorOption>
            </TextSymbolizer>
          </Rule>
          <Rule>
            <Name>Biomass30-40</Name>
               <Title>Aboveground Biomass between 30 and 40 tonnes per ha</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>30</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>40</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#33FF33</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Biomass40-50</Name>
               <Title>Aboveground Biomass between 40 and 50 tonnes per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>40</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>50</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#00FF00</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Biomass50-60</Name>
               <Title>Aboveground Biomass between 50 and 60 tonnes per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>50</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>60</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                     <CssParameter name="fill">#00BB00</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Biomass60-70</Name>
               <Title>Aboveground Biomass between 60 and 70 tonnes per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>60</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>70</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#009900</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Biomass70-80</Name>
               <Title>Aboveground Biomass between 70 and 80 tonnes per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>70</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>80</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#007700</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Biomass100</Name>
               <Title>Aboveground Biomass higer than 100 tonnes per ha</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>100</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Aboveground_Biomass_tonnes_per_ha</ogc:PropertyName>
                       <ogc:Literal>110</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#004400</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
</FeatureTypeStyle>
</UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>