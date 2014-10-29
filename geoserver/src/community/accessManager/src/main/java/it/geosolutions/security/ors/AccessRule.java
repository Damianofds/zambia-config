package it.geosolutions.security.ors;

import java.io.Serializable;
/**
 * The access rules to dispach elements
 * @author nali
 * @author DamianoG, GeoSolutions
 *
 */
public class AccessRule implements Serializable{
    
    /** serialVersionUID */
    private static final long serialVersionUID = 1974806089193175379L;
    
    /**
     * Any layer, or any workspace, or any role
     */
    public static final String ANY = "*";
    private String workspace;
    private String layer;
    private String accessLimitBuilder;
    
    public String getWorkspace() {
        return workspace;
    }
    public void setWorkspace(String workspace) {
        this.workspace = workspace;
    }
    public String getLayer() {
        return layer;
    }
    public void setLayer(String layer) {
        this.layer = layer;
    }
    public String getAccessLimitBuilder() {
        return accessLimitBuilder;
    }
    public void setAccessLimitBuilder(String accessLimitBuilder) {
        this.accessLimitBuilder = accessLimitBuilder;
    }
    /**
     * Returns the key for the current rule. No other rule should have the same
     * 
     * @return
     */
    public String getKey() {
        return workspace + "." + layer ;
    }
    public String getValue(){
        return accessLimitBuilder;
    }
    @Override
    public String toString() {
        return getKey() + "=" + getValue();
    }
    
    
}
