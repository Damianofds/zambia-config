package it.geosolutions.security.ors.limitbuilder;


import org.geoserver.catalog.CoverageInfo;
import org.geoserver.catalog.FeatureTypeInfo;
import org.geoserver.catalog.ResourceInfo;
import org.geoserver.catalog.WMSLayerInfo;
import org.geoserver.security.CatalogMode;
import org.geoserver.security.CoverageAccessLimits;
import org.geoserver.security.DataAccessLimits;
import org.geoserver.security.VectorAccessLimits;
import org.geoserver.security.WMSAccessLimits;
import org.geotools.factory.CommonFactoryFinder;
import org.geotools.factory.GeoTools;
import org.opengis.filter.Filter;
import org.opengis.filter.FilterFactory;
import org.springframework.security.core.Authentication;

/**
 * Simple access limit builder that can be configured to allow/deny read/write
 * on a resource
 * @author nali
 * @author DamianoG, GeoSolutions
 *
 */
public class ReadWriteALB implements AccessLimitBuilder {
    private boolean canRead = true;
    private boolean canWrite = false;

    @Override
    public DataAccessLimits buildAccessLimits(Authentication user, ResourceInfo resource,
            CatalogMode catalogMode) {
        // basic filter
    	
    	FilterFactory ff = CommonFactoryFinder.getFilterFactory( GeoTools.getDefaultHints() );
    	Filter readFilter = ff.equal( ff.property( "gis_officer_id"), ff.literal(user.getName()), false );
        Filter writeFilter = Filter.INCLUDE ;
        
        if (resource instanceof FeatureTypeInfo)
        {
            ((FeatureTypeInfo) resource).getAttributes();

            return new VectorAccessLimits(catalogMode, null, readFilter, null,
                    writeFilter);
        }
        else if (resource instanceof CoverageInfo)
        {
           

            return new CoverageAccessLimits(catalogMode, null, null, null);
        }
        else if (resource instanceof WMSLayerInfo)
        {
            

            return new WMSAccessLimits(catalogMode, null, null, true);
        }
        else
        {
            throw new IllegalArgumentException("Don't know how to handle resource " + resource);
        }
    }

    public boolean isCanRead() {
        return canRead;
    }

    public void setCanRead(boolean canRead) {
        this.canRead = canRead;
    }

    public boolean isCanWrite() {
        return canWrite;
    }

    public void setCanWrite(boolean canWrite) {
        this.canWrite = canWrite;
    }

   
}
