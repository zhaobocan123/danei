<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../css/global_color.css" />
        <style>
        	.errorMsg{color:red;}
        </style>
        <script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
        <script language="javascript" type="text/javascript">
        	var flag=false;
            //保存成功的提示消息
             function showResult() {
            	//权限选择的验证
//             	var checkObjs = document.getElementsByName("selectPrivilege");
// 	            if(checkObjs == null || checkObjs.length == 0)
// 	            {
	              $("#selectAdminMsg").addClass("error_msg");
// 	              alert("权限至少选择一个");
// 	              return;
// 	            }
                showResultDiv(true);
                if(flag)
                {
                	 $("#addRoleForm").submit();
                }
               
                window.setTimeout("showResultDiv(false);", 3000);
            } 
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            $(function(){
            	//校验角色名
            	$("#name").blur(function(){
	            	var name=$("#name").val();
	            	if(name==null||name==""||name==undefined)
	            	{
	            		$("#nameMsg").text("角色名不能为空");
	            		$("#nameMsg").addClass("errorMsg");
	            		flag=false;
	            		return;
	            	}
	            	//var reg=/^[a-zA-Z0-9_]+$/;
	            	if(name.length>20)
	            	{
	            		$("#nameMsg").text("小于20长度的字母、数字和汉字的组合");
	            		$("#nameMsg").addClass("errorMsg");
	            		flag=false;
	            	}
	            	else
	            	{
	            		$.post(
	            			"validateRole.action",
	            			{"name":name},
	            			function(data){
	            				if(data)
	            				{
	            					$("#nameMsg").text("验证通过");
	            					$("#nameMsg").removeClass("errorMsg");
	            					flag=true;
	            				}
	            				else
	            				{
	            					$("#nameMsg").text("用户名已经存在,请换一个");
	            					$("#nameMsg").addClass("errorMsg");
	            					flag=false;
	            				}
	            			}
	            		);
	            	}
               });
            });
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../img/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                 <li><a href="../login/index.jsp" class="index_off"></a></li>
                <li><a href="list.jsp" class="role_on"></a></li>
                <li><a href="../admin/list.jsp" class="admin_off"></a></li>
                <li><a href="../cost/list.jsp" class="fee_off"></a></li>
                <li><a href="../account/list.jsp" class="account_off"></a></li>
                <li><a href="../service/list.jsp" class="service_off"></a></li>
                <li><a href="#" class="bill_off"></a></li>
                <li><a href="#" class="report_off"></a></li>
                <li><a href="#" class="information_off"></a></li>
                <li><a href="#" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，角色名称重复！-->
            <form action="addRole.action" method="post" class="main_form" id="addRoleForm">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                	<input  type="text" name="role.name" class="width200" id="name"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="nameMsg">不能为空，且为20长度的字母、数字和汉字的组合</div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                    	<!--数据库遍历出所有的权限-->
                    	<ul>
                    		<li><input type="checkbox"  name="role.privilegeIds" value="1"/><span>管理员1</span></li>
                    		<li><input type="checkbox"  name="role.privilegeIds" value="2"/><span>管理员2</span></li>
                    		<li><input type="checkbox"  name="role.privilegeIds" value="3"/><span>管理员3</span></li>
                    	</ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny">至少选择一个权限</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" onclick="history.back();"/>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北网的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有 &copy;北京网络职业学院 </p>
        </div>
    </body>
</html>

