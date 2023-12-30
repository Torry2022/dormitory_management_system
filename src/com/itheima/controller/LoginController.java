package com.itheima.controller;

import com.itheima.po.Admin;
import com.itheima.po.Student;
import com.itheima.service.AdminService;
import com.itheima.service.StudentService;
import com.itheima.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

@Controller
public class LoginController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private StudentService studentService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login")
    public String login(@RequestParam String username, @RequestParam String password, @RequestParam String role, Model model, HttpSession session, HttpServletRequest request) throws NoSuchAlgorithmException {
        //空参
        if (username == null) return "login";
        //账号或密码为空
        if (username.isEmpty() && password.isEmpty()) {
            model.addAttribute("msg", "请输入用户名及密码！");
            return "login";
        } else if (password.isEmpty()) {
            model.addAttribute("msg", "请输入密码！");
            return "login";
        } else if (username.isEmpty()){
            model.addAttribute("msg", "请输入用户名！");
            return "login";
        }

        if ("身份".equals(role)) {
            model.addAttribute("msg", "请选择登录身份");
            return "login";
        } else if ("学生".equals(role)) {
            Student student = new Student();
            if (!username.matches("\\d+")) model.addAttribute("msg", "请输入正确格式的学号！");
            student.setS_studentid(Integer.valueOf(username));
            student.setS_password(MD5Util.MD5EncodeUtf8(password));
            Student s = studentService.findStudent(student);
            if (s != null) {
                session.setAttribute("s", s);
                return "homepage_student";
            }
        } else if ("管理员".equals(role)) {
            //通过账号和密码查询用户
            Admin admin = new Admin();
            admin.setA_username(username);
            admin.setA_password(MD5Util.MD5EncodeUtf8(password));
            Admin ad = adminService.findAdmin(admin);
            if (ad != null) {
                session.setAttribute("ad", ad);
                return "homepage_admin";
            }
        }
            
        //登录失败
        model.addAttribute("msg", "用户名或密码错误，请重新登录！");
        return "login";
    }

    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }
}
