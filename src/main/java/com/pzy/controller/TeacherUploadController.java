package com.pzy.controller;
import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pzy.entity.Teacher;
import com.pzy.entity.TeacherFile;
import com.pzy.service.TeacherFileService;
@Controller
@RequestMapping("/admin/teacherupload")
public class TeacherUploadController {
	@Autowired
	TeacherFileService teacherFileService;
	@RequestMapping("index")
	public String index(Model model) {
		return "admin/teacherupload/index";
	}
	
	@RequestMapping(value={"doupload"},method=RequestMethod.POST)
	public String teacherupload(String year,@RequestParam("filename") MultipartFile file, HttpServletRequest request,Model model,HttpSession httpSession ) throws IOException{
		 if (!file.isEmpty()) {  
		        String fileName = file.getOriginalFilename();  
		        String tomcatPath =  request.getSession().getServletContext().getRealPath("/upload"); 
		       FileCopyUtils.copy(file.getBytes(), new File(tomcatPath +"/" +  fileName));//FileCopyUtils来自org.springframework.util.FileCopyUtils  
		 }  
		 Teacher teacher=(Teacher)httpSession.getAttribute("adminuser");
		 TeacherFile teacherFile=new TeacherFile();
		 teacherFile.setFilename( file.getOriginalFilename());
		 teacherFile.setCreateDate(new Date());
		 teacherFile.setTeacher(teacher);
		 teacherFile.setYear(year);
		 teacherFileService.save(teacherFile);
		 
		 model.addAttribute("tip", "上传成功！");
		 return "admin/teacherupload/index";
	}
}