<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
    xmlns="http://www.opengis.net/sld" 
    xmlns:ogc="http://www.opengis.net/ogc" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
    <Name>Forest Volume</Name>
    <UserStyle>
      <Title>Forest Volume</Title>
        <FeatureTypeStyle>
          <Rule>          
            <Name>border</Name>
            <PolygonSymbolizer>
              <Stroke>
                <CssParameter name="stroke">#362100</CssParameter>
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
                <![CDATA[Forest volume 
                ]]>
                <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName><![CDATA[ m3 per ha]]>
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
                <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
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
            <Name>Volume20-30</Name>
               <Title>Forest Volume between 20 and 30 m3 per ha</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>20</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>30</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <!--
                   <GraphicFill>
                     <Graphic>
                       <Mark>
                         <WellKnownName>shape://backslash</WellKnownName>
                         <Stroke>
                           <CssParameter name="stroke">#FF0000</CssParameter>                   
                           <CssParameter name="stroke-width">10</CssParameter>
                         </Stroke>
                       </Mark>
                       <Size>16</Size>
                     </Graphic>
                   </GraphicFill>
                   -->
                   <CssParameter name="fill">#916312</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Volume40-50</Name>
               <Title>Forest Volume between 40 and 50 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>40</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>50</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                     <CssParameter name="fill">#7F5610</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Volume50-60</Name>
               <Title>Forest Volume between 50 and 60 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>50</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>60</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#6D4A0D</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Volume80-90</Name>
               <Title>Forest Volume between 80 and 90 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>80</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>90</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#5B3E0B</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Volume100</Name>
               <Title>Forest Volume higer than 100 m3 per ha</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>100</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>110</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#493109</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
</FeatureTypeStyle>
</UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>