<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
    xmlns="http://www.opengis.net/sld" 
    xmlns:ogc="http://www.opengis.net/ogc" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
    <Name>Plant Products</Name>
    <UserStyle>
      <Title>Plant Products</Title>
        <FeatureTypeStyle>
          <Rule>          
            <Name>border</Name>
            <PolygonSymbolizer>
              <Stroke>
                <CssParameter name="stroke">#390422</CssParameter>
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
                <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName><![CDATA[% of Area 
                used for plant products]]>
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
                <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
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
               <Name>Volume10-20</Name>
               <Title>Area between 10% and 20% used for NWFP Plant Products</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>10</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>20</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#850A50</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Volume20-30</Name>
               <Title>Area between 20% and 30% used for NWFP Plant Products</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>20</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>30</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#780948</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Volume30-40</Name>
               <Title>Area between 30% and 40% used for NWFP Plant Products</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>30</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>40</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                     <CssParameter name="fill">#980B5B</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Wood40</Name>
               <Title>Area higer than 40% used for NWFP Plant Products</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>40</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Percentage_of_Area_for_NWFP_Plant_Products</ogc:PropertyName>
                       <ogc:Literal>50</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#5F0739</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
</FeatureTypeStyle>
</UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>