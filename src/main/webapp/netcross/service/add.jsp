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
       		.errorClass{color:red;}
       	</style>
       	<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
        <script language="javascript" type="text/javascript">
        	var flag=false;
        	$(function(){
        		//校验os账号
        		$("#osUserNameId").blur(function(){
        			var osUserName=$(this).val();//osUserNamemsg
        			if(osUserName==null||osUserName==""||osUserName==undefined)
        			{
        				$("#osUserNamemsg").text("业务账号不能为空");
        				$("#osUserNamemsg").addClass("errorClass");
        				flag=false;
        				return;
        			}
        			var reg=/^[a-zA-Z0-9_]+$/;
        			if(!reg.test(osUserName)||osUserName.length>8)
        			{
        				$("#osUserNamemsg").text("8长度以内的字母、数字和下划线的组合");
        				$("#osUserNamemsg").addClass("errorClass");
        				flag=false;
        			}
        			else
        			{
        				$.post(
        					"validateOsUserName.action",
        					{"osUserName":osUserName},
        					function(data){
        						if(data)
        						{
        							$("#osUserNamemsg").text("验证通过");
        							$("#osUserNamemsg").removeClass("errorClass");
        							flag=true;
        						}
        						else
        						{
        							$("#osUserNamemsg").text("用户名已经存在，请换一个");
        							$("#osUserNamemsg").addClass("errorClass");
        							flag=false;
        						}
        					}
        				);
        			}
        		});
        		//密码的验证
        		$("#loginPasswordId").blur(function(){
        			var loginPassword=$(this).val();
        			if(loginPassword==null||loginPassword==""||loginPassword==undefined)
        			{
        				$("#loginPasswordMsg").text("密码不能为空");
        				$("#loginPasswordMsg").addClass("errorClass");
        				flag=false;
        				return;
        			}
        			var reg=/^[a-zA-Z0-9_]+$/;
        			if(!reg.test(loginPassword)||loginPassword.length>30)
        			{
        				$("#loginPasswordMsg").text("30长度以内的字母、数字和下划线的组合");
        				$("#loginPasswordMsg").addClass("errorClass");
        				flag=false;
        			}
        			else
        			{
        				$("#loginPasswordMsg").text("验证通过");
        				$("#loginPasswordMsg").removeClass("errorClass");
        				flag=true;
        			}
        		});
        		//重复密码的验证
        		$("#passwordAgainId").blur(function(){
        			var fontPassWord=$("#loginPasswordId").val();
        			var backPassWord=$(this).val();
        			if(fontPassWord==backPassWord)
        			{
        				$("#passwordAgainMsg").text("验证通过");
        				$("#passwordAgainMsg").removeClass("errorClass");
        				flag=true;
        			}
        			else
        			{
        				$("#passwordAgainMsg").text("两次密码必须相同");
        				$("#passwordAgainMsg").addClass("errorClass");
        				flag=false;
        			}
        		});
        	});
            //保存成功的提示信息
            function showResult() {
                showResultDiv(true);
                if(flag)
                {
                	$("#addServiceForm").submit();
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

            //依据身份证号查询对应的账务账号
            function searchAccount()
            {
            	var idCardNo=$("#idCardNo").val();
            	if(idCardNo==null||idCardNo==""||idCardNo==undefined)
            	{
            		$("#searchAccountMsg").text("身份证号不能为空");
            		$("#searchAccountMsg").addClass("errorClass");
            		return;
            	}
            	$.post(
	            		"searchAccountByIdcardNo.action",
	            		{"idCardNo":idCardNo},
	            		function(data)
	            		{
	            			var account=data;
	            			if(account==null||account==""||account==undefined)
	            			{
	            				$("#accountId").val("");
								$("#loginNameId").val("");
								$("#searchAccountMsg").text("账务账号中没有匹配的身份证号，请重新输入！");
								$("#searchAccountMsg").addClass("errorClass");
	            			}
	            			else
	            			{
	            				$("#accountId").val(account.id);
								$("#loginNameId").val(account.loginName);
								$("#idCardNoMsg").text("请输入身份证号！");
								$("#searchAccountMsg").removeClass("errorClass");
	            			}
	            		}
            		);
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
                <li><a href="../admin/list.jsp" class="admin_off"></a></li>
                <li><a href="../cost/list.jsp" class="fee_off"></a></li>
                <li><a href="../account/list.jsp" class="account_off"></a></li>
                <li><a href="list.jsp" class="service_on"></a></li>
                <li><a href="#" class="bill_off"></a></li>
                <li><a href="#" class="report_off"></a></li>
                <li><a href="#" class="information_off"></a></li>
                <li><a href="#" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <!--保存操作的提示信息-->
            <div id="save_result_info" class="save_success">保存成功</div>
            <form action="saveService.action" method="post" class="main_form" id="addServiceForm">
                <!--内容项-->
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" value="" class="width180" id="idCardNo"/>
                    <input type="button" value="查询账务账号" class="btn_search_large" onclick="searchAccount()"/>
                    <span class="required">*</span>
                    <div class="validate_msg_short" id="searchAccountMsg">请录入身份证号。</div>
                </div>
                <div class="text_info clearfix"><span>账务账号：</span></div>
                <div class="input_info">
                    <input type="hidden"  name="service.accountId" id="accountId"/>
                    <input type="text" value="" readonly id="loginNameId" class="readonly"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long"></div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                	<select name="service.costId">
                		<option value="1">包月</option>
                		<option value="2">计时</option>
                		<option value="3">基本</option>
                	</select>
                </div> 
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                    <select name="service.unixHost">
                		<option value="1">127.0.0.1</option>
                		<option value="2">127.0.0.1</option>
                		<option value="3">127.0.0.1</option>
                	</select>
                    <span class="required">*</span>
                    <div class="validate_msg_long"></div>
                </div>                   
                <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
                <div class="input_info">
                	<input type="text" name="service.osUserName" id="osUserNameId"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="osUserNamemsg">8长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                	<input type="password" name="service.loginPassword" id="loginPasswordId"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="loginPasswordMsg">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password"  id="passwordAgainId"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="passwordAgainMsg">两次密码必须相同</div>
                </div>     
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" onclick="history.back()"/>
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

