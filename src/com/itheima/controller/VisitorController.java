package com.itheima.controller;

import com.itheima.po.PageInfo;
import com.itheima.po.Visitor;
import com.itheima.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class VisitorController {
    @Autowired
    private VisitorService visitorService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findVisitor")
    public String findVisitor(String v_name, Integer v_phone, Integer pageIndex,
                              Integer pageSize, Model model) {
        pageSize = 15;
        PageInfo<Visitor> pi = visitorService.findPageInfo(v_name, v_phone,
                pageIndex, pageSize);
        model.addAttribute("pi", pi);
        model.addAttribute("v_name", v_name);
        return "visitor_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportVisitorList", method = RequestMethod.POST)
    @ResponseBody
    public List<Visitor> exportVisitor() {
        return visitorService.getAll();
    }

    /**
     * 添加学生信息
     */
    @RequestMapping(value = "/addVisitor", method = RequestMethod.POST)
    @ResponseBody
    public String addStudent(@RequestBody Visitor visitor) {
        visitorService.addVisitor(visitor);
        return "visitor_list";
    }
}
