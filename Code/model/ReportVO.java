package smartView.ai.project.model;

import java.io.Serializable;
import java.math.BigInteger;

import org.apache.commons.lang.builder.ToStringBuilder;

public class ReportVO implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = -5414766943054281426L;
    
    
    private int report_seq;
    
    private String title;

    private String description;
    
    private String use_yn;
    
    private int reg_seq;
    
    private String reg_id;
    
    private String reg_dt;
    
    private int upd_seq;
    
    private String upd_id;
    
    private String upd_dt;
    
    private String pid;
    
    private String name;
    
    private BigInteger timestamp;
    
    private String check;
    
    private String id;

    
    public int getReport_seq() {
        return report_seq;
    }

    public void setReport_seq(int report_seq) {
        this.report_seq = report_seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUse_yn() {
        return use_yn;
    }

    public void setUse_yn(String use_yn) {
        this.use_yn = use_yn;
    }

    public int getReg_seq() {
        return reg_seq;
    }

    public void setReg_seq(int reg_seq) {
        this.reg_seq = reg_seq;
    }

    public String getReg_id() {
        return reg_id;
    }

    public void setReg_id(String reg_id) {
        this.reg_id = reg_id;
    }

    public String getReg_dt() {
        return reg_dt;
    }

    public void setReg_dt(String reg_dt) {
        this.reg_dt = reg_dt;
    }

    public int getUpd_seq() {
        return upd_seq;
    }

    public void setUpd_seq(int upd_seq) {
        this.upd_seq = upd_seq;
    }

    public String getUpd_id() {
        return upd_id;
    }

    public void setUpd_id(String upd_id) {
        this.upd_id = upd_id;
    }

    public String getUpd_dt() {
        return upd_dt;
    }

    public void setUpd_dt(String upd_dt) {
        this.upd_dt = upd_dt;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigInteger getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(BigInteger timestamp) {
        this.timestamp = timestamp;
    }
     
    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
    
}
