package com.clustering.project.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clustering.project.dao.ShareDao;
import com.clustering.project.util.CommonUtil;

@Service
public class MemberService {

	@Autowired
	private ShareDao dao;
	
	@Autowired
	private CommonUtil commonUtil;

	public Object getList(Object dataMap) {
		String sqlMapId = "member.list";

		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}

	public Object getObject(Object dataMap) {
		String sqlMapId = "member.read";

		Map resultObject = (Map)dao.getObject(sqlMapId, dataMap);
		
		sqlMapId = "authorityRmember.read";
		
		Object authorityList = dao.getList(sqlMapId, dataMap);
		
		resultObject.put("authorityList", authorityList);
		
		sqlMapId = "member.fileRead";
		
		Object attachFileList = dao.getList(sqlMapId, dataMap);
		
		resultObject.put("attachFileList", attachFileList);
		
		return resultObject;
	}

	public Object saveObject(Object dataMap) {
		String uniqueSequence = (String) ((Map)dataMap).get("MEMBER_SEQ");
		
		if("".equals(uniqueSequence) || uniqueSequence == null){
			uniqueSequence = commonUtil.getUniqueSequence();
		}
		((Map)dataMap).put("MEMBER_SEQ", uniqueSequence);
		((Map)dataMap).put("REGISTER_SEQ", "UUID-1111-1111111");
		((Map)dataMap).put("MODIFIER_SEQ", "UUID-1111-1111111");
		((Map)dataMap).put("ORGANIZATION_SEQ", "UUID-11-CIP7");
		
		String sqlMapId = "member.merge";

		Object resultKey = dao.saveObject(sqlMapId, dataMap);
		
		sqlMapId = "authorityRmember.insert";
		
		resultKey = dao.saveObject(sqlMapId, dataMap);
		
		if(((Map)dataMap).get("attachFileList") != null) {
			sqlMapId = "member.upload";
		
			dao.saveObject(sqlMapId, dataMap);
		}
		sqlMapId = "member.read";
		
		Object resultObject = dao.getObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object deleteObject(Object dataMap) {
		// delete child record authority
		String sqlMapId = "authorityRmember.delete";

		Integer resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);

		// delete Mother record authority
		sqlMapId = "member.delete";

		resultKey = (Integer) dao.deleteObject(sqlMapId, dataMap);

		// get Member List
		sqlMapId = "member.list";
		
		Object resultObject = dao.getList(sqlMapId, dataMap);
		
		return resultObject;
	}
}
