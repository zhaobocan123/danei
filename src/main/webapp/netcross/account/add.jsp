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
        <script language="javascript" type="text/javascript" src="../js/jquery-1.4.3.js"></script>
        <script language="javascript" type="text/javascript">
       		var nameFlag=false;
        		$(function(){
        		//验证真实姓名
        		$("#realNameID").blur(function(){
        			var realname=$(this).val();
        			if(realname==null||realname=="")
        			{
        				$("#realNameMsg").text("真实姓名不能为空");
        				$("#realNameMsg").css('color','red');
        				nameFlag=false;
        				return;
        			}
        			var reg=/^[a-zA-Z0-9_]+$/;
        			if(reg.test(realname)&&realname.length<20)
        			{
        				$("#realNameMsg").text("验证通过");
        				nameFlag=true;
        			}
        			else
        			{
        				$("#realNameMsg").text("20长度以内的汉字、字母和数字的组合");
        				$("#realNameMsg").css('color','red');
        				nameFlag=false;
        			}
        		});
        		//验证身份证号码
        		$("#idcardNo").blur(function(){
        			var idcardNumber=$(this).val();
        			if(idcardNumber==null||idcardNumber=="")
        			{
        				$("#idcardNoMsg").text("身份证号不能为空");
        				$("#idcardNoMsg").css('color','red');
        				nameFlag=false;
        				return;
        			}
        			var reg=/^[0-9]{18}$/;
        			if(!reg.test(idcardNumber))
        			{
        				$("#idcardNoMsg").text("正确的身份证号码格式 18位");
        				$("#idcardNoMsg").css('color','red');
        				nameFlag=false;
        				return;
        			}
        			else
        			{
        				$("#idcardNoMsg").text("验证通过");
        				nameFlag=true;
        			}
        			//计算生日
        			var birth=idcardNumber.substr(6,8);
        			$("#birthId").val(birth);
        		});
        		//验证登陆名称
        		$("#loginNameId").blur(function(){
        			var loginName=$(this).val();
        			if(loginName==null||loginName=="")
        			{
        				$("#loginNameMsg").text("登录名不能为空");
        				$("#loginNameMsg").css('color','red');
        				nameFlag=false;
        				return;
        			}
        			
        			$.post(
	        			"validateLoginName.action",
	        			{"login_name":loginName},
	        			function(data){
	        				if(data)
	        				{
	        					$("#loginNameMsg").text("验证通过");
	        					nameFlag=true;
	        				}
	        				else
	        				{
	        					$("#loginNameMsg").text("登录名已存在,请换一个");
	        					$("#loginNameMsg").css('color','red');
	        					nameFlag=false;
	        				}
	        				
	        			}
        			);
        		});
        		//验证密码
        		$("#LoginPasswordId").blur(function(){
        			var LoginPassword=$(this).val();
        			if(LoginPassword==null||LoginPassword=="")
        			{
        				$("#LoginPasswordMsg").text("密码不能为空");
        				$("#LoginPasswordMsg").css('color','red');
        				nameFlag=false;
        				return;
        			}
        			var reg=/^[a-zA-Z0-9_]+$/;
        			if(reg.test(LoginPassword)&&LoginPassword.length<30)
        			{
        				$("#LoginPasswordMsg").text("验证通过");
        				nameFlag=true;
        			}
        			else
        			{
        				$("#LoginPasswordMsg").text("30长度以内的字母、数字和下划线的组合");
        				$("#LoginPasswordMsg").css('color','red');
        				nameFlag=false;
        			}
        		});
        		//重复密码的验证
        		$("#passwordId").blur(function(){
        			var LoginPassword=$("#LoginPasswordId").val();
        			var password=$(this).val();
        			if(LoginPassword!=password)
        			{
        				$("#passwordIdMsg").text("两次密码必须相同");
        				$("#passwordIdMsg").css('color','red');
        				nameFlag=false;
        			}
        			else
        			{
        				$("#passwordIdMsg").text("验证通过");
        				nameFlag=true;
        			}
        		});
        		//验证电话号码
        		$("#telephoneId").blur(function(){
        			var telephone=$(this).val();
        			if(telephone==null||telephone=="")
        			{
        				$("#telephoneMsg").text("号码不能为空");
        				$("#telephoneMsg").css('color','red');
        				nameFlag=false;
        				return;
        			}
        			var reg=/^[0-9]+$/;
        			if(reg.test(telephone)&&telephone.length==11)
        			{
        				$("#telephoneMsg").text("验证通过");
        				nameFlag=true;
        			}
        			else
        			{
        				$("#telephoneMsg").text("正确的电话号码格式：手机或固话");
        				$("#telephoneMsg").css('color','red');
        				nameFlag=false;
        			}
        		});
        	});
        	
            //保存成功的提示信息
            function showResult(){
            	if(!nameFlag){
            		return;
            	}
            	document.getElementById("addAccountForm").submit();
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }

            //显示选填的信息项
            function showOptionalInfo(imgObj) {
                var div = document.getElementById("optionalInfo");
                if (div.className == "hide") {
                    div.className = "show";
                    imgObj.src = "../img/hide.png";
                }
                else {
                    div.className = "hide";
                    imgObj.src = "../img/show.png";
                }
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
                <li><a href="list.jsp" class="account_on"></a></li>
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
            <!--保存成功或者失败的提示消息-->     
            <div id="save_result_info" class="save_fail">保存失败，该身份证已经开通过账务账号！</div>
            <form action="addAccount.action" method="post" class="main_form" id="addAccountForm">
                <!--必填项-->
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                	<input type="text" name="realName"  id="realNameID"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="realNameMsg">20长度以内的汉字、字母和数字的组合</div>
                </div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                	<input type="text" name="idcardNo"  id="idcardNo"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="idcardNoMsg">正确的身份证号码格式</div>
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                	<input type="text" name="loginName"  id="loginNameId"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="loginNameMsg">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                	<input type="password" name="LoginPassword"  id="LoginPasswordId"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="LoginPasswordMsg">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password"  id="passwordId"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="passwordIdMsg">两次密码必须相同</div>
                </div>     
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="telephone"  id="telephoneId" class="width200"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium" id="telephoneMsg">正确的电话号码格式：手机或固话</div>
                </div>                
                <!--可选项-->
                <div class="text_info clearfix"><span>可选项：</span></div>
                <div class="input_info">
                    <img src="../img/show.png" alt="展开" onclick="showOptionalInfo(this);" />
                </div>
                <div id="optionalInfo" class="hide">
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                    	<input type="text"  name="recommenderId" />
                        <div class="validate_msg_long">正确的身份证号码格式</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                    	<input type="text"  name="birthdate"  class="readonly" readonly="true" id="birthId"/>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                    	<input type="text"  name="email"class="width350"  />
                        <div class="validate_msg_tiny">50长度以内，合法的 Email 格式</div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                    	<select name="occupation">
                    		<option value="0">---</option>
                    		<option value="1">干部</option>
                    		<option value="2">学生</option>
                    		<option value="3">技术人员</option>
                    		<option value="4">其他</option>
                    	</select>
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                    	<input type="radio" name="gender" value="1" id="genderFemale">  <label for="genderFemale">女</label>
                    	<input type="radio" name="gender" value="0" id="genderMale">  <label for="genderMale">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                    	<input type="text" name="mailAddress" class="width350"  />
                        <div class="validate_msg_tiny">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                    	<input type="text" name="zipcode"  />
                        <div class="validate_msg_long">6位数字</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                    	<input type="text" name="qq"  />
                        <div class="validate_msg_long">5到13位数字</div>
                    </div>                
                </div>
                <!--操作按钮-->
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

