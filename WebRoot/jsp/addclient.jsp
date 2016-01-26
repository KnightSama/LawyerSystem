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
		//$('.modal').show();

		$(".datepicker").datepicker();
		
		$('#findcase').click(function () {
                $('#alert1').dialog({
                    width: 700,
                    height: 400,
                    buttons: { "关闭": function () { $(this).dialog("close"); } }
                });
            })
            
            
        $('#findlawyer').click(function () {
                $('#alert2').dialog({
                    width: 700,
                    height: 400,
                    buttons: { "关闭": function () { $(this).dialog("close"); } }
                });
            })
	})

	$(function() {
		$('#submit').click(function() {
			if ($('#name').val() == "") {
				var $parent = self.parent.$;
				$parent('body').alert({
					type : 'warning',
					title : '系统提示', //标题
					content : '客户不可为空！', //提示文字信息
					btntext : '确定', //按钮文字
					modal : true, //模式，开关灯
					draggable : false
				//是否可拖动
				})
			} else {
				$("form").submit();
			}
		});
	})
</script>
</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>客户管理<b class="tip"></b>增加客户
	</div>
	<form id="form" action="addclient" method="post">
		<table class="table table-striped table-bordered table-condensed list">
			<thead>
				<tr>
					<td colspan="4"><b>客户基本信息</b></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="15%">客户姓名<font color="FF0000">*</font></td>
					<td width="500" colspan="3"><input name="name" id="name"
						value="" type="text" />
					</td>
				</tr>
				<tr>
					<td>相关案件</td>
					<td><div class="input-append"><input name="caseID" value="" type="text" /><span class="add-on" id="findcase"><i class="icon-search"></i></span></div></td>
					<td>负责律师</td>
					<td><div class="input-append"><input name="lawyerID" value="" type="text" /><span class="add-on" id="findlawyer"><i class="icon-search"></i></span></div></td>
				</tr>
				<tr>
					<td>联系地址</td>
					<td><input name="address" value="" type="text" /></td>
					<td>联系电话</td>
					<td><input name="phone" value="" type="text" /></td>
				</tr>
				<tr>
					<td>传真</td>
					<td><input name="fax" value="" type="text" /></td>
					<td>邮政编码</td>
					<td><input name="zip" value="" type="text" /></td>
				</tr>
				<tr>
					<td width="15%">备注</td>
					<td width="500" colspan="3" height=""><textarea name="memo"
							style="width: 95%" rows="4" cols="5"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<div id="alert1" title="查询案件编号" style="display: none;">
        <iframe style="border: 0; width: 100%; height: 100%;" src="../jsp3/findcase.jsp"></iframe>
       </div>
       <div id="alert2" title="查询律师编号" style="display: none;">
        <iframe style="border: 0; width: 100%; height: 100%;" src="../jsp3/findemployee.jsp"></iframe>
        </div>
		</form>
		<div style="text-align:center; ">
			<input class="btn btn-inverse" id="submit" type="button" value="保存" />
		</div>	
</body>
</html>

