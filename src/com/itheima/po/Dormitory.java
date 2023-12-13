package com.itheima.po;

import java.io.Serializable;
import java.util.List;

public class Dormitory {
    private Integer d_id;
    private Integer d_dormitoryid;
    private String d_dormbuilding;
    private Integer d_bedtotal;
    private Integer d_bed;
    private String a_name;
    private List<Student> students;

    public Integer getD_id() {
        return d_id;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

    public Integer getD_dormitoryid() {
        return d_dormitoryid;
    }

    public void setD_dormitoryid(Integer d_dormitoryid) {
        this.d_dormitoryid = d_dormitoryid;
    }

    public String getD_dormbuilding() {
        return d_dormbuilding;
    }

    public void setD_dormbuilding(String d_dormbuilding) {
        this.d_dormbuilding = d_dormbuilding;
    }

    public Integer getD_bedtotal() {
        return d_bedtotal;
    }

    public void setD_bedtotal(Integer d_bedtotal) {
        this.d_bedtotal = d_bedtotal;
    }

    public Integer getD_bed() {
        return d_bed;
    }

    public void setD_bed(Integer d_bed) {
        this.d_bed = d_bed;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}
