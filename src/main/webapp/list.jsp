<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
	<div class="col-lg-offset-1 col-lg-9">
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="servlet/PageServlet"> <span
					class="glyphicon glyphicon-user"></span> 人员管理系统
				</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="manager/AddPerson.jsp" class="btn btn-default">
						<span class="glyphicon glyphicon-plus"></span>添加人员
				</a></li>
			</ul>
		</div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="info">
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty pageBean.pageData }">
						<c:forEach var="personEnity" items="${pageBean.pageData }"
							varStatus="vs">
							<tr>
								<td>${personEnity.id }</td>
								<td>${personEnity.userName }</td>
								<td>${personEnity.passWord }</td>
								<td>${personEnity.sex }</td>
								<td>${personEnity.email }</td>
								<td>${personEnity.phone }</td>
								<td align="center"><a
									href="manager/ViewPerson?id=${personEnity.id }"
									class="btn btn-success"> <span
										class="glyphicon glyphicon-zoom-in "></span>查看
								</a> <a href="manager/UpdatePerson.jsp?id=${personEnity.id }"
									class="btn btn-info"> <span
										class="glyphicon glyphicon-edit"></span>修改
								</a> <a href="manager/DeletePerson?id=${personEnity.id }"
									class="btn btn-danger" onclick="return confirm('您确定要删除吗？');">
										<span class="glyphicon glyphicon-trash"></span>删除
								</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" align="center">暂无数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7" align="center">共 ${pageBean.totalRecord }
						条纪录&nbsp;当前 ${pageBean.currentPage } / ${pageBean.totalPage }页&nbsp;&nbsp;
						<a href="servlet/PageServlet?currentPage=1">首页</a> <!-- 上一页判断 -->
						<c:choose>
							<c:when test="${pageBean.currentPage == 1 }">
								<a disabled="disabled">上一页</a>
							</c:when>
							<c:otherwise>
								<a
									href="servlet/PageServlet?currentPage=${pageBean.currentPage-1 }">上一页</a>
							</c:otherwise>
						</c:choose> <!-- 下一页判断 --> <c:choose>
							<c:when test="${pageBean.currentPage == pageBean.totalPage }">
								<a disabled="disabled">下一页</a>
							</c:when>
							<c:otherwise>
								<a
									href="servlet/PageServlet?currentPage=${pageBean.currentPage+1 }">下一页</a>
							</c:otherwise>
						</c:choose> <a href="servlet/PageServlet?currentPage=${pageBean.totalPage }">末页</a>
					</td>
				</tr>
				<tr>
					<td colspan="7" align="center">
						<form action="servlet/PageServlet" class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-lg-offset-4 col-lg-1">当前页</label>
								<div class="col-lg-1">
									<input type="text" value="${pageBean.currentPage }"
									class="form-control" name="currentPage" maxlength="3">
								</div>
								<div class="col-lg-1">
									<input type="submit" class="btn btn-primary form-control" value="go">
								</div>
							</div>
						</form>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="col-lg-1"></div>
</body>
</html>
