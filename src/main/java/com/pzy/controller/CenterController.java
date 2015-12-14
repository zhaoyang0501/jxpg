package com.pzy.controller;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.Teacher;
import com.pzy.service.TeacherService;
/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/center")
public class CenterController {
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping("index")
	public String index() {
		return "admin/center/index";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(Teacher teacher) {
		teacher.setCreateDate(new Date());
		teacherService.save(teacher);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", "success");
		map.put("msg", "保存成功");
		return map;
	}
	@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(Teacher teacher) {
		teacherService.save(teacher);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", "success");
		map.put("msg", "保存成功");
		return map;
	}
	
}
