<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/admin-all.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="../Scripts/tip.js"></script>
    <script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker();

		$('#list').hide();
		$('#caseID').tooltip({
			title : '相关案件'
		});
		$('#lawyerID').tooltip({
			title : '责任律师'
		});
		$('#name').tooltip({
			title : '客户姓名'
		});
		$('#loginDateEnd').tooltip({
			title : '区间下限'
		});
		$('#loginDateStart').tooltip({
			title : '区间上限'
		});
	})
</script>
    
<script type="text/javascript">
	$(function() {
		$('#find').click(function() {
			$("#form1").submit();
		})

		$('#clear').click(function() {
			$('#caseID').val('');
			$('#lawyerID').val('');
			$('#name').val('');
			$('#loginDateEnd').val('');
			$('#loginDateStart').val('');
		})

	})
</script>

<script>
	function changePage(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "showclient";
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
					document.forms.form2.action = "deleteclient";
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
		document.forms.form2.action = "jumpeditclient";
		document.forms.form2.submit();
	}
	function lookV(obj) {
		document.getElementById("checkbutton").value = obj.id;
		document.forms.form2.action = "lookclient";
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
				document.forms.form2.action = "showclient";
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
				document.forms.form2.action = "showclient";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
	<s:if test="#result =='editfail'">
		<script type="text/javascript">
			$(function() {
				document.forms.form2.action = "showclient";
				document.forms.form2.submit();
			})
		</script>
	</s:if>
</s:if>

<s:set name="caseID" value="#clientfind.caseID"></s:set>
<s:set name="lawyerID" value="#clientfind.lawyerID"></s:set>
<s:set name="name" value="#clientfind.caseStartTime"></s:set>
<s:set name="loginDateEnd" value="#clientfind.caseHandleTime"></s:set>
<s:set name="loginDateStart" value="#clientfind.indicter"></s:set>

</head>
<body>
    <div></div>
    <div class="alert alert-info">当前位置<b class="tip"></b>客户管理<b class="tip"></b>客户查询</div>
	<form id="form1" action="findclient" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<td colspan="6" class="auto-style2">&nbsp;请填写查询条件(如不填写则返回全部记录)
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>客户姓名:</td>
					<td class="detail"><input id="name" name="name"
						value="${name}" /></td>
					<td>登记日期:</td>
					<td
						<div class="input-append">
                        <input class="span2 datepicker" size="16" type="text" id="loginDateStart" name="loginDateStart" value="${loginDateStart}"/><span class="add-on"><i class="icon-calendar"></i></span>至<input id="loginDateEnd" class="span2 datepicker" size="16" type="text" name="loginDateEnd" value="${loginDateEnd}"/><span class="add-on"><i class="icon-calendar"></i></span>
                    </div></td>
				</tr>
				<tr>
					<td>责任律师:</td>
					<td class="detail"><input id="lawyerID" name="lawyerID"
						value="${lawyerID}" /></td>
					<td>相关案件:</td>
					<td class="detail"><input id="caseID" name="caseID"
						value="${caseID}" /></td>
				</tr>

				<tr>
					<td colspan="6" align="right"><input class="btn btn-inverse"
						id="find" type="button" value="查询" /> <input id="clear"
						class="btn btn-inverse" type="button" value="清空" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>


	<table class="table table-striped table-bordered table-condensed" id="list">
        <thead>
            <tr class="tr_detail">
                <td>客户编号 </td>
                <td>客户姓名</td>
                <td>登记日期</td>
                <td>相关案件</td>
                <td>责任律师</td>
				<td>联系地址</td>
				<td>联系电话</td>
				<td>传真</td>
				<td>邮政编码</td>
				<td>操作</td>
            </tr>
        </thead>
       <s:set name="list" value="#resultlist" />
			<s:iterator id="resu" value="list">
				<tr>
					<td><s:property value="clientID" /> </a></td>
					<td><s:property value="name" />
					</td>
					<td><s:property value="loginDate" />
					</td>
					<td><s:property value="caseID" />
					</td>
					<td><s:property value="lawyerID" />
					</td>
					<td><s:property value="address" />
					</td>
					<td><s:property value="phone" />
					</td>
					<td><s:property value="fax" />
					</td>
					<td><s:property value="zip" />
					</td>
					<s:set name="stbtnm" value="clientID"></s:set>
					<td><a class="btn btn-mini btn-primary" id="${stbtnm}"
						onclick='lookV(this)'>查看</a> <a class="btn btn-mini btn-success"
						id="${stbtnm}" onclick='editV(this)'>编辑</a> <a
						class="btn btn-mini btn-danger" id="${stbtnm}"
						onclick='deleteV(this)'>删除</a>
					</td>
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

