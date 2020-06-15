<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8" />
		<title>一只西瓜</title>
	<!-- 头部导入头部 -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
	</head>
	<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	#header{
		height: 480px;
		margin: 0 auto;
	}
	#header .carousel-inner .item img{
		margin: 0 auto;
		width: 100%;
	}
	::-webkit-scrollbar {
		width: 6px;
		height: 6px;
		background-color: #eee;
	}

	::-webkit-scrollbar-thumb {
		background-color: #3798e8;
	}

	::-webkit-scrollbar-track {
		background-color: #eee;
	}



	</style>
	<body>
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  		<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
				<li data-target="#carousel-example-generic" data-slide-to="5"></li>
			</ol>
			<!-- Wrapper for slides -->
	  		<div class="carousel-inner" role="listbox">
	  			<div class="item active">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_7.jpg" data-src="${pageContext.request.contextPath}/dist/holder.js/900x400?theme=industrial">
	  				<p class="carousel-caption">
	  					自由
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_6.jpg" data-src="${pageContext.request.contextPath}/dist/holder.js/900x400?theme=industrial">
	  				<p class="carousel-caption">
	  					和平
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_5.jpg" data-src="${pageContext.request.contextPath}/dist/holder.js/900x400?theme=industrial">
	  				<p class="carousel-caption">
	  					爱心
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_4.jpg">
	  				<p class="carousel-caption">
	  					帮助
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_3.jpg">
	  				<p class="carousel-caption">
	  					热情
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_2.jpg">
	  				<p class="carousel-caption">
	  					骑马
	  				</p>
	  			</div>
	  		</div>
	</div>
	  		<!-- Controls -->
			<a class="left carousel-control" style="height: 45%;" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"  aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" style="height: 45%;" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			<!-- 功能模块 -->
		<div class="row div_function">
			<a href="#">
	 		<div class="col-xs-4">
	 			<div class="panel panel-default" id="pFunc1">
	 				<div class="panel-body">
	 					<strong>店铺</strong>
	 					<img class="iv_function" src="${pageContext.request.contextPath}/dist/img/ic_store.svg">
	 				</div>
	 			</div>
			</div>
	 			</a>
			<a href="#">
			<div class="col-xs-4">
				<div class="panel panel-default"  id="pFunc2">
					<div class="panel-body">
						<strong>纪念馆</strong>
						<img class="iv_function" src="${pageContext.request.contextPath}/dist/img/ic_remeber.svg">
					</div>
				</div>
			</div>
			</a>
			<a href="#">
			<div class="col-xs-4">
				<div class="panel panel-default"  id="pFunc3">
					<div class="panel-body">
						<strong>私人角落</strong>
						<img class="iv_function" src="${pageContext.request.contextPath}/dist/img/ic_personal.svg">
					</div>
				</div>
			</div>
			</a>
		</div>
			<div class="clear"></div>
		<!-- 技术日记 -->
	<div id="page" class="hfeed site">
			<!-- 分割线 -->
			<%--<hr class="hr_1">igname Technology World !<hr class="hr_2">--%>
		<!-- 头部导入头部 -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/header.jsp"/>
		<div id="content" class="site-content" style="transform: none;">
			<div class="row">
				<!-- 文章列表 -->
				<div id="blog_body" class="col-xs-9">
					<div class="list-group div_article  paint-area paint-area--text" id="ib-container">
						<!-- 子头栏 -->
						 <a  class="list-group-item active item_article_first">
							<h4 id="h_head" class="list-group-item-heading">
								
							</h4>
						</a> 

					</div> 
				</div>
				
				<!-- 右侧 -->
				<div class="col-xs-3 div_record">
					<!-- 用户信息 -->
					<div class="jumbotron div_userinfo">
						<%--<h3 class="widget-title">--%>
							<%--<i class="fa fa-bars"></i>关于本站--%>
						<%--</h3>--%>
						<img class="iv_user_head img-circle" src="${pageContext.request.contextPath}/dist/img/c_2.jpg">
						<c:choose>
							<c:when test="${empty  user}">
						<div  class="about-name" style="">不忘初心</div>
						<div class="about-the">人生并不像火车要通过每个站似的经过每一个生活阶段。人生总是直向前行走，从不留下什么。</div>
								<ul>
									<li class="weixin">
										<a id="weixin_info" title="微信" href="${pageContext.request.contextPath}/dist/img/info/weixin.png"><i class="layui-icon  layui-icon-login-wechat"></i></a>
										<span class="weixin-code"><img class="weixin-img" src="${pageContext.request.contextPath}/dist/img/info/weixin.png" ></span>
									</li>
									<li class="tqq"><a target="blank" rel="external nofollow" href="http://wpa.qq.com/msgrd?V=3&amp;uin=936933494&amp;Site=QQ&amp;Menu=yes" title="QQ在线"><i class="layui-icon  layui-icon-login-qq"></i></a></li>
									<li class="tsina"><a title="微博" href="http://weibo.com/5936412667/profile?rightmod=1&amp;wvr=6&amp;mod=personinfo&amp;is_all=1" target="_blank" rel="external nofollow"><i class="layui-icon  layui-icon-login-weibo"></i></a></li>
									<li class="feed"><a title="github主页" href="https://github.com/xixiWj" target="_blank" rel="external nofollow"><i class="iconfont" style="font-size: 33px;" >&#xe885;</i>

									</a></li>
								</ul>
						</c:when>
							<c:otherwise>
								<div style="display: inline-block; margin-left: 12px;font-size: 18px;"><c:out value='${user.userName }'></c:out></div>
							</c:otherwise>
						</c:choose>


					</div>
					<!-- 网站信息 -->
					<aside class="widget wow fadeInUp" data-wow-delay="0.3s">
						<h3 class="widget-title">
							<i class="layui-icon layui-icon-list"></i>网站概况
						</h3>
						<div class="widget-text">
							<ul class="site-profile">
								<li><i class="layui-icon layui-icon-file"></i>
									文章总数：${webInfo.blogTotal} 篇
								</li>
								<li><i class="layui-icon layui-icon-dialogue"></i>
									留言数量：${webInfo.leaveMessageTotal} 条
								</li>
								<li><i class="layui-icon layui-icon-template"></i>
									分类数量：${webInfo.categoryTotal} 个
								</li>
								<li><i class="layui-icon layui-icon-note"></i> 标签总数：${webInfo.noteTotal} 个
								</li>
								<li><i class="layui-icon layui-icon-link"></i> 链接数量：${webInfo.linkTotal}
									个
								</li>
								<li><i class="layui-icon layui-icon-engine"></i> 运行时间：<span id="blogStart">${webInfo.serverRunTime}</span> 天</li>
								<li><i class="glyphicon glyphicon-eye-open"></i>
									浏览总量：${webInfo.browseTotal} 次
								</li>
								<li><i class="layui-icon layui-icon-edit"></i> 最后更新：
									<span style="color:#2F889A">${webInfo.lastUpdateTimeText}</span>
								</li>
								<span style="color:red;">
                    加油！不要因为走的太远，而忘了当初为什么出发。
                </span>
							</ul>

						</div>
						<div class="clear"></div>
					</aside>

					<!-- 热门文章 -->
					<aside id="hot_post-4" class="widget widget_hot_post wow" data-wow-delay="0.3s">
						<h3 class="widget-title"><i class="fa fa-bars"></i>热门文章</h3>
						<div id="hot_post_widget">
							<ul>
								<c:forEach items="${rightInfo.hots}" var="blog" varStatus="status">
									<li><span class="li-icon li-icon-${status.count}">${status.count} </span><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}">${blog.blogTitle}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="clear"></div>
					</aside>
					<!--近期评论-->
					<aside id="recent_comments-2" class="widget widget_recent_comments wow" data-wow-delay="0.3s">
						<h3 class="widget-title"><i class="fa fa-bars"></i>近期评论</h3>
						<div id="message" class="message-widget">
							<ul>
								<c:forEach items="${rightInfo.hots}" var="blog" varStatus="status">
								<li> <a href="https://www.licoy.cn/3288.html#comment-3443" title="PHP7在Linux下开启配置使用MongoDB" rel="external nofollow">
									<img src="//cdn.v2ex.com/gravatar/d63ba89c15d65ae81963c0613e6e2c62?s=128&amp;d=mm" class="avatar avatar-128" height="128" width="128" />
									<span class="comment_author"><strong>西西</strong></span> 博主我想问一下，多层级回复在页面上显示怎么实现的？你是用的前端渲染吗？JSP怎么实现因为不知道具体有多少回复层级 。 </a> </li>
								<li> <a href="https://www.licoy.cn/3275.html#comment-3442" title="随谈之我的二零一八年" rel="external nofollow"> <img src="//cdn.v2ex.com/gravatar/d63ba89c15d65ae81963c0613e6e2c62?s=128&amp;d=mm" class="avatar avatar-128" height="128" width="128" /> <span class="comment_author"><strong>西西</strong></span> 厉害啊 </a> </li>
								<li> <a href="https://www.licoy.cn/3288.html#comment-3441" title="PHP7在Linux下开启配置使用MongoDB" rel="external nofollow"> <img src="//cdn.v2ex.com/gravatar/53acde5c4e150cab56b37729d225bb17?s=128&amp;d=mm" class="avatar avatar-128" height="128" width="128" /> <span class="comment_author"><strong>浪子丶刘少</strong></span> 大佬，受教了，学习观摩下下~~ </a> </li>
								<li> <a href="https://www.licoy.cn/3298.html#comment-3438" title="微信小程序+Java获取用户授权手机号码" rel="external nofollow"> <img src="//cdn.v2ex.com/gravatar/42c40e3e677d051d7079b2a1f08807b2?s=128&amp;d=mm" class="avatar avatar-128" height="128" width="128" /> <span class="comment_author"><strong>文娱帝国</strong></span> 写的很好，很喜欢 </a> </li>
								<li> <a href="https://www.licoy.cn/3288.html#comment-3437" title="PHP7在Linux下开启配置使用MongoDB" rel="external nofollow"> <img src="//cdn.v2ex.com/gravatar/d63ba89c15d65ae81963c0613e6e2c62?s=128&amp;d=mm" class="avatar avatar-128" height="128" width="128" /> <span class="comment_author"><strong>西西</strong></span> 我去饿 </a> </li>
								<li style="border: none;"> <a href="https://www.licoy.cn/3275.html#comment-3434" title="随谈之我的二零一八年" rel="external nofollow"> <img src="//cdn.v2ex.com/gravatar/5988ddb905f83a4d5998c7bbb203f520?s=128&amp;d=mm" class="avatar avatar-128" height="128" width="128" /> <span class="comment_author"><strong>TOTO</strong></span> ThinkPad也不错的 </a> </li>
								</c:forEach>
							</ul>
						</div>
						<div class="clear"></div>
					</aside>
					<!-- 随手记录 -->
					<div style="display: flex;">
						<div style="flex: 1"><hr></div>
						<div style="text-align: center;line-height: 48px;color: #34374C">记录美好的心情</div>
						<div style="flex: 1"><hr></div>
					</div>
					<input type="text" class="form-control" placeholder="标题:美好的一天...">
					<br>
					<textarea class="form-control" rows="3" name=textarea placeholder="内容:今天捡到一分钱！！！^_^"></textarea>
					<br>
					<div class="div_save">
						<button type="button" class="btn btn-primary btn_save_record"><i class="layui-icon layui-icon-releasesav"></i>save</button>
					</div>
					<hr>
					<!-- 小功能列表 -->
					<div class="row div_little_func">
					<c:choose>
						<c:when test="${empty  user}">
							<div class="col-xs-4">
								<button class="btn btn-default btn-cricle btn_login" data-toggle="modal" data-target="#loginModal">登</button>
							</div>
							<div class="col-xs-4">
								<button class="btn btn-default btn-cricle btn_write" data-toggle="modal" data-target="#RegisterModal">注</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-xs-4">
								<button class="btn btn-default btn-cricle btn_login">我</button>
							</div>
							<div class="col-xs-4">
								<a href="${pageContext.request.contextPath}/edit.jsp"><button class="btn btn-default btn-cricle btn_write">写</button></a>
							</div>
						</c:otherwise>
					</c:choose>	
						<div class="col-xs-4">
							<button class="btn btn-default btn-cricle btn_stay">留</button>
						</div>
						
					</div>
				</div>

				</div>		
				<div class="row">
					<div class="col-xs-offset-2 " style="margin-top: 20px;">
						<nav aria-label="Page navigation" >
						  <ul class="pagination pagination-lg">
						    <li>
						      <a  href="javascript:void(0);" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li><a  href="javascript:void(0)">1</a></li>
						    <li><a href="javascript:void(0)">2</a></li>
						    <li><a href="javascript:void(0)">3</a></li>
						    <li><a href="javascript:void(0)">4</a></li>
						    <li><a href="javascript:void(0)">5</a></li>
						    <li id="blok" class="disabled">
						      <span>
						        <span aria-hidden="true">...</span>
						      </span>
   							 </li>
						    <li><a href="javascript:void(0)">7</a></li>
						    <li><a href="javascript:void(0)">8</a></li>
						    <li>
						      <a href="javascript:void(0)" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						  
						</nav>
					</div>
				</div>
		</div>
			<!-- 登录模态框 -->
			<div class="modal fade bs-example-modal-sm" style="margin-top: 20%;" id="loginModal"  data-backdrop="false"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<div class="modal-title" id="myModalLabel" style="text-align: center;">登录</div>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="form1" method="post" action="<c:url value='/user/login'/>" style="padding: 12px;" >
								<input type="hidden" id="path" value="${pageContext.request.contextPath}">
								<div class="form-group">
									<input type="text" class="form-control" id="user_name1" name="userName" placeholder="账户名">
								</div>
								<div class="form-group">			
									<input type="password" class="form-control" id="user_password1" name="userPassword" placeholder="密码">
								</div>
							</form>
						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="button" id="loginBtn" class="btn btn-primary" style="width: 100%">登录</button>
							<br />
							<button type="button" class="btn btn-primary " data-toggle="modal" data-target="#RegisterModal"
								style="width: 100%; margin-top: 2px;">注册</button>
						</div>
						
					</div>
				</div>
			</div>
			<!-- 注册模态框 -->
			<div class="modal bs-example-modal-sm" style="margin-top: 15%" id="RegisterModal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  			<div class="modal-dialog modal-sm" role="document">
  				<div class="modal-content">
  					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
  						<div class="modal-title" id="myModalLabe2" style="text-align: center;">注册</div>
  					</div>
  					<div class="modal-body">
  						<form class="form-horizontal" id="form2" style="padding: 12px;" action="<c:url value='/user/register' />" method="post">
  							<input type="hidden" name="method" value="register" />
  							
  							<div class="form-group">
  								<input type="text" class="form-control" id="user_email" name="userEmail"  placeholder="邮箱">
  								 <!--<span class="glyphicon glyphicon-envelope form-control-feedback"></span>-->
  								<font color="red" id="msg_email"></font>
  							</div>
  							<div class="form-group">
  								<input type="text" class="form-control" id="user_name" name="userName" placeholder="用户名">
  								<!--<span class="glyphicon glyphicon-user form-control-feedback"></span>-->
  							</div>
  							<div class="form-group">			
  								<input type="password" class="form-control" id="user_password"  name="userPassword" placeholder="密码">
  								<!--<span class="glyphicon glyphicon-lock form-control-feedback"></span>-->
  							</div>
  							<div class="form-group">			
  								<input type="password" class="form-control" id="user_password2" name="userPassword2" placeholder="确认密码">
  								<!--<span class="glyphicon glyphicon-log-in form-control-feedback"></span>-->
  							</div>
  							<div class="form-group">
  								<input type="text" class="form-control" id="user_code" name="verifyCode" placeholder="邮箱验证码">
  								<button  type="button" id="eamilCode"  class="btn btn-primary" style="width: 100%; margin-top: 5px;">获取邮箱验证码</button>		
  							</div>
  							<div class="form-group" style="text-align: center;">
  								<button type="submit" class="btn btn-primary" id="submitButton" 
  								style="width: 100%; margin-top: 2px;">注册</button> 
  							</div>
  						</form>
  						
  					</div>

  				</div>
  			</div>
  		</div>
	 </div>
			<!-- 导入底部 -->
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
	<!-- 头部导入头部 -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
	<script type="text/javascript">
	window.onload=function(){
        // layui.use('element', function(){
        //     var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //     //监听导航点击
        //     element.on('nav(demo)', function(elem){
        //         //console.log(elem)
        //         layer.msg(elem.text());
        //     });
        // });
	}

    /*function check(val) {
        if (val < 10) {
            return ("0" + val);
        } else {
            return (val);
        }


        var timer1 = null;

        function startMove(flag, opaa) {
            clearInterval(timer1);
            var lDiv = document.getElementById('tool');
            timer1 = setInterval(function () {
                var speed = 0;
                if (lDiv.offsetLeft > flag) {
                    speed = -10;
                } else {
                    speed = 10;
                }
                if (lDiv.offsetLeft == flag) {
                    clearInterval(timer1);
                } else {
                    lDiv.style.left = lDiv.offsetLeft + speed + 'px';

                }
            }, 30)
        }

        var timer2 = null;

        function startMove2(opaa) {
            clearInterval(timer2);
            var lDiv = document.getElementById('tool');
            timer2 = setInterval(function () {
                var speed = 0;
                var opaan = lDiv.style.opacity * 100;
                if (opaan > opaa) {
                    speed = -10;
                } else {
                    speed = 10;
                }
                if (opaan == opaa) {
                    clearInterval(timer2);
                } else {
                    opaan += speed;
                    lDiv.style.opacity = opaan / 100;
                }
            }, 30)
        }
    }*/
	</script>
	</body>
</html>