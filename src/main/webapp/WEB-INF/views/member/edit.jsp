

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script>
var fn_setFormTagSelect = function(url, id, params){
	$.ajax({
		type : "POST", url : url, data : params, cache : false,
		success : function(data){
			var formTag = "";
			formTag += "<select class = 'form-control' name = 'ORGANIZATION_SEQ'>";
			$.each(data, function(i, item){
				formTag += '<option value = "'+item.ORGANIZATION_SEQ+'">' + item.NAME;
			});
			formTag +='</select>';
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
	fn_setFormTagSelect("<c:url value = '/ws/organizationList'/>", "organizationDIV");
});


</script> -->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Edit</h1>
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
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form enctype="multipart/form-data" role="form" method="POST" action="<c:url value='/member/merge' />">
	                                    <input type="hidden" name="forwardView" value="/member/read" />
	                                    <input type="hidden" name="MEMBER_SEQ" value="${resultMap.MEMBER_SEQ }" />
	                                    <input type="hidden" name="ORGANIZATION_SEQ" value="UUID-11-CIPI9M" />
                                        <div class="form-group">
                                            <label>MEMBER_ID Text Input </label>
                                            <input class="form-control" type="text" name="MEMBER_ID" value="${resultMap.MEMBER_ID }">
                                        </div>
                                        <div class="form-group">
                                            <label>Member PASSWORD Text Input </label>
                                            <input class="form-control" type="password" name="PASSWORD" value="${resultMap.PASSWORD }">
                                        </div>
                                        <div class="form-group">
                                            <label>Member Name Text Input </label>
                                            <input class="form-control" type="text" name="NAME" value="${resultMap.NAME }">
                                        </div>
                                        <div class="form-group">
                                            <label>EMAIL Text Input with Placeholder </label>
                                            <input class="form-control" type="text" name="EMAIL" placeholder="incubator@clustringincubation.com" value="${resultMap.EMAIL }">
                                            <p class="help-block">Base form incubator@clustringincubation.com</p>
                                        </div>
                                        <div class="form-group">
                                            <label>CELLPHONE Text Input with Placeholder </label>
                                            <input class="form-control" type="text" name="CELLPHONE" placeholder="000-0000-0000" value="${resultMap.CELLPHONE }">
                                            <p class="help-block">Base form 000-0000-0000</p>
                                        </div>
                                        <!-- <label>Organization Selects</label>
                                        <div id="organizationDIV"></div> -->
                                        <div class="form-group">
                                        	<label>Choose Authority </label>
	                                        <input type="checkbox" name="AUTHORITY_ID" value="ROLE_ADMIN"/>ADMIN
	                                        <input type="checkbox" name="AUTHORITY_ID" value="ROLE_MANAGER"/>SYSTEM_MANAGER
	                                        <input type="checkbox" name="AUTHORITY_ID" value="ROLE_USER"/>USER
	                                        <input type="checkbox" name="AUTHORITY_ID" value="ROLE_GUEST"/>GUEST
                                        </div>
                                        <div class="form-group">
                                        	<label>Multipart File Upload </label>
	                                        <input type="file" name="ATTACHFILE">
	                                        <input type="file" name="ATTACHFILE02">
                                        </div>
                                        <button type="submit" class="btn btn-default">${paramMap.action == 'update' ? 'Update' : 'Insert' } Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                    </form>
                                </div>
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
