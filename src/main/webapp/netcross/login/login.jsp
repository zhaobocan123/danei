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
        <script  type="text/javascript" language="javascript">
        	var nameFlag = false;
			//页面加载就运行
			$(function(){
			//用户名验证
				$("#accountId").blur(function(){
        			//取得文本框的值
        			var username = $(this).val();
        			//判断资费名称是否为空
        			if(username == null || username == "") {
        				//若为空，则提示，并给出错误提示的样式
        				$("#accountMsg").text("用户名不能为空！");
        				$("#accountMsg").addClass("required");
        				nameFlag = false;
        				return;
        			}
        			$.post(
        				"loginValidate_username.action",
        				{"username":username},
        				function(data){
        					if(data){
        						//如果返回值为true，则校验通过
        						$("#accountMsg").text("用户名通过");
        						$("#accountMsg").removeClass("required");
        						nameFlag = true;
        					} else {
        						//如果返回值为false，校验不通过
        						$("#accountMsg").text("用户名不存在！");
        						$("#accountMsg").addClass("required");
        						nameFlag = false;
        					}
        				}
        			);
				});
				//验证密码不能为空
				$("#passwordId").blur(function(){
					var password=$(this).val();
					if(password==null||password=="")
					{
						$("#passwordMsg").text("密码不能为空");
						$("#passwordMsg").addClass("required");
						nameFlag = false;
					}
					else
					{
						$("#passwordMsg").text("30长度的字母、数字和下划线");
						$("#passwordMsg").removeClass("required");
						nameFlag = true;
					}
				});
				//验证验证码是否正确
				
				$("#validcodeId").blur(function(){
					var validcode=$(this).val();
					if(validcode==null||validcode=="")
					{
						$("#validcodeMsg").text("验证码不能为空");
						$("#validcodeMsg").addClass("required");
						nameFlag = false;
					}
					$.post(
        				"loginValidate_validcode.action",
        				{"validcode":validcode},
        				function(data){
        					if(data){
        						//如果返回值为true，则校验通过
        						$("#validcodeMsg").text("验证码通过");
        						$("#validcodeMsg").removeClass("required");
        						nameFlag = true;
        					} else {
        						//如果返回值为false，校验不通过
        						$("#validcodeMsg").text("验证码错误！");
        						$("#validcodeMsg").addClass("required");
        						nameFlag = false;
        					}
        				}
        			);
				});
			});
		  
		  
		    function change(obj)
			{
				obj.src="validateCode.action?date="+new Date().getTime();
			}
		</script>
    </head>
    <body class="index">
        <div class="login_box">
        <form action="login.action" method="post" id="loginForm">
            <table>
                <tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input name="admin.adminCode"  type="text" class="width150" id="accountId"/></td>
                    <td class="login_error_info"><span class="required" id="accountMsg"></span></td>
                </tr>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input name="admin.passWord"  type="password" class="width150" id="passwordId"/></td>
                    <td><span class="required" id="passwordMsg">30长度的字母、数字和下划线</span></td>
                </tr>
                <tr>
                    <td class="login_info">验证码：</td>
                    <td class="width70"><input name="" type="text" class="width70" id="validcodeId"/></td>
                    <td><img src="../img/valicode.jpg" alt="验证码" title="点击更换" onclick="change(this);"/></td>  
                    <td><span class="required" id="validcodeMsg"></span></td>              
                </tr>            
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                        <a href="javascript:document.getElementById('loginForm').submit();"><img src="../img/login_btn.png" /></a>
                    </td>    
                    <td><span class="required">${errMsg}</span></td>                
                </tr>
            </table>
         </form>
        </div>
    </body>
</html>

