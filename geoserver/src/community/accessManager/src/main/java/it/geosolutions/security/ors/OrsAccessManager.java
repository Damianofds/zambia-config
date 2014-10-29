package it.geosolutions.security.ors;

import it.geosolutions.security.ors.config.OrsAccessConfiguration;
import it.geosolutions.security.ors.limitbuilder.AccessLimitBuilder;
import it.geosolutions.security.ors.limitbuilder.ReadWriteALB;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.geoserver.catalog.Catalog;
import org.geoserver.catalog.CatalogInfo;
import org.geoserver.catalog.LayerGroupInfo;
import org.geoserver.catalog.LayerInfo;
import org.geoserver.catalog.Predicates;
import org.geoserver.catalog.ResourceInfo;
import org.geoserver.catalog.StyleInfo;
import org.geoserver.catalog.WorkspaceInfo;
import org.geoserver.config.GeoServerDataDirectory;
import org.geoserver.config.util.XStreamPersister;
import org.geoserver.config.util.XStreamPersisterFactory;
import org.geoserver.security.CatalogMode;
import org.geoserver.security.DataAccessLimits;
import org.geoserver.security.LayerGroupAccessLimits;
import org.geoserver.security.ResourceAccessManager;
import org.geoserver.security.StyleAccessLimits;
import org.geoserver.security.WorkspaceAccessLimits;
import org.geoserver.security.impl.GeoServerRole;
import org.geotools.util.logging.Logging;
import org.opengis.filter.Filter;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

/**
 * Access Manager for Ors Application
 * 
 * @author Lorenzo Natali, GeoSolutions
 * @author DamianoG, GeoSolutions 
 * 
 */
public class OrsAccessManager implements ResourceAccessManager, ApplicationContextAware {
    private static final Logger LOGGER = Logging.getLogger(OrsAccessManager.class);

    static final CatalogMode DEFAULT_CATALOG_MODE = CatalogMode.HIDE;

    static final String ROOT_ROLE = "ROLE_ADMINISTRATOR";

    static final String CONFIG_LOCATION = "OrsAccessManager.xml";

    /**
     * The Catalog
     */
    private Catalog catalog;

    /**
     * The configuration
     */
    private OrsAccessConfiguration configuration;

    GeoServerDataDirectory datadir;

    private Map<String, AccessLimitBuilder> albCache = new HashMap<String, AccessLimitBuilder>();

    private ApplicationContext context;

    public OrsAccessManager(Catalog catalog, GeoServerDataDirectory datadir)
            throws IOException {
        super();
        this.catalog = catalog;
        this.datadir = datadir;

        loadConfig();

    }

    /**
     * Load the configuration and empty the cache of beans if any
     */
    private void loadConfig() throws IOException {
        // empty bean cache
        albCache = new HashMap<String, AccessLimitBuilder>();
        // load resource from the data directory
        File configFile = datadir.getResourceLoader().find(CONFIG_LOCATION);

        XStreamPersister xp = persister();

        this.configuration = loadConfigFile(configFile, xp);
    }

    /**
     * reads a config file from the specified directly using the specified xstream persister
     */
    OrsAccessConfiguration loadConfigFile(File file, XStreamPersister xp) throws IOException {
        FileInputStream fin = new FileInputStream(file);
        try {
            return xp.load(fin, OrsAccessConfiguration.class);
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE,
                    "Unable to load the access nanager from file" + file.getAbsolutePath());
            throw e;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE,
                    "Unable to load the access nanager from file" + file.getAbsolutePath());
        } finally {
            if (fin != null) {
                fin.close();
            }
        }
        return configuration;
    }

    /**
     * Create a persister for the configuration
     * 
     * @return
     * @throws IOException
     */
    XStreamPersister persister() throws IOException {
        XStreamPersister xp = new XStreamPersisterFactory().createXMLPersister();
        xp.getXStream().alias("config", OrsAccessConfiguration.class);
        xp.getXStream().alias("rule", AccessRule.class);

        return xp;
    }

    /**
     * The workspace access limit is fixed. Only admin user can write workspaces.
     */
    @Override
    public WorkspaceAccessLimits getAccessLimits(Authentication user, WorkspaceInfo workspace) {
        LOGGER.log(Level.FINE, "Getting access limits for workspace {0}", workspace.getName());

        if(workspace.getName().equalsIgnoreCase("geosolutions")){
             return new WorkspaceAccessLimits(DEFAULT_CATALOG_MODE, true, true);
        }
        
        if ((user != null) && !(user instanceof AnonymousAuthenticationToken)) {
            // shortcut, if the user is the admin, he can do everything
            if (isAdmin(user)) {
                LOGGER.log(Level.FINE, "Admin level access, returning "
                        + "full rights for workspace {0}", workspace.getName());

                return new WorkspaceAccessLimits(DEFAULT_CATALOG_MODE, true, true);
            }

        }
        return new WorkspaceAccessLimits(DEFAULT_CATALOG_MODE, true, false);
    }

    @Override
    public DataAccessLimits getAccessLimits(Authentication user, LayerInfo layer) {
        LOGGER.log(Level.FINE, "Getting access limits for Layer {0}", layer.getName());
        // the layer access limits depends on the resource access limit
        return getAccessLimits(user, layer.getResource());
    }

    @Override
    public DataAccessLimits getAccessLimits(Authentication user, ResourceInfo resource) {
        AccessLimitBuilder b =null;
        if ((user != null) && !(user instanceof AnonymousAuthenticationToken)) {
            // shortcut, if the user is the admin, he can do everything
            if (isAdmin(user)) {
                LOGGER.log(Level.FINE, "Admin level access, returning "
                        + "full rights for layer {0}", resource.getPrefixedName());

                return buildAccessLimits(user, resource, new ReadWriteALB());// TODO if null allow all
            }
            
        }
        //authenticated or anonymous user
        b = getAccessLimitBuilder(resource);
        // retrieve and return the DataAccessLimit object

        return buildAccessLimits(user, resource, b);
        
    }

    /**
     * Provides the access limit builder for the required resource. Check the configuration and get the configured builder.
     * 
     * @param resource the resource to access
     * @return the access limit builder
     */
    private AccessLimitBuilder getAccessLimitBuilder(ResourceInfo resource) {
        String workspace = resource.getStore().getWorkspace().getName();
        String name = resource.getName();
        return getAccessLimitBuilder(workspace, name);

    }

    /**
     * Get the AccessLimitBuilder from the configuration. It looks for a rule in the configuration, get the accessLimitBuilder string and find the
     * 
     * @param workspace the workspace
     * @param name the name of the workspace
     * @return
     */
    private AccessLimitBuilder getAccessLimitBuilder(String workspace, String name) {
        AccessRule ar = getRule(workspace,name);
        AccessLimitBuilder alb = getAccessLimitBuilder(ar);
        return alb;

    }
    /**
     * Get the bulder for an access rule
     * @param ar
     */
    private AccessLimitBuilder getAccessLimitBuilder(AccessRule ar) {
        if(ar == null){
            return getDefaultAccessLimitBuilder();
        }
        String beanName = ar.getAccessLimitBuilder();
        return getAccessLimitBuilder(beanName);
        
        
        
    }
    /**
     * Get the default access limit builder
     */
    private AccessLimitBuilder getDefaultAccessLimitBuilder() {
        return getAccessLimitBuilder(configuration.getDefaultAccessBuilder());
    }

    /**
     * Get the access builder from the bean name
     * @param beanName
     */
    private AccessLimitBuilder getAccessLimitBuilder(String beanName) {
        AccessLimitBuilder alb = albCache.get(beanName);
        if(alb == null){
            alb = (AccessLimitBuilder) context.getBean(beanName);
            albCache.put(beanName, alb);
            if(alb == null){
                LOGGER.log(Level.SEVERE,"Unknown AccessLimitBuilder {0}", beanName);
            }
            return alb;
        }
        return alb;
        
        
    }

    /**
     * Get a rule for a name, workspace.  
     * 
     * @param workspace the name of the workspace
     * @param name the name of the resource (layer)
     * @return the Access Rule with better matches. the rule for that match workspace.layer, if not found the 
     *      rule that match workspace.*, then the generic rule *.*. 
     *      Otherwise returns null.
     */
    private AccessRule getRule(String workspace, String name) {
        AccessRule genericRule = null;
        AccessRule workspaceMatch = null;
        for(AccessRule rule : configuration.getRules()){
            //case *.*
            if(AccessRule.ANY.equals(rule.getWorkspace()) && AccessRule.ANY.equals(rule.getLayer())){
                genericRule = rule;
            //case workspace match (workspace.*)
            }else if(rule.getWorkspace().equals(workspace) && AccessRule.ANY.equals(rule.getLayer())){
                workspaceMatch = rule;
            //case of full match (workspace.layer), return the first rule found
            }else if(rule.getWorkspace().equals(workspace) && rule.getLayer().equals(name)){
                return rule;
            }
        }
        //return the best match (or null)
        return workspaceMatch != null ? workspaceMatch : genericRule;
    }

    /**
     * Builds the data access limit for a resource.
     * 
     * @param resource the resource
     * @param b the access limit builder
     * @return the access limits
     */
    private DataAccessLimits buildAccessLimits(Authentication user, ResourceInfo resource,
            AccessLimitBuilder b) {

        CatalogMode catalogMode = DEFAULT_CATALOG_MODE;
        if(b == null){
           b = getDefaultAccessLimitBuilder();
        }
        LOGGER.log(Level.FINE, "Returning mode {0} for resource {1}", new Object[] { catalogMode,
                resource });
        return b.buildAccessLimits(user, resource, DEFAULT_CATALOG_MODE);

    }

    @Override
    public StyleAccessLimits getAccessLimits(Authentication user, StyleInfo arg1) {
        LOGGER.fine("Not limiting styles");
        return null;
    }
    
    @Override
    public LayerGroupAccessLimits getAccessLimits(Authentication user, LayerGroupInfo arg1) {
        LOGGER.fine("Not limiting layergroups");
        return null;
    }
    
    /**
     * This method is not avaliable in 2.5.2 so the override annotation can not be used
     * for compatibility reason. 
     */
    public Filter getSecurityFilter(Authentication user, Class<? extends CatalogInfo> arg1) {
        return Predicates.acceptAll();
        
    }
    
    public Filter getSecurityFilter() {
        return Predicates.acceptAll();
        
    }
    

    boolean isAdmin(Authentication user) {
        if (user.getAuthorities() != null) {
            for (GrantedAuthority authority : user.getAuthorities()) {
                final String userRole = authority.getAuthority();
                if (ROOT_ROLE.equals(userRole)
                        || GeoServerRole.ADMIN_ROLE.getAuthority().equals(userRole)) {
                    return true;
                }
            }
        }

        return false; 
    }

    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        this.context = context;

    }

}
