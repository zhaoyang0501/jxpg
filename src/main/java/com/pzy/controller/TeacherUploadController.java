package com.pzy.controller;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
@Controller
@RequestMapping("/admin/teacherupload")
public class TeacherUploadController {
	
	@RequestMapping("index")
	public String index(Model model) {
		return "admin/teacherupload/index";
	}
	
	@RequestMapping(value={"/teacherupload"},method=RequestMethod.POST)
	public String teacherupload(@RequestParam("filename") MultipartFile file, HttpServletRequest request ) throws IOException{
		 if (!file.isEmpty()) {  
		        String fileName = file.getOriginalFilename();  
		        String tomcatPath =  request.getSession().getServletContext().getRealPath("/upload"); 
		       FileCopyUtils.copy(file.getBytes(), new File(tomcatPath +"/" +  fileName));//FileCopyUtils来自org.springframework.util.FileCopyUtils  
		 }  
		return "";  
	}
}