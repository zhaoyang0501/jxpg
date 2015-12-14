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

import com.pzy.entity.Result;
import com.pzy.entity.ResultDetail;
import com.pzy.entity.Teacher;
import com.pzy.service.LessonService;
import com.pzy.service.MajorService;
import com.pzy.service.ResultService;
import com.pzy.service.TeacherService;


/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/userreport")
public class UserReportController {
	@Autowired
	private ResultService mytestService;
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
		return "admin/userreport/index";
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
		Page<Result> mytests = mytestService.findAll(pageNumber, pageSize, name);
		for(Result r:mytests.getContent()){
			Integer score=0;
			for(ResultDetail d:r.getDetails()){
				score+=d.getScore();
			}
			r.setTotalScore(score);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", mytests.getContent());
		map.put("iTotalRecords", mytests.getTotalElements());
		map.put("iTotalDisplayRecords", mytests.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
	@RequestMapping(value = "/get/{id}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable Long id ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("object", mytestService.find(id));
		map.put("state", "success");
		map.put("msg", "成功");
		return map;
	}
}
