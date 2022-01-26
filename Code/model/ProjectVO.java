package smartView.ai.project.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;

public class ProjectVO implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 9210595625144826604L;
    
    private String user_id;
    
    private String uuid;
    
    private String name;
    
    private String descr;
    
    private BigInteger timestamp;
    
    private int flowcount;
    
    private int rptcount;
    
    private String tags;
    
    private int tag_seq;

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

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public BigInteger getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(BigInteger timestamp) {
        this.timestamp = timestamp;
    }
    
    public int getFlowcount() {
        return flowcount;
    }

    public void setFlowcount(int flowcount) {
        this.flowcount = flowcount;
    }

    public int getRptcount() {
        return rptcount;
    }

    public void setRptcount(int rptcount) {
        this.rptcount = rptcount;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }
    
    

    public int getTag_seq() {
        return tag_seq;
    }

    public void setTag_seq(int tag_seq) {
        this.tag_seq = tag_seq;
    }


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
    
    
}
