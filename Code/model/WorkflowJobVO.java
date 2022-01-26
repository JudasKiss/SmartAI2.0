package smartView.ai.project.model;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class WorkflowJobVO implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = -4981715381828036131L;

    
    private String id;
    
    private String name;
    
    private int version;
    
    private String project;
    
    private String owner;
    
    private String creation_time;
    
    private String modification_time;
    
    private boolean is_active;
    
    private String start_time;
    
    private String end_time;
    
    private String is_batch;
    
    private String ksb_version;
    
    private String msg_version;
    
    private String app_name;
    
    private String schedule_period;
    
    private String schedule_start;
    
    private String schedule_end;
    
    private boolean is_verbose;
    
    private String client_type;

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

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getCreation_time() {
        return creation_time;
    }

    public void setCreation_time(String creation_time) {
        this.creation_time = creation_time;
    }

    public String getModification_time() {
        return modification_time;
    }

    public void setModification_time(String modification_time) {
        this.modification_time = modification_time;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
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

    public String getIs_batch() {
        return is_batch;
    }

    public void setIs_batch(String is_batch) {
        this.is_batch = is_batch;
    }

    public String getKsb_version() {
        return ksb_version;
    }

    public void setKsb_version(String ksb_version) {
        this.ksb_version = ksb_version;
    }

    public String getMsg_version() {
        return msg_version;
    }

    public void setMsg_version(String msg_version) {
        this.msg_version = msg_version;
    }

    public String getApp_name() {
        return app_name;
    }

    public void setApp_name(String app_name) {
        this.app_name = app_name;
    }

    public String getSchedule_period() {
        return schedule_period;
    }

    public void setSchedule_period(String schedule_period) {
        this.schedule_period = schedule_period;
    }

    public String getSchedule_start() {
        return schedule_start;
    }

    public void setSchedule_start(String schedule_start) {
        this.schedule_start = schedule_start;
    }

    public String getSchedule_end() {
        return schedule_end;
    }

    public void setSchedule_end(String schedule_end) {
        this.schedule_end = schedule_end;
    }

    public boolean isIs_verbose() {
        return is_verbose;
    }

    public void setIs_verbose(boolean is_verbose) {
        this.is_verbose = is_verbose;
    }

    public String getClient_type() {
        return client_type;
    }

    public void setClient_type(String client_type) {
        this.client_type = client_type;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
    
    
    
}
