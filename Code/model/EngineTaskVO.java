package smartView.ai.project.model;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class EngineTaskVO implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = -4374348542569040434L;
    
    private String id;
    
    private String name;
    
    private String status;
    
    private String healthness;
    
    private String result;
    
    private String initial_spec;
    
    private String build_time;
    
    private String build_status;
    
    private String build_spec;
    
    private String job_id;
    
    private String owner;
    
    private String submit_time;
    
    private int uptime;
    
    private String start_time;
    
    private String end_time;
    
    private String driver_url;
    
    private String deploy_mode;
    
    private String deploy_manager;
    
    private String deploy_descriptor;
    
    private String service_url;
    
    private String result_ref;
    
    private String progress_ref;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getHealthness() {
        return healthness;
    }

    public void setHealthness(String healthness) {
        this.healthness = healthness;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getInitial_spec() {
        return initial_spec;
    }

    public void setInitial_spec(String initial_spec) {
        this.initial_spec = initial_spec;
    }

    public String getBuild_time() {
        return build_time;
    }

    public void setBuild_time(String build_time) {
        this.build_time = build_time;
    }

    public String getBuild_status() {
        return build_status;
    }

    public void setBuild_status(String build_status) {
        this.build_status = build_status;
    }

    public String getBuild_spec() {
        return build_spec;
    }

    public void setBuild_spec(String build_spec) {
        this.build_spec = build_spec;
    }

    public String getJob_id() {
        return job_id;
    }

    public void setJob_id(String job_id) {
        this.job_id = job_id;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getSubmit_time() {
        return submit_time;
    }

    public void setSubmit_time(String submit_time) {
        this.submit_time = submit_time;
    }

    public int getUptime() {
        return uptime;
    }

    public void setUptime(int uptime) {
        this.uptime = uptime;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getDriver_url() {
        return driver_url;
    }

    public void setDriver_url(String driver_url) {
        this.driver_url = driver_url;
    }

    public String getDeploy_mode() {
        return deploy_mode;
    }

    public void setDeploy_mode(String deploy_mode) {
        this.deploy_mode = deploy_mode;
    }

    public String getDeploy_manager() {
        return deploy_manager;
    }

    public void setDeploy_manager(String deploy_manager) {
        this.deploy_manager = deploy_manager;
    }

    public String getDeploy_descriptor() {
        return deploy_descriptor;
    }

    public void setDeploy_descriptor(String deploy_descriptor) {
        this.deploy_descriptor = deploy_descriptor;
    }

    public String getService_url() {
        return service_url;
    }

    public void setService_url(String service_url) {
        this.service_url = service_url;
    }

    public String getResult_ref() {
        return result_ref;
    }

    public void setResult_ref(String result_ref) {
        this.result_ref = result_ref;
    }

    public String getProgress_ref() {
        return progress_ref;
    }

    public void setProgress_ref(String progress_ref) {
        this.progress_ref = progress_ref;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
    
    
}
