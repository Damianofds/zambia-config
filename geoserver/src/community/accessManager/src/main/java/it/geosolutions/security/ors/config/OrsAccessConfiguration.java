package it.geosolutions.security.ors.config;

import it.geosolutions.security.ors.AccessRule;

import java.io.Serializable;
import java.util.Set;
/**
 * Configuration for the Resource Access Manager
 * @author Lorenzo Natali
 * @author DamianoG, GeoSolutions
 *
 */
public class OrsAccessConfiguration implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Set<AccessRule> rules;
    private String defaultAccessBuilder;
    
    /**
     * @return the list of rules
     */
    public Set<AccessRule> getRules() {
        return rules;
    }
    public void setRules(Set<AccessRule> rules) {
        this.rules = rules;
    }
    /**
     * The default access builder
     * @return
     */
    public String getDefaultAccessBuilder() {
        return defaultAccessBuilder;
    }
    public void setDefaultAccessBuilder(String defaultAccessBuilder) {
        this.defaultAccessBuilder = defaultAccessBuilder;
    }
}
