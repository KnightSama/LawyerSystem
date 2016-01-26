<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link rel="stylesheet" type="text/css"
	href="../Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../Styles/admin-all.css" />
<script type="text/javascript" src="../Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="../Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="../Scripts/tip.js"></script>
<script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker();
		$('#list').hide();
		$('#username').tooltip({
			title : '管理员名'
		});
		$('#startime').tooltip({
			title : '起始日期'
		});
		$('#endtime').tooltip({
			title : '结束日期'
		});
	})
</script>
<script type="text/javascript">
	$(function() {
		$('#find').click(function() {
			$("#form1").submit();
		})

		$('#clear').click(function() {
			$('#username').val('');
			$('#startime').val('');
			$('#endtime').val('');
		})

	})
</script>
<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showmanager";
		document.forms.form2.submit();
	}
	function deleteV(obj) {
		var $parent = self.parent.$;
		$parent('body').alert({
			type : 'info',
			title : '系统提示', //标题
			content : '确认要删除这条记录吗?', //提示文字信息
			modal : true, //模式，开关灯
			draggable : false,
			buttons : [ {
				id : 'yes',
				name : '确定',
				callback : function() {
					document.getElementById("checkbutton").value = obj.id;
					document.forms.form2.action = "deletemanager";
					document.forms.form2.submit();
				}
			}, {
				id : 'no',
				name : '取消',
				callback : function() {
				}
			} ]
		})
	}
	function editV(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "jumpeditmanager";
		document.forms.form2.submit();
	}
</script>
<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />
	<s:if test="#result =='success'">
		<script type="text/javascript">
			$(function() {
				$('#list').show();
			})
		</script>
	</s:if>
	<s:if test="#result =='fail'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'warning',
					title : '系统提示', //标题
					content : '抱歉，没有找到符合的结果！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
	<s:if test="#result =='deletesuccess'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : '系统提示', //标题
					content : '删除成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
				document.forms.form2.action = "showmanager";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editsuccess'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : '系统提示', //标题
					content : '编辑成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
				document.forms.form2.action = "showmanager";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editfail'">
		<script type="text/javascript">
		$(function() {
				document.forms.form2.action = "showmanager";
				document.forms.form2.submit();
				})
		</script>
	</s:if>
</s:if>
</head>
<body>
	<div></div>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>系统管理<b class="tip"></b>查看管理员
	</div>
	<table class="table table-striped table-bordered table-condensed">
		<form id="form1" action="findmanager" method="post">
			<thead>
				<tr>
					<td colspan="6" class="auto-style2">&nbsp;请填写查询条件(如不填写则返回全部记录)
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>管理员名:</td>
					<td class="detail"><input id="username" name="username" /></td>
					<td>创建日期:</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" size="16" type="text"
								id="startime" name="startTime" /><span class="add-on"><i
								class="icon-calendar"></i> </span>至<input id="endtime"
								class="span2 datepicker" size="16" type="text" name="endTime" /><span
								class="add-on"><i class="icon-calendar"></i> </span>
						</div></td>
				</tr>
				<tr>
					<td colspan="6" align="right"><input class="btn btn-inverse"
						id="find" type="button" value="查询" /> <input
						class="btn btn-inverse" id="clear" type="button" value="清空" />
					</td>
				</tr>
			</tbody>
		</form>
	</table>


	<table class="table table-striped table-bordered table-condensed"
		id="list">
		<thead>
			<tr class="tr_detail">
				<td>管理员名</td>
				<td>密码</td>
				<td>创建时间</td>
				<td>权限</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="username" /> </a>
					</td>
					<td><s:property value="password" /></td>
					<td><s:property value="createdata" /></td>
					<td><s:property value="authority" /></td>
					<s:set name="stbtnm" value="username"></s:set>
					<td><a class="btn btn-mini btn-danger" id="${stbtnm}"
						onclick='editV(this)'>编辑</a> <a class="btn btn-mini btn-danger"
						id="${stbtnm}" onclick='deleteV(this)'>删除</a></td>
				</tr>
			</s:iterator>
			<tr class="tr_pagenumber">
				<form id="form2" method="post">
					<td colspan="100">共<s:property value="#pageNum" />页&nbsp;&nbsp;共<s:property
							value="#resultNum" />条记录&nbsp;&nbsp;<a
						class="badge badge-inverse" id="firstpage"
						onclick='changePage(this)'>首页</a>&nbsp; <a
						class="badge badge-inverse" id="prepage"
						onclick='changePage(this)'>上一页</a>&nbsp; <a
						class="badge badge-warning">&nbsp;&nbsp;&nbsp;&nbsp;第<s:property
								value="#nowPage" />页&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp; <a
						class="badge badge-inverse" id="nextpage"
						onclick='changePage(this)'>下一页</a>&nbsp; <a
						class="badge badge-inverse" id="lastpage"
						onclick='changePage(this)'>尾页</a>&nbsp;&nbsp;&nbsp;&nbsp; 跳转到<input
						id="topage" name="topage" style="width:30px;">页&nbsp;&nbsp
						<a class="badge badge-inverse" id="jump"
						onclick='changePage(this)'>跳转</a>&nbsp;&nbsp;&nbsp;&nbsp; 每页显示<input
						id="showMany" name="showMany" style="width:30px;">条记录&nbsp;&nbsp
						<a class="badge badge-inverse" id="refresh"
						onclick='changePage(this)'>刷新</a> <input type="hidden"
						id="checkbutton" name="buttonName"></td>
				</form>
			</tr>
		</tbody>
	</table>

</body>
</html>

