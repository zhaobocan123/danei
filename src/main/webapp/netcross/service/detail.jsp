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
    </head>
    <body>
        &ldquo;<!--Logo区域开始-->
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
            <form action="" method="post" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix">
                	<span>业务账号ID：</span>
                </div>
                <div class="input_info">
                	<input type="text"  name="service.id" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix">
                	<span>账务账号ID：</span>
                </div>
                <div class="input_info">
                	<input type="text"  name="service.accountId" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix">
                	<span>客户姓名：</span>
                </div>
                <div class="input_info">
                	<input type="text"  name="service.realName" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix">
                	<span>身份证号码：</span>
                </div>
                <div class="input_info">
                	<input type="text"  name="service.idCardNo" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix">
                	<span>服务器 IP：</span>
                </div>
                <div class="input_info">
                	<input type="text"  name="service.unixHost" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix">
                	<span>OS 账号：</span>
                </div>
                <div class="input_info">
                	<input type="text"  name="service.osUserName" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix">
                	<span>状态：</span>
                </div>
                <div class="input_info">
                    <select disabled>
	                    <!--<s:if test="service.status==0">
	                     	<option>开通</option>
	                    </s:if>
	                    <s:elseif test="service.status==1">
	                   	 	<option>暂停</option>
	                    </s:elseif>
	                    <s:else>
	                       <option>删除</option>
	                    </s:else>-->  
	                    <option>开通</option>
                    </select>                        
                </div>
                <div class="text_info clearfix">
                	<span>开通时间：</span>
                </div>
                <div class="input_info">
                	<input type="text" name="service.createDate" class="readonly" readonly="true" />
                </div>
                <div class="text_info clearfix">
                	<span>资费 ID：</span>
                </div>
                <div class="input_info">
                	<input type="text" name="service.costId" class="readonly" readonly="true" />
                </div>
                <div class="text_info clearfix">
                	<span>资费名称：</span>
                </div>
                <div class="input_info">
                	<input type="text" name="service.costName" class="width200 readonly" readonly="true" />
                </div>
                <div class="text_info clearfix">
                	<span>资费说明：</span>
                </div>
                <div class="input_info_high">
                	<textarea name="service.costName" class="width300 height70 readonly" readonly="true"></textarea>
                </div>  
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="history.back();" />
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

