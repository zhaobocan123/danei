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
        <script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
        <script language="javascript" type="text/javascript">
        	var flag=false;
        	$(function(){
        		//异步校验admin_code账号
        		$("#adminCodeId").blur(function(){
        			var adminCode=$(this).val();//osUserNamemsg
        			if(adminCode==null||adminCode==""||adminCode==undefined)
        			{
        				$("#adminCodeMsg").text("管理员账号不能为空");
        				$("#adminCodeMsg").addClass("error_msg");
        				flag=false;
        				return;
        			}
        			var reg=/^[a-zA-Z0-9_]+$/;
        			if(!reg.test(adminCode)||adminCode.length>30)
        			{
        				$("#adminCodeMsg").text("30长度以内的字母、数字和下划线的组合");
        				$("#adminCodeMsg").addClass("error_msg");
        				flag=false;
        			}
        			else
        			{
        				$.post(
        					"validateAdminCode.action",
        					{"adminCode":adminCode},
        					function(data){
        						if(data)
        						{
        							$("#adminCodeMsg").text("验证通过");
        							$("#adminCodeMsg").removeClass("error_msg");
        							flag=true;
        						}
        						else
        						{
        							$("#adminCodeMsg").text("用户名已经存在，请换一个");
        							$("#adminCodeMsg").addClass("error_msg");
        							flag=false;
        						}
        					}
        				);
        			}
        		});
        		//验证真实姓名
        		$("#name").blur(function(){
        			var name=$(this).val();//osUserNamemsg
        			if(name==null||name==""||name==undefined)
        			{
        				$("#nameMsg").text("真实姓名不能为空");
        				$("#nameMsg").addClass("error_msg");
        				flag=false;
        				return;
        			}
        			//var reg=/^[a-zA-Z0-9_]+$/;
        			if(name.length<20)
        			{
        				$("#nameMsg").text("验证通过");
        				$("#nameMsg").removeClass("error_msg");
        				flag=true;
        			}
        			else
        			{
        				$("#nameMsg").text("20长度以内的字母、数字和下划线的组合");
        				$("#nameMsg").addClass("error_msg");
        				flag=false;
        			}
        		});
        		//密码的验证
        		$("#password").blur(function(){
        			var password=$(this).val();
        			if(password==null||password==""||password==undefined)
        			{
        				$("#passwordMsg").text("密码不能为空");
        				$("#passwordMsg").addClass("error_msg");
        				flag=false;
        				return;
        			}
        			var reg=/^[a-zA-Z0-9_]+$/;
        			if(reg.test(password)&&password.length<30)
        			{
        				$("#passwordMsg").text("验证通过");
        				$("#passwordMsg").removeClass("error_msg");
        				flag=true;
        			}
        			else
        			{
        				$("#passwordMsg").text("30长度以内的字母、数字和下划线的组合");
        				$("#passwordMsg").addClass("error_msg");
        				flag=false;
        			}
        		});
        		//重复密码的验证
        		$("#passwordAgain").blur(function(){
        			var passwordAgain=$(this).val();
        			if(passwordAgain==null||passwordAgain==""||passwordAgain==undefined)
        			{
        				$("#passwordAgainMsg").text("密码不能为空");
        				$("#passwordAgainMsg").addClass("error_msg");
        				flag=false;
        				return;
        			}
        			var password=$("#password").val();
        			if(passwordAgain==password)
        			{
        				$("#passwordAgainMsg").text("验证通过");
        				$("#passwordAgainMsg").removeClass("error_msg");
        				flag=true;
        			}
        			else
        			{
        				$("#passwordAgainMsg").text("两次密码必须相同");
        				$("#passwordAgainMsg").addClass("error_msg");
        				flag=false;
        			}
        		});
        		//电话号码的验证telePhone
        		$("#telePhone").blur(function(){
        			var telePhone=$(this).val();
        			if(telePhone==null||telePhone==""||telePhone==undefined)
        			{
        				$("#telePhoneMsg").text("电话号码不能为空");
        				$("#telePhoneMsg").addClass("error_msg");
        				flag=false;
        				return;
        			}
        			var reg=/^[0-9]{11}$/;
        			if(reg.test(telePhone))
        			{
        				$("#telePhoneMsg").text("验证通过");
        				$("#telePhoneMsg").removeClass("error_msg");
        				flag=true;
        			}
        			else
        			{
        				$("#telePhoneMsg").text("正确的电话号码格式：手机或固话");
        				$("#telePhoneMsg").addClass("error_msg");
        				flag=false;
        			}
        		});
        		//邮箱的验证--\w+((-w+)|(\.\w+))*\@[\w]+((\.|-)[\w]+)*\.[\w]+
        		$("#email").blur(function(){
        			var email=$(this).val();
        			if(email==null||email==""||email==undefined)
        			{
        				$("#emailMsg").text("邮箱不能为空");
        				$("#emailMsg").addClass("error_msg");
        				flag=false;
        				return;
        			}
        			var reg=/^\w+((-w+)|(\.\w+))*\@[\w]+((\.|-)[\w]+)*\.[\w]+$/;
        			if(reg.test(email) && email.length<50)
        			{
        				$("#emailMsg").text("验证通过");
        				$("#emailMsg").removeClass("error_msg");
        				flag=true;
        			}
        			else
        			{
        				$("#emailMsg").text("50长度以内，正确的 email 格式");
        				$("#emailMsg").addClass("error_msg");
        				flag=false;
        			}
        		});
        	});
            //保存成功的提示消息
            function showResult() {
            		//角色选择的验证
            		//var checkObjs = document.getElementsByName("selectAdmin");
	              // if(checkObjs == null || checkObjs.length == 0)
	                //{
	                	//$("#selectAdminMsg").addClass("error_msg");
	                	//alert("角色至少选择一个");
	                	//return;
	                //}
	                showResultDiv(true);
	                $("#addAdminForm").submit();
	                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
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
                <li><a href="../role/list.jsp" class="role_off"></a></li>
                <li><a href="list.jsp" class="admin_on"></a></li>
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
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="" method="post" class="main_form" id="addAdminForm">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                    	<input type="text" name="name" id="name"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long" id="nameMsg">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                       <input type="text" name="adminCode" id="adminCodeId"/>
                       <span class="required">*</span>
                        <div class="validate_msg_long" id="adminCodeMsg">30长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                    	<input type="password" name="passWord" id="password"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long " id="passwordMsg">30长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password"  id="passwordAgain"/>
                        <span class="required">*</span>
                        <div class="validate_msg_long " id="passwordAgainMsg">两次密码必须相同</div>
                    </div>      
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text"  name="telePhone" class="width200" id="telePhone"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium " id="telePhoneMsg">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                    	<input type="text" name="email" class="width200" id="email"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium " id="emailMsg">50长度以内，正确的 email 格式</div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high" >
                        <div class="input_info_scroll" >
                        	<input type="checkbox" name="roleids"  id="selectAdmin"> 角色1
                        	<input type="checkbox" name="roleids"  id="selectAdmin"> 角色2
                        	<input type="checkbox" name="roleids"  id="selectAdmin"> 角色3
                        	<input type="checkbox" name="roleids"  id="selectAdmin"> 角色4
                        </div>
                        <span class="required">*</span>
                        <div class="validate_msg_tiny " id="selectAdminMsg">至少选择一个</div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                        <input type="button" value="取消" class="btn_save" onclick="history.back();"/>
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[源自北网的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有&copy;北京网络职业学院 </span>
        </div>
    </body>
</html>
