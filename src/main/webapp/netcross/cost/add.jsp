<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/netcross/css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/netcross/css/global_color.css" />
        <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/netcross/js/jquery-1.4.3.js"></script>
        <script language="javascript" type="text/javascript">
            var nameFlag = false;
            $(function(){
        		//给ID为costName的对象的onblur事件绑定一个方法
        		$("#costName").blur(function(){
        			//取得文本框的值
        			var name = $(this).val();
        			//判断资费名称是否为空
        			if(name == null || name == "") {
        				//若为空，则提示，并给出错误提示的样式
        				$("#nameMsg").text("资费名称不能为空！");
        				$("#nameMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        			
        			//发送异步请求给AddCostValidateAction，
        			//返回是否验证通过
        			$.post(
        				"addCostValidate.action",
        				{"name":name},
        				function(data){
        					if(data){
        						//如果返回值为true，则校验通过
        						$("#nameMsg").text("50长度的字母、数字、汉字和下划线的组合");
        						$("#nameMsg").removeClass("error_msg");
        						nameFlag = true;
        					} else {
        						//如果返回值为false，校验不通过
        						$("#nameMsg").text("资费名称不能重复！");
        						$("#nameMsg").addClass("error_msg");
        						nameFlag = false;
        					}
        				}
        			);
        		});
        		
        		//基本时长
        		$("#baseDurationId").blur(function(){
        			var str=$(this).val();
        			var reg=/^[0-9]*$/;
        			if(str==null||str=="")
        			{
        				$("#baseDurationMsg").text("不能为空");
        				$("#baseDurationMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        			if(!reg.test(str))
        			{
        				$("#baseDurationMsg").text("必须是数字");
        				$("#baseDurationMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        			if(str>=600)
        			{
        				$("#baseDurationMsg").text("1-600之间的整数");
        				$("#baseDurationMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        			else
        			{
        				$("#baseDurationMsg").text("验证通过");
        				$("#baseDurationMsg").removeClass("error_msg");
        				nameFlag = true;
        				return;
        			}
        		});
        		//基本费用验证
        	   $("#baseCostId").blur(function(){
        			var str=$(this).val();
        			var reg=/^[0-9]+(.[0-9]+)?$/;//“^[0-9]+(.[0-9]{2})?$”
        			if(str==null||str=="")
        			{
        				$("#baseCostMsg").text("不能为空");
        				$("#baseCostMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        			if(reg.test(str))
        			{
        				$("#baseCostMsg").text("验证通过");
        				$("#baseCostMsg").removeClass("error_msg");
        				nameFlag = true;
        				return;
        			}
        			else
        			{
        				$("#baseCostMsg").text("0-99999.99之间的数值");
        				$("#baseCostMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        		});
        		//单位费用验证
        		 $("#unitCostId").blur(function(){
        			var str=$(this).val();
        			var reg=/^[0-9]+(.[0-9]+)?$/;//“^[0-9]+(.[0-9]{2})?$”
        			if(str==null||str=="")
        			{
        				$("#unitCostMsg").text("不能为空");
        				$("#unitCostMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        			if(reg.test(str))
        			{
        				$("#unitCostMsg").text("验证通过");
        				$("#unitCostMsg").removeClass("error_msg");
        				nameFlag = true;
        				return;
        			}
        			else
        			{
        				$("#unitCostMsg").text("0-99999.99之间的数值");
        				$("#unitCostMsg").addClass("error_msg");
        				nameFlag = false;
        				return;
        			}
        		});
        		
        		//资费验证
        		 $("#descrId").blur(function(){
        			var str=$(this).val();
        			if(str.length<100)
        			{
        				$("#descrMsg").text("验证通过");
        				$("#unitCostMsg").removeClass("error_msg");
        				nameFlag = true;
        				return;
        			}
        			else
        			{
        				$("#descrMsg").text("字符不能超过100");
        				$("#unitCostMsg").addClass("error_msg");
        				nameFlag = false;
        			}
        		});	
        	});
        	
            //保存结果的提示
            function showResult() {
            	if(!nameFlag){
            		return;
            	}
                showResultDiv(true);
                document.getElementById("addForm").submit();
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }

            //切换资费类型
            function feeTypeChange(type) {
                var inputArray = document.getElementById("main").getElementsByTagName("input");
                if (type == 1) {
                    inputArray[4].readonly = true;
                    inputArray[4].disabled = true;
                    inputArray[4].value = "";
                    inputArray[4].className += " readonly";
                    inputArray[5].readonly = false;
                    inputArray[5].disabled = false;
                    inputArray[5].className = "width100";
                    inputArray[6].readonly = true;
                    inputArray[6].disabled = true;
                    inputArray[6].className += " readonly";
                    inputArray[6].value = "";
                }
                else if (type == 2) {
                    inputArray[4].readonly = false;
                    inputArray[4].disabled = false;
                    inputArray[4].className = "width100";
                    inputArray[5].readonly = false;
                    inputArray[5].disabled = false;
                    inputArray[5].className = "width100";
                    inputArray[6].readonly = false;
                    inputArray[6].disabled = false;
                    inputArray[6].className = "width100";
                }
                else if (type == 3) {
                    inputArray[4].readonly = true;
                    inputArray[4].disabled = true;
                    inputArray[4].value = "";
                    inputArray[4].className += " readonly";
                    inputArray[5].readonly = true;
                    inputArray[5].disabled = true;
                    inputArray[5].value = "";
                    inputArray[5].className += " readonly";
                    inputArray[6].readonly = false;
                    inputArray[6].disabled = false;
                    inputArray[6].className = "width100";
                }
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="${pageContext.request.contextPath }/netcross/img/logo.png" alt="logo" class="left"/>
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
            <div id="save_result_info" class="save_success">保存成功</div>
            <form action="addCost.do" method="post" class="main_form" id="addForm">
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width300" name="name" value="" id="costName"/>
                    <span class="required">*</span>
                    <div class="validate_msg_short" id="nameMsg" >50长度的字母、数字、汉字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="costType" value="1" id="monthly" onclick="feeTypeChange(1);" />
                    <label for="monthly">包月</label>
                    <input type="radio" name="costType" value="2" checked="checked" id="package" onclick="feeTypeChange(2);" />
                    <label for="package">套餐</label>
                    <input type="radio" name="costType" value="3" id="timeBased" onclick="feeTypeChange(3);" />
                    <label for="timeBased">计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" name="baseDuration" value="" class="width100" id="baseDurationId"/>
                    <span class="info">小时</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long" id="baseDurationMsg">1-600之间的整数</div>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text" name="baseCost"value="" class="width100" id="baseCostId"/>
                    <span class="info">元</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long " id="baseCostMsg">0-99999.99之间的数值</div>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text" name="unitCost" value="" class="width100" id="unitCostId"/>
                    <span class="info">元/小时</span>
                    <span class="required">*</span>
                    <div class="validate_msg_long " id="unitCostMsg">0-99999.99之间的数值</div>
                </div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea name="descr" class="width300 height70" id="descrId"></textarea>
                    <div class="validate_msg_short " id="descrMsg">100长度的字母、数字、汉字和下划线的组合</div>
                </div>                    
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save"  onclick="showResult();" />
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
