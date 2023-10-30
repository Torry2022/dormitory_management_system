package com.itheima.service;

import com.itheima.po.PageInfo;
import com.itheima.po.Visitor;

import java.util.List;

public interface VisitorService {
    //分页查询
    PageInfo<Visitor> findPageInfo(String v_name, Integer v_phone, Integer pageIndex, Integer pageSize);

    //添加访客信息
    void addVisitor(Visitor visitor);

    List<Visitor> getAll();
}
