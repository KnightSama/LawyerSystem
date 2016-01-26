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
                    buttons: { "�ر�": function () { $(this).dialog("close"); } }
                });
            })
            
            
        $('#findlawyer').click(function () {
                $('#alert2').dialog({
                    width: 700,
                    height: 400,
                    buttons: { "�ر�": function () { $(this).dialog("close"); } }
                });
            })
	})

	$(function() {
		$('#submit').click(function() {
			if ($('#name').val() == "") {
				var $parent = self.parent.$;
				$parent('body').alert({
					type : 'warning',
					title : 'ϵͳ��ʾ', //����
					content : '�ͻ�����Ϊ�գ�', //��ʾ������Ϣ
					btntext : 'ȷ��', //��ť����
					modal : true, //ģʽ�����ص�
					draggable : false
				//�Ƿ���϶�
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
		��ǰλ��<b class="tip"></b>�ͻ�����<b class="tip"></b>���ӿͻ�
	</div>
	<form id="form" action="addclient" method="post">
		<table class="table table-striped table-bordered table-condensed list">
			<thead>
				<tr>
					<td colspan="4"><b>�ͻ�������Ϣ</b></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="15%">�ͻ�����<font color="FF0000">*</font></td>
					<td width="500" colspan="3"><input name="name" id="name"
						value="" type="text" />
					</td>
				</tr>
				<tr>
					<td>��ذ���</td>
					<td><div class="input-append"><input name="caseID" value="" type="text" /><span class="add-on" id="findcase"><i class="icon-search"></i></span></div></td>
					<td>������ʦ</td>
					<td><div class="input-append"><input name="lawyerID" value="" type="text" /><span class="add-on" id="findlawyer"><i class="icon-search"></i></span></div></td>
				</tr>
				<tr>
					<td>��ϵ��ַ</td>
					<td><input name="address" value="" type="text" /></td>
					<td>��ϵ�绰</td>
					<td><input name="phone" value="" type="text" /></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input name="fax" value="" type="text" /></td>
					<td>��������</td>
					<td><input name="zip" value="" type="text" /></td>
				</tr>
				<tr>
					<td width="15%">��ע</td>
					<td width="500" colspan="3" height=""><textarea name="memo"
							style="width: 95%" rows="4" cols="5"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<div id="alert1" title="��ѯ�������" style="display: none;">
        <iframe style="border: 0; width: 100%; height: 100%;" src="../jsp3/findcase.jsp"></iframe>
       </div>
       <div id="alert2" title="��ѯ��ʦ���" style="display: none;">
        <iframe style="border: 0; width: 100%; height: 100%;" src="../jsp3/findemployee.jsp"></iframe>
        </div>
		</form>
		<div style="text-align:center; ">
			<input class="btn btn-inverse" id="submit" type="button" value="����" />
		</div>	
</body>
</html>

