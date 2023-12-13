package com.itheima.controller;

import com.itheima.po.DormRepair;
import com.itheima.po.Dormitory;
import com.itheima.po.PageInfo;
import com.itheima.service.DormRepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DormRepairController {
    @Autowired
    private DormRepairService dormRepairService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findDormRepair")
    public String findDormRepair(Integer d_dormitoryid, String d_dormbuilding,
                                 Integer pageIndex, Integer pageSize, Model model) {
        pageSize = 15;
        PageInfo<DormRepair> di = dormRepairService.findPageInfo(d_dormitoryid, d_dormbuilding,
                pageIndex, pageSize);
        model.addAttribute("di", di);
        return "dormrepair_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportDormRepairList", method = RequestMethod.POST)
    @ResponseBody
    public List<DormRepair> exportDormRepair() {
        return dormRepairService.getAll();
    }

    /**
     * 添加宿舍信息
     */
    @RequestMapping(value = "/addDormRepair", method = RequestMethod.POST)
    @ResponseBody
    public String addDormitory(@RequestBody DormRepair dormrepair) {
        dormRepairService.addDormRepair(dormrepair);
        return "dormrepair_list";
    }

    /**
     * 删除宿舍信息
     */
    @RequestMapping("/deleteDormRepair")
    @ResponseBody
    public String deleteDormRepair(Integer r_id) {
        dormRepairService.deleteDormRepair(r_id);
        return "dormrepair_list";
    }

    /**
     * 修改学生信息
     */
    @RequestMapping("/updateDormRepair")
    public String updateDormRepair(DormRepair dormrepair) {
        dormRepairService.updateDormRepair(dormrepair);
        return "redirect:/findDormRepair";
    }

    @RequestMapping("/findDormRepairById")
    public String findDormRepairById(Integer r_id, HttpSession session) {
        DormRepair d = dormRepairService.findDormRepairById(r_id);
        session.setAttribute("d", d);
        return "dormrepair_edit";
    }
}

