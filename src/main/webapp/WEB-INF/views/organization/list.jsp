<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function(){
		$("#layerModal").click(function(){
			$("#myModal").modal();
		});
	});
</script>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">${paramMap.PARENT_COMMON_CODE_ID} List</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Advanced Tables
                        </div>
                        <button id = "layerModal">Demo Modal</button>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
											<th><input type="checkbox" id="selecctall" /></th>
                                            <th>ORGANIZATION_SEQ</th>
                                            <th>NAME</th>
                                            <th>TELEPHONE</th>
                                            <th>ORDER_NUMBER</th>
                                            <th>Update</th>
                                            <th>Parent List</th>
                                            <th>Child List</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach items="${resultList}" var="resultData" varStatus="loop">
	                                        <tr class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">
												<td><input type="checkbox" class="checkbox" name="ORGANIZATION_SEQ" value="${resultData.ORGANIZATION_SEQ}" /></td>
												<td>
													<a href="<c:url value="/organization/read?ORGANIZATION_SEQ=${resultData.ORGANIZATION_SEQ}" />">
													${resultData.ORGANIZATION_SEQ}</a>
												</td>
												<td>${resultData.NAME}</td>
												<td>${resultData.TELEPHONE}</td>
												<td>${resultData.ORDER_NUMBER}</td>
												<td>
													<a href="<c:url value="/organization/update?ORGANIZATION_SEQ=${resultData.ORGANIZATION_SEQ}&forwardView=/organization/edit" />">
													Update</a>
												</td>
												<td>
													<a href="<c:url value="/organization/list?ORGANIZATION_SEQ=${resultData.PARENT_ORGANIZATION_SEQ}" />">
													Parent(${resultData.PARENT_ORGANIZATION_SEQ})</a>
												</td>
												<td>
													<a href="<c:url value="/organization/list?PARENT_ORGANIZATION_SEQ=${resultData.ORGANIZATION_SEQ}" />">
													Child (${resultData.NAME})</a>
												</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
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
        
        <div class = "modal fade" id = "myModal">
        	<div class = "modal-dialog">
        		<div class = "modal-content">
        			<div class = "modal-header">
        				<button type = "button" class = "close" data-dismiss = "modal">x</button>
        				<h4 class = "modal-title" id = "myModalLabel">Modal title</h4>	
        			</div>
        			<div class = "modal-body">
        				sioduvhsdv;sdjvnvsd;sa;nvsjvnsvsajvn;slvkjnslvsn;ldvnsvnsjnvsn;asnvs;vvwbvsuvbsvjasvs;vsjvnas;vjlsnv;svjsnvslajknvls
        			</div>
        			<div class = "modal-footer">
        				<button type = "button" class = "btn btn-primary">Save changes</button>
        				<button type = "button" data-dismiss = "modal">Close</button>
        			</div>
        		</div>
        	</div>
        </div>
