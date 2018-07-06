package com.clustering.project.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.sql.DATE;

@Component
public class FileUtil {
		@Autowired
		private CommonUtil commonUtil;
		
		public String getNewFileName(String originalFilename) {
			
			String multiFileName = commonUtil.getUniqueSequence() + "_" + originalFilename;
			
			return multiFileName;
		}
		
		public List<Object> setMultipartList(MultipartHttpServletRequest multipartRequest){
			List<Object> fileList = new ArrayList<Object>();
			Iterator<String> multiFileList = multipartRequest.getFileNames();
			while (multiFileList.hasNext()) {
				Map<Object, Object> fileMap = new HashMap<Object, Object>();
				String fileName = multiFileList.next();
				
				MultipartFile multiFile = multipartRequest.getFile(fileName);
				String multiFileName = getNewFileName(multiFile.getOriginalFilename());
				String attachFileName = "C:\\Users\\student\\git\\Lecture\\src\\main\\webapp\\resources\\uploads\\" + multiFileName;
				String fileSize = multiFile.getSize() + ""; // 1KByte -> 1048)
				String fileContentType = multiFile.getContentType(); // jpg ->images/JPEG
				
				if(!multiFile.getOriginalFilename().equals("")) {
					try { // DB information
						multiFile.transferTo(new File(attachFileName));
						String seq = commonUtil.getUniqueSequence();
						fileMap.put("ATTACHFILE_SEQ", seq);
						fileMap.put("PHYSICALFILE_NAME", multiFileName);
						fileMap.put("ORIGINALFILE_NAME", multiFile.getOriginalFilename());
						fileMap.put("ATTACHFILE_SIZE", fileSize);
						fileMap.put("ATTACHFILE_TYPE", fileContentType);
						fileMap.put("ATTACHFILE_PATH", attachFileName);

						fileList.add(fileMap);
					} catch (Exception e) {
						File file = new File(attachFileName); file.delete(); e.printStackTrace();
					}
				}
			}
			return fileList;
		}
}
