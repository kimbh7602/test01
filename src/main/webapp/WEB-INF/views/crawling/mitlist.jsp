<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<table>
	<c:forEach items="${resultList}" var="resultData" varStatus="loop">
		<tr>
			<td><a href="${resultData}" target="_blank">${resultData}</a></td>
		</tr>
	</c:forEach>
	</table>
