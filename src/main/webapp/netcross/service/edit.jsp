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
            //保存成功的提示信息
            function showResult() {
                showResultDiv(true);
                $("#modifyServiceForm").submit();
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
            <div id="save_result_info" class="save_success">资费修改成功</div>
            <form action="modifyService.action" method="post" class="main_form" id="modifyServiceForm">
                <!--必填项-->
                <input type="hidden" name="service.id"/>
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info">
                	 <input type="text" name="service.accountId" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info">
                	<input type="text" name="service.osUserName" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                	<input type="text" name="service.unixHost" class="readonly" readonly="true"/>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                	<select name="service.costId">
                		<option value="1">类型1</option>
                		<option value="2">类型2</option>
                		<option value="3">类型3</option>
                	</select>
                	<div class="validate_msg_long">请修改资费类型，或者取消修改操作。</div>                      
                </div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" onclick="history.back();"/>
                </div>

                
                <p>业务说明：<br />
                1、修改资费后，点击保存，并未真正修改数据库中的数据；<br />
                2、提交操作到消息队列；<br />
                3、每月月底由程序自动完成业务所关联的资费；</p>
                
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北网的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有 &copy;北京网络职业学院 </p>
        </div>
    </body>
</html>

