package com.pzy.controller;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.User;
import com.pzy.entity.Major;
import com.pzy.service.MajorService;
import com.pzy.service.UserService;
/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/userreportcount")
public class UserReportCountController {
	@Autowired
	private UserService userService;
	@Autowired
	private MajorService majorService;
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("majors", majorService.findAll());
		return "admin/userreportcount/index";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, String username,
			Long majorid
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Major major=null;
		if(majorid!=null)
			 major=majorService.find(majorid);
		
		Page<User> users = userService.findAllCount(pageNumber, pageSize, username,major);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", users.getContent());
		map.put("iTotalRecords", users.getTotalElements());
		map.put("iTotalDisplayRecords", users.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
	
}
