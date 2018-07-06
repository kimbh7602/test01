package com.clustering.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.clustering.project.service.AuthorityService;
import com.clustering.project.service.OrganizationService;

@RestController
public class RestWSController {
	
	@Autowired
	private OrganizationService organizationService;
	@Autowired
	private AuthorityService authorityService;
	
	@RequestMapping(value = "/ws/{action}", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	public Object actionMethod(@RequestParam Map<String, Object> paramMap, @PathVariable String action) {
		Object resultObject = new Object();
		
		if("organizationList".equals(action)) {
			resultObject = (List<Object>)organizationService.getList(paramMap);
		}else if("authorityList".equals(action)) {
			resultObject = (List<Object>)authorityService.getList(paramMap);
		}else if("memberAuthorityList".equals(action)) {
			resultObject = (List<Object>)authorityService.getMemberList(paramMap);
		}
		
		return resultObject;
	}
}
