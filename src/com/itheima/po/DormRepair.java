package com.itheima.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class DormRepair {
    private int r_id;
    private int d_dormitoryid;
    private String d_dormbuilding;
    private String r_name;
    private String reason;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date create_time;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date update_time;

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public int getD_dormitoryid() {
        return d_dormitoryid;
    }

    public void setD_id(int d_dormitoryid) {
        this.d_dormitoryid = d_dormitoryid;
    }

    public String getD_dormbuilding() {
        return d_dormbuilding;
    }

    public void setD_dormbuilding(String d_dormbuilding) {
        this.d_dormbuilding = d_dormbuilding;
    }

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}

