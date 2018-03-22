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
                <li><a href="list.jsp" class="fee_on"></a></li>
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
            <form action="" method="post" class="main_form">
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info">
                	<input type="text" name="id" class="readonly" readonly="true" value="1"/>
                </div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                	<input type="text" name="name" class="readonly" readonly="true" value="宽带"/>
                </div>
                <div class="text_info clearfix"><span>资费状态：</span></div>
                <div class="input_info">
                	<select class="readonly" disabled="true" name="status">
                		<option value="0">开通</option>
                		<option value="1">暂停</option>
                		<option value="2">删除</option>
                	</select>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                	<input type="radio" name="costType"  value="1" disabled="true" checked="checked"/><label>包月</label>
                	<input type="radio" name="costType"  value="2" disabled="true" /><label>套餐</label>
                	<input type="radio" name="costType"  value="3" disabled="true" /><label>计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" name="cost.baseDuration" class="readonly" readonly="true" value="100"/>
                    <span>小时</span>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text"  name="cost.baseCost"  value="10" class="readonly" readonly="true"/>
                    <span>元</span>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text"  name="cost.unitCost" cssClass="readonly" readonly="true" value="10"/>
                    <span>元/小时</span>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info">
                	<input type="text"  name="cost.createTime" class="readonly" readonly="true" value="2018-01-01"/>
                </div>      
                <div class="text_info clearfix"><span>启动时间：</span></div>
                <div class="input_info">
                 	<input type="text"  name="cost.startTime" class="readonly" readonly="true" value="2018-01-01"/>
                </div>      
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                	<input type="text"  name="cost.descr" class="width300 height70 readonly" readonly="true" value=""/>
                </div>      
                <!--</div> -->                   
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

