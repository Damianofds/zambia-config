package it.geosolutions.security.ors.limitbuilder;

import org.geoserver.catalog.ResourceInfo;
import org.geoserver.security.CatalogMode;
import org.geoserver.security.DataAccessLimits;
import org.springframework.security.core.Authentication;
/**
 * Interface for a dynamic filter builder.
 * @author Lorenzo Natali, GeoSolutions
 * @author DamianoG, GeoSolutions
 *
 */
public interface AccessLimitBuilder {
    /**
     * Build the Access Limits for the resource
     * @param user the user
     * @param resource the resource to access
     * @return the DataAccessLimits to use
     */
	public DataAccessLimits buildAccessLimits(Authentication user, ResourceInfo resource,CatalogMode catalogMode);
	
}
