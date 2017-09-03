<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
</head>

<body>
	<div class="container">
		<div class="btn-group btn-group-vertical">
			<button class="btn btn-default" type="button">首页</button>
			<button class="btn btn-primary" type="button">产品展示</button>
			<button class="btn btn-info" type="button">案例分析</button>
			<button class="btn btn-success" type="button">联系我们</button>
			<div class="btn-group">
				<button class="btn btn-danger dropdown-toggle" type="button"
					data-toggle="dropdown">
					管理 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="manager" class="btn btn-primary">人员管理</a></li>
					<li><a href="servlet/PageServlet" class="btn btn-primary">Page</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
