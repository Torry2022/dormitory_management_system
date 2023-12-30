package com.itheima.controller;


import com.itheima.po.Admin;
import com.itheima.po.PageInfo;
import com.itheima.service.AdminService;
import com.itheima.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    /**
     * 分页查询
     */
    @RequestMapping(value = "/findAdmin")
    public String findAdmin(String a_username, String a_describe, Integer pageIndex,
                            Integer a_id, Integer pageSize, Model model) {
        pageSize = 15;
        PageInfo<Admin> ai = adminService.findPageInfo(a_username, a_describe,
                a_id, pageIndex, pageSize);
        model.addAttribute("ai", ai);
        return "admin_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportAdminList", method = RequestMethod.POST)
    @ResponseBody
    public List<Admin> exportAdmin() {
        return adminService.getAll();
    }

    /**
     * 添加管理员信息
     */
    @RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
    @ResponseBody
    public String addAdmin(@RequestBody Admin admin) throws NoSuchAlgorithmException {
        admin.setA_password(MD5Util.MD5EncodeUtf8(admin.getA_password()));
        adminService.addAdmin(admin);
        return "admin_list";
    }

    /**
     * 删除管理员信息；将请求体a_id写入参数a_id
     */
    @RequestMapping("/deleteAdmin")
    @ResponseBody
    public Boolean deleteAdmin(Integer a_id) {
        adminService.deleteAdmin(a_id);
        return true;
    }

    /**
     * 修改管理员信息
     * 将提交数据(a_id,a_username...)写入Admin对象
     */
    @RequestMapping(value = "/updateAdmin", method = RequestMethod.POST)
    public String updateAdmin(Admin admin) throws NoSuchAlgorithmException {
        if (isModifiedPwd(admin.getA_id(), admin.getA_password())) {
            admin.setA_password(MD5Util.MD5EncodeUtf8(admin.getA_password()));
        } else {
            admin.setA_password(admin.getA_password());
        }
        adminService.updateAdmin(admin);
        return "redirect:/findAdmin";
    }

    /**
     * 根据管理员id搜索;将请求数据a_id写入参数a_id
     */
    @RequestMapping("/findAdminById")
    public String findAdminById(Integer a_id, HttpSession session) {
        Admin a = adminService.findAdminById(a_id);
        session.setAttribute("a", a);
        return "admin_edit";
    }

    /**
     * 根据管理员id和密码搜索,以此判断密码是否被修改
     */
    private Boolean isModifiedPwd(Integer a_id, String a_password) {
        Admin a = adminService.findAdminByIdAndPwd(a_id, a_password);
        return a == null;
    }
}
