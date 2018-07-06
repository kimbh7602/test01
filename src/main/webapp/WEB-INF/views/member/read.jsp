<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script>
var fn_setFormTagSelect = function(url, id, params){
	$.ajax({
		type : "POST", url : url, data : {MEMBER_SEQ : params}, cache : false,
		success : function(data){
			var formTag = "";
			formTag += "";
			$.each(data, function(i, item){
				formTag += '<input type = checkbox name = "AUTHORITY_ID" value = "'+item.AUTHORITY_ID+'"/>'+ item.AUTHORITY_ID +', ' + item.MEMBER_SEQ;
			});
			formTag +='';
			$('#'+id).html(formTag);
			console.log(data);
			
		},
		error : function(xhr, status, exception){
			alert("Failure \n("+status+") \n("+exception+") \n("+xhr+")");
			return false;
		}
	});
}

$(function(){
	fn_setFormTagSelect("<c:url value = '/ws/memberAuthorityList'/>", "authorityDIV", "${resultMap.MEMBER_SEQ}");
});
</script> -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Form Elements
                        </div>
                        <img src = "<c:url value = '/resources/uploads/dumpling.jpg'/>" height = "100px" width = "140px"/>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="POST" action="<c:url value='/member/edit' />">
	                                    <div class="form-group">
											<label>MEMBER_ID Static Control</label>
											<p class="form-control-static">${resultMap.MEMBER_ID}</p>
	                                    </div>
	                                    <div class="form-group">
											<label>PASSWORD Static Control</label>
											<p class="form-control-static">${resultMap.PASSWORD}</p>
	                                    </div>
	                                    <div class="form-group">
											<label>NAME Static Control</label>
											<p class="form-control-static">${resultMap.NAME}</p>
	                                    </div>
	                                    <div class="form-group">
											<label>EMAIL Static Control</label>
											<p class="form-control-static">${resultMap.EMAIL}</p>
	                                    </div>
	                                    <div class="form-group">
											<label>CELLPHONE Static Control</label>
											<p class="form-control-static">${resultMap.CELLPHONE}</p>
	                                    </div>
	                                    <!-- <label>Authority List</label>
                                        <div id="authorityDIV"></div> -->
                                        <div class="form-group">
                                        	<label>Choose Authority </label>
	                                        <c:forEach items="${resultMap.authorityList}" var="resultData" varStatus="loop">
	                                        <br>
	                                        <label>${resultData.AUTHORITY_ID }</label>
	                                        </c:forEach>
                                        </div>
                                        <div class="form-group">
                                        	<label>Multipart File Upload </label>
	                                        <c:forEach items="${resultMap.attachFileList}" var="resultData02" varStatus="loop">
	                                        <br><img height="200px" width="300px" src = "<c:url value = '/resources/uploads/${resultData02.PHYSICALFILE_NAME}'/>"/>
	                                        <br><label>${resultData02.ORGINALFILE_NAME }</label>
	                                        </c:forEach>
                                        </div>
                                        <button type="submit" class="btn btn-default">Add Button</button>
										<a href="<c:url value='/member/list' />">Add With a Tag</a>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    <div class="form-group">
										<label>MEMBER_SEQ Static Control</label>
										<p class="form-control-static">${resultMap.MEMBER_SEQ}</p>
                                    </div>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
