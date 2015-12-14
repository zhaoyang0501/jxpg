package com.pzy.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.Teacher;
import com.pzy.entity.TeacherFile;
import com.pzy.service.LessonService;
import com.pzy.service.MajorService;
import com.pzy.service.TeacherFileService;
import com.pzy.service.TeacherService;


/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/teacherfile")
public class TeacherFileController {
	@Autowired
	private TeacherFileService teacherfileService;
	@Autowired
	private LessonService lessonService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private MajorService majorService;
	@InitBinder  
	protected void initBinder(HttpServletRequest request,  
	            ServletRequestDataBinder binder) throws Exception {   
	      binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"), true));  
	}  
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("lessons", lessonService.findAll());
		model.addAttribute("majors", majorService.findAll());
		model.addAttribute("teachers", teacherService.findAll());
		return "admin/teacherfile/index";
	}
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			HttpSession httpSession,
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, String name
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<TeacherFile> teacherfiles = teacherfileService.findAll(pageNumber, pageSize, name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", teacherfiles.getContent());
		map.put("iTotalRecords", teacherfiles.getTotalElements());
		map.put("iTotalDisplayRecords", teacherfiles.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
	@RequestMapping(value = "/get/{id}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable Long id ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("object", teacherfileService.find(id));
		map.put("state", "success");
		map.put("msg", "成功");
		return map;
	}
	@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(TeacherFile teacher) {
		TeacherFile bean=teacherfileService.find(teacher.getId());
		bean.setNum1(teacher.getNum1());
		bean.setNum2(teacher.getNum2());
		bean.setNum3(teacher.getNum3());
		bean.setNum4(teacher.getNum4());
		bean.setNum5(teacher.getNum5());
		bean.setNum6(teacher.getNum6());
		bean.setNum7(teacher.getNum7());
		bean.setNum8(teacher.getNum8());
		bean.setNum9(teacher.getNum9());
		bean.setNum10(teacher.getNum10());
		bean.setNum11(teacher.getNum11());
		bean.setNum12(teacher.getNum12());
		bean.setNum13(teacher.getNum13());
		bean.setNum14(teacher.getNum14());
		bean.setTotal(bean.getNum1()+bean.getNum2()+bean.getNum3()+bean.getNum4()+
				bean.getNum5()+bean.getNum6()+bean.getNum7()+bean.getNum8()+
				bean.getNum9()+bean.getNum10()+bean.getNum11()+bean.getNum12()+bean.getNum13()+bean.getNum14());
		teacherfileService.save(bean);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", "success");
		map.put("msg", "保存成功");
		return map;
	}
}
