<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>律师行管理系统</title>
<link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
<link rel="stylesheet" type="text/css" href="Styles/base.css" />
<link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="Styles/chur.css" />
<link rel="stylesheet" type="text/css"
	href="Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="Scripts/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="Scripts/chur-alert.1.0.js"></script>
<script type="text/javascript" src="Scripts/index.js"></script>

<script type="text/javascript">
	function exit() {
		$('body').alert({
			title : '提示', //标题
			content : '确定要注销登录吗？', //提示文字信息
			modal : true, //模式，开关灯
			draggable : false,
			type : 'info',
			buttons : [ {
				id : 'yes',
				name : '确定',
				callback : function() {
					top.location = 'login.jsp';
				}
			}, {
				id : 'no',
				name : '取消',
				callback : function() {
				}
			} ]
		})
	}
</script>

<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='success'">
		<script type="text/javascript">
			$(function() {
				$('body').alert({
					type : 'success',
					title : '欢迎', //标题
					content : '登陆成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
</s:if>
<s:else>
	<script language="javascript">
		top.location = 'login.jsp';
	</script>
</s:else>

</head>
<body>
	<div class="warp">
		<!--头部开始-->
		<div class="top_c">
			<div class="top-menu">
				<ul class="top-menu-nav">
					<li><a target="Conframe" href="welcome.action">首页</a></li>
					<li><a href="#">案件管理<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><a target="Conframe" href="jsp/addcase.jsp">案件输入</a>
							</li>
							<li><a target="Conframe" href="jsp/findcase.jsp">案件查询</a>
							</li>
						</ul>
					</li>
					<li><a href="#">客户管理<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/addclient.jsp">增加客户</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findclient.jsp">客户查询</a></li>
						</ul>
					</li>
					<li><a href="#">律师管理<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/addemployee.jsp">增加律师</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findemployee.jsp">律师查询</a></li>
						</ul>
					</li>
					<li><a href="#">报表<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp2/findcase.jsp">案件报表</a></li>
						</ul>
					</li>
					<li><a href="#">系统管理<i class="tip-up"></i> </a>
						<ul class="kidc">
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/addmanager.jsp">添加管理员</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/changepassword.jsp">修改密码</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findmanager.jsp">查看管理员</a></li>
							<li><b class="tip"></b><a target="Conframe"
								href="jsp/findlog.jsp">查看日志</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="top-nav">
				欢迎您，
				<s:property value="#session.username" />
				！&nbsp;&nbsp;<a class="btn btn-mini btn-primary" target="Conframe" href="jsp/changepassword.jsp">修改密码</a> | <a class="btn btn-mini btn-danger" href="javascript:exit();">注销登录</a>
			</div>
		</div>
		<!--头部结束-->
		<!--左边菜单开始-->
		<div class="left_c left">
			<h1>系统操作菜单</h1>
			<div class="acc">
				<div>
					<a class="one">案件管理</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addcase.jsp">案件输入</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findcase.jsp">案件查询</a></li>
					</ul>
				</div>
				<div>
					<a class="one">客户管理</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addclient.jsp">增加客户</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findclient.jsp">客户查询</a></li>
					</ul>
				</div>
				<div>
					<a class="one">律师管理</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addemployee.jsp">增加律师</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findemployee.jsp">律师查询</a></li>
					</ul>
				</div>
				<div>
					<a class="one">报 表</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp2/findcase.jsp">案件报表</a></li>
					</ul>
				</div>
				<div>
					<a class="one">其他</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="findorder">预约管理</a></li>
							<li><b class="tip"></b><a target="Conframe"
							href="findcansulation">咨询管理</a></li>
					</ul>
				</div>
				<div>
					<a class="one">系统管理</a>
					<ul class="kid">
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/addmanager.jsp">添加管理员</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/changepassword.jsp">修改密码</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findmanager.jsp">查看管理员</a></li>
						<li><b class="tip"></b><a target="Conframe"
							href="jsp/findlog.jsp">查看日志</a></li>
					</ul>
				</div>
				<div id="datepicker"></div>
			</div>

		</div>
		<!--左边菜单结束-->
		<!--右边框架开始-->
		<div class="right_c">
			<div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

		</div>
		<div class="Conframe">
			<iframe name="Conframe" id="Conframe" src="welcome.action"></iframe>
		</div>
		<!--右边框架结束-->

		<!--底部开始-->
		<div class="bottom_c">江南大学毕业设计 律师行管理系统 by张启晗</div>
		<!--底部结束-->
	</div>
</body>
</html>
