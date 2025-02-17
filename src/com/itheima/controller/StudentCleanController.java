package com.itheima.controller;

import com.itheima.po.PageInfo;
import com.itheima.po.StudentClean;
import com.itheima.service.StudentCleanService;
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
public class StudentCleanController {
    @Autowired
    private StudentCleanService studentCleanService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findStudentClean")
    public String findDormClean(Integer s_studentid, Integer pageIndex, Integer pageSize, Model model) {
        pageSize = 15;
        PageInfo<StudentClean> di = studentCleanService.findPageInfo(s_studentid, pageIndex, pageSize);
        model.addAttribute("di", di);
        return "studentclean_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportStudentCleanList", method = RequestMethod.POST)
    @ResponseBody
    public List<StudentClean> exportStudentClean() {
        return studentCleanService.getAll();
    }

    /**
     * 添加宿舍卫生信息
     */
    @RequestMapping(value = "/addStudentClean", method = RequestMethod.POST)
    @ResponseBody
    public String addDormClean(@RequestBody StudentClean studentclean) {
        studentCleanService.addStudentClean(studentclean);
        return "studentclean_list";
    }

    /**
     * 删除宿舍卫生信息
     */
    @RequestMapping("/deleteStudentClean")
    @ResponseBody
    public String deleteDormClean(Integer g_id) {
        studentCleanService.deleteStudentClean(g_id);
        return "studentclean_list";
    }

    /**
     * 修改宿舍卫生信息
     */
    @RequestMapping("/updateStudentClean")
    public String updateDormClean(StudentClean studentclean) {
        studentCleanService.updateStudentClean(studentclean);
        return "redirect:/findStudentClean";
    }

    @RequestMapping("/findStudentCleanById")
    public String findDormCleanById(Integer g_id, HttpSession session) {
        StudentClean d = studentCleanService.findStudentCleanById(g_id);
        session.setAttribute("d", d);
        return "studentclean_edit";
    }
}
