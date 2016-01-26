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
<script type="text/javascript">
	$(function() {
		$('.modal').show();

		$(".datepicker").datepicker();
	})

	function actionV(obj) {
			if ($('#name').val() == "") {
				var $parent = self.parent.$;
				$parent('body').alert({
					type : 'warning',
					title : '系统提示', //标题
					content : '姓名不可为空！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			} else {

			document.getElementById("checkbutton").value = obj.id;
			document.forms.form.action = "editemployee";
			document.forms.form.submit();
			}
		}
</script>

<s:if test="hasActionMessages()">
	<s:set name="result" value="actionMessages[0]" />

	<s:if test="#result =='addsuccess'">
		<script type="text/javascript">
			var $parent = self.parent.$;
			$(function() {
				$parent('body').alert({
					type : 'success',
					title : '系统提示', //标题
					content : '添加成功！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			})
		</script>
	</s:if>
</s:if>
<s:set name="lawyerID" value="#employee.lawyerID"></s:set>
<s:set name="name" value="#employee.name"></s:set>
<s:set name="nation" value="#employee.nation"></s:set>
<s:set name="birthArea" value="#employee.birthArea"></s:set>
<s:set name="education" value="#employee.education"></s:set>
<s:set name="graduate" value="#employee.graduate"></s:set>
<s:set name="graduateTime" value="#employee.graduateTime"></s:set>
<s:set name="workTime" value="#employee.workTime"></s:set>
<s:set name="inTime" value="#employee.inTime"></s:set>
<s:set name="contractTime" value="#employee.contractTime"></s:set>
<s:set name="cardID" value="#employee.cardID"></s:set>
<s:set name="baseSalary" value="#employee.baseSalary"></s:set>
<s:set name="workSalary" value="#employee.workSalary"></s:set>
<s:set name="allowance" value="#employee.allowance"></s:set>
<s:set name="homeAddress" value="#employee.homeAddress"></s:set>
<s:set name="homeTel" value="#employee.homeTel"></s:set>
<s:set name="mobile" value="#employee.mobile"></s:set>
<s:set name="memo" value="#employee.memo"></s:set>
<s:set name="sex" value="#employee.sex"></s:set>
<s:set name="work" value="#employee.work"></s:set>
<s:set name="typeWork" value="#employee.typeWork"></s:set>
<s:set name="health" value="#employee.health"></s:set>
<s:set name="marrage" value="#employee.marrage"></s:set>
<s:set name="creditLevel" value="#employee.creditLevel"></s:set>

<script type="text/javascript">
	$(function() {

		var opts = document.getElementById("sex");
		var value = "${sex}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}

		var opts = document.getElementById("work");
		var value = "${work}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}

		var opts = document.getElementById("typeWork");
		var value = "${typeWork}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}

		var opts = document.getElementById("health");
		var value = "${health}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}

		var opts = document.getElementById("marrage");
		var value = "${marrage}";
		if (value != "") {
			for ( var i = 0; i < opts.options.length; i++) {
				if (value == opts.options[i].value) {
					opts.options[i].selected = 'selected';
					break;
				}
			}
		}

		if ("${creditLevel}" == "高") {
			document.all("creditLevel")[0].checked = true;//第一个radio选中  
		}
		if ("${creditLevel}" == "中") {
			document.all("creditLevel")[1].checked = true;//第一个radio选中  
		}
		if ("${creditLevel}" == "低") {
			document.all("creditLevel")[2].checked = true;//第一个radio选中  
		}
		if ("${creditLevel}" == "差") {
			document.all("creditLevel")[3].checked = true;//第一个radio选中  
		}

	})
</script>


</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>律师管理<b class="tip"></b>增加律师
	</div>
	<form id="form" action="addemployee" method="post">
		<table class="table table-striped table-bordered table-condensed list">
			<thead>
				<tr>
					<td colspan="4"><b>添加律师</b></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="15%">姓名</td>
					<td width="500"><input id="name" name="name" value="${name}"
						type="text" />
					</td>
					<td width="500">性别</td>
					<td width="500"><select name="sex" id="sex">
							<option value="男">男</option>
							<option value="女">女</option>
							<option selected="selected"></option>
					</select></td>
				</tr>
				<tr>
					<td>民族</td>
					<td><input name="nation" value="${nation}" type="text" /></td>
					<td>出生地</td>
					<td><input name="birthArea" value="${birthArea}" type="text" />
					</td>
				</tr>
				<tr>
					<td>文化程度</td>
					<td><input name="education" value="${education}" type="text" />
					</td>
					<td>毕业院校</td>
					<td><input name="graduate" value="${graduate}" type="text" />
					</td>
				</tr>
				<tr>
					<td>毕业时间</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" name="graduateTime" size="16"
								type="text" value="${graduateTime}" /><span class="add-on"><i
								class="icon-calendar"></i> </span>
					</td>
					</div>
					</td>
					<td>工作开始时间</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" name="workTime" size="16"
								type="text" value="${workTime}" /><span class="add-on"><i
								class="icon-calendar"></i> </span>
					</td>
					</div>
					</td>
				</tr>
				<tr>
					<td>进公司时间</td>
					<td>
						<div class="input-append">
							<input class="span2 datepicker" size="16" name="inTime"
								type="text" value="${inTime}" /><span class="add-on"><i
								class="icon-calendar"></i> </span>
					</td>
					</div>
					</td>
					<td>合同期限</td>
					<td><input name="contractTime" value="${contractTime}"
						type="text" /></td>
				</tr>
				<tr>
					<td>职位</td>
					<td><select name="work" id="work">
							<option value="律师 ">律师</option>
							<option value="律师助理 ">律师助理</option>
							<option selected="selected"></option>
					</select></td>
					<td>身份</td>
					<td><select name="typeWork" id="typeWork">
							<option value="干部 ">干部</option>
							<option value="职工 ">职工</option>
							<option value="实习生 ">实习生</option>
							<option selected="selected"></option>
					</select></td>
				</tr>
				<tr>
					<td>健康状况</td>
					<td><select name="health" id="health">
							<option value="良好">良好</option>
							<option value="残疾">残疾</option>
							<option selected="selected"></option>
					</select></td>
					<td>身份证号</td>
					<td><input name="cardID" value="${cardID}" type="text" /></td>
				</tr>
				<tr>
					<td>基本工资</td>
					<td>
						<div class="input-append">
							<input class="span2" id="Text2" size="16" name="baseSalary"
								type="text" value="${baseSalary}" /><span class="add-on">￥</span>
						</div></td>
					<td>岗位工资</td>
					<td>
						<div class="input-append">
							<input class="span2" id="Text2" size="16" name="workSalary"
								type="text" value="${workSalary}" /><span class="add-on">￥</span>
						</div></td>
				</tr>
				<tr>
					<td>津贴</td>
					<td>
						<div class="input-append">
							<input class="span2" id="Text2" size="16" name="allowance"
								type="text" value="${allowance}" /><span class="add-on">￥</span>
						</div></td>
					<td>婚姻状况</td>
					<td><select name="marrage" id="marrage">
							<option value="已婚">已婚</option>
							<option value="未婚">未婚</option>
							<option value="离异">离异</option>
							<option selected="selected"></option>
					</select></td>
				</tr>
				<tr>
					<td>家庭住址</td>
					<td><input name="homeAddress" value="${homeAddress}"
						type="text" /></td>
					<td>家庭电话</td>
					<td><input name="homeTel" value="${homeTel}" type="text" /></td>
				</tr>
				<tr>
					<td>手机</td>
					<td><input name="mobile" value="${mobile}" type="text" /></td>
					<td>信誉级别</td>
					<td><input name="creditLevel" id="creditLevel" type="radio"
						value="高" /> 高 <input type="radio" id="creditLevel"
						name="creditLevel" value="中" /> 中 <input type="radio"
						id="creditLevel" name="creditLevel" value="低 " /> 低 <input
						type="radio" id="creditLevel" name="creditLevel" value="差" /> 差</td>
				</tr>
				<tr>
					<td width="15%">备注</td>
					<td width="500" colspan="3" height=""><textarea name="memo"
							style="width: 95%" rows="4" cols="5">${memo}</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>

			</tfoot>
		</table>
	<div style="text-align:center; ">
		<input class="btn btn-inverse" id="save" type="button"
			onclick='actionV(this)' value="保存" /> <input class="btn btn-inverse"
			id="cancel" type="button" onclick='actionV(this)' value="取消" /> <input
			type="hidden" id="checkbutton" name="buttonName"> <input
			type="hidden" id="lawyerID" name="lawyerID" value="${lawyerID}">
	</div>
</body>
</form>
</html>

