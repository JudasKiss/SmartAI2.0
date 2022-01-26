package smartView.ai.project.model;

import java.io.Serializable;
import java.math.BigInteger;

import org.apache.commons.lang.builder.ToStringBuilder;

public class WorkflowVO implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 8680829842464883284L;

    private String user_id;
    
    private String uuid;

    private String name;

    private String data;
    
    private String descr;

    private String msg_version;
    
    private int is_batch;
    
    private int verbose;
    
    private BigInteger timestamp;
    
    private String pid;
    
    private String wid;
    
    private String workflowID;
    
    private String jobID;
    
    private String wfJobID;
    
    private String wfJobName;
    
    private boolean is_active;
    
    private String result;
    
    private String status;
    
    private String pname; //project name

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getMsg_version() {
        return msg_version;
    }

    public void setMsg_version(String msg_version) {
        this.msg_version = msg_version;
    }

    public int getIs_batch() {
        return is_batch;
    }

    public void setIs_batch(int is_batch) {
        this.is_batch = is_batch;
    }

    public int getVerbose() {
        return verbose;
    }

    public void setVerbose(int verbose) {
        this.verbose = verbose;
    }

    public BigInteger getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(BigInteger timestamp) {
        this.timestamp = timestamp;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getWid() {
        return wid;
    }

    public void setWid(String wid) {
        this.wid = wid;
    }
   
    public String getWorkflowID() {
        return workflowID;
    }

    public void setWorkflowID(String workflowID) {
        this.workflowID = workflowID;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    
    
    public String getWfJobID() {
        return wfJobID;
    }

    public void setWfJobID(String wfJobID) {
        this.wfJobID = wfJobID;
    }

    public String getWfJobName() {
        return wfJobName;
    }

    public void setWfJobName(String wfJobName) {
        this.wfJobName = wfJobName;
    }

    public boolean getIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPname() {
        return pname;
    }
    
    public void setPname(String pname) {
        this.pname = pname;
    }
    
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

    
    
    
}
