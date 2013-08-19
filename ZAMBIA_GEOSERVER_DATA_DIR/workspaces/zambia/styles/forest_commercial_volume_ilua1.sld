<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
    xmlns="http://www.opengis.net/sld" 
    xmlns:ogc="http://www.opengis.net/ogc" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
    <Name>Forest Commercial Volume</Name>
    <UserStyle>
      <Title>Forest Commercial Volume</Title>
        <FeatureTypeStyle>
          <Rule>          
            <Name>border</Name>
            <PolygonSymbolizer>
              <Stroke>
                <CssParameter name="stroke">#421700</CssParameter>
                <CssParameter name="stroke-width">1</CssParameter> 
              </Stroke>
            </PolygonSymbolizer>
          </Rule>
          <Rule>
            <MaxScaleDenominator>3000000</MaxScaleDenominator>            
            <MinScaleDenominator>800000</MinScaleDenominator>            
            <TextSymbolizer>
              <Geometry>
                 <ogc:Function name="centroid">
                    <ogc:PropertyName>the_geom</ogc:PropertyName>
                 </ogc:Function>
              </Geometry>
              <Label>
                <![CDATA[Forest Commercial volume 
                ]]>
                <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName><![CDATA[ m3 per ha]]>
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
            <MinScaleDenominator>3000000</MinScaleDenominator>            
            <TextSymbolizer>
              <Geometry>
                 <ogc:Function name="centroid">
                    <ogc:PropertyName>the_geom</ogc:PropertyName>
                 </ogc:Function>
              </Geometry>
              <Label>
                <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
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
            <Name>CommercialVolume2-3</Name>
               <Title>Forest Commercial Volume between 2 and 3 m3 per ha</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>2</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>3</ogc:Literal>
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
                   <CssParameter name="fill">#C4571C</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>CommercialVolume3-4</Name>
               <Title>Forest Commercial Volume between 3 and 4 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>3</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>4</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                     <CssParameter name="fill">#B34F19</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>CommercialVolume4-5</Name>
               <Title>Forest Commercial Volume between 4 and 5 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>4</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>5</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#A14717</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>CommercialVolume5-6</Name>
               <Title>Forest Commercial Volume between 5 and 6 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>5</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>6</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#8F3F14</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>CommercialVolume7-8</Name>
               <Title>Forest Commercial Volume between 7 and 8 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>7</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>8</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#803912</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>CommercialVolume11-12</Name>
               <Title>Forest Commercial Volume between 11 and 12 m3 per ha</Title>
               <ogc:Filter>
                 <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>11</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>12</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#6B2F0F</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
             <Rule>
               <Name>Volume100</Name>
               <Title>Forest Volume higer than 12 m3 per ha</Title>
               <ogc:Filter>
                  <ogc:And>
                    <ogc:PropertyIsGreaterThanOrEqualTo>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>12</ogc:Literal>
                    </ogc:PropertyIsGreaterThanOrEqualTo>
                    <ogc:PropertyIsLessThan>
                       <ogc:PropertyName>Forest_Commercial_Volume_m3_per_ha</ogc:PropertyName>
                       <ogc:Literal>15</ogc:Literal>
                    </ogc:PropertyIsLessThan>
                 </ogc:And>
                </ogc:Filter>
               <PolygonSymbolizer>
                 <Fill>
                   <CssParameter name="fill">#59280D</CssParameter>
                 </Fill>
               </PolygonSymbolizer>
             </Rule>
</FeatureTypeStyle>
</UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>