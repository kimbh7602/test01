package com.clustering.project.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clustering.project.dao.ShareDao;

@Service
public class AuthorityService {

	@Autowired
	private ShareDao dao;
	
	public Object getList(Object dataMap) {
		String sqlMapId = "authority.list";
		
		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}
	
	public Object getMemberList(Object dataMap) {
		String sqlMapId = "authorityMember.list";
		
		Object resultObject = dao.getList(sqlMapId, dataMap);

		return resultObject;
	}
}
