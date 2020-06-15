<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8" />
    <title></title>
    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
<div id="page" class="hfeed site">
    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/header.jsp"/>
    <div id="content" class="site-content">
        <div class="clear"></div>
        <input type="hidden" id="context" value="${pageContext.request.contextPath}">
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">
                <div class="wow" data-wow-delay="0.3s">
                    <article id="post-3275" class="post-4738 post4 type-post status-publish format-standard hentry category-wordpress tag-wordpress rwz">
                        <header class="entry-header">
                            <h1 class="entry-title">${article.blog.blogTitle}</h1>
                        </header>
                        <!-- .entry-header -->
                        <div class="entry-content">
                            <div class="single-content">
                                ${article.blog.blogText}
                            </div>
                            <div class="clear"></div>
                            <div id="social">
                                <div class="social-main">
                                    <span class="like"> <a href="javascript:void(0);"   data-action="${pageContext.request.contextPath}/article/favorite" data-id="${article.blog.blogId}" title="点赞" class="favorite"><i class="layui-icon layui-icon-praise"></i> 赞 <i class="count"> ${article.blog.blogLikeCount}</i> </a> </span>
                                    <span class="shang-p" style="cursor:pointer"> <span class="shang-s"><a title="赞助本站" onclick="PaymentUtils.show();">赏</a></span></span>
                                    <span class="share-sd"> <span class="share-s fenxiang"><a href="javascript:void(0)" id="share-s" title="分享"><i class="layui-icon layui-icon-share"></i> 分享</a></span> </span>
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <footer class="single-footer">
                                <%--<script> $(function(){ function page_views() { if(!window.localStorage) { console.info('浏览器不支持localStorage'); }else{ var post_id = 3275; var views = localStorage.getItem("view_list"); if(views===null){ localStorage.setItem("view_list",post_id); $.post("go/views/index.php?time="+new Date().getTime(),{post_id:post_id}); return true; }else{ var item = views.split("|"); var bool = $.inArray(post_id+'',item); if(bool===-1){ console.log("send"); $.post("go/views/index.php?time="+new Date().getTime(),{post_id:post_id}); localStorage.setItem("view_list",views+"|"+post_id); return true; } return false; } }} page_views(); }) </script>--%>
                                <ul class="single-meta">
                                    <li class="single-date">${article.blog.blogDateTxt}</li>
                                    <li class="comment"><a href="https://www.licoy.cn/3275.html#comments" rel="external nofollow"><i class="layui-icon layui-icon-reply-fill"></i> ${fn:length(article.comments)}</a></li>
                                    <li class="views"><i class="glyphicon glyphicon-eye-open"></i> ${article.blog.blogVisit}</li>
                                    <li class="print"><a href="javascript:printme()" target="_self" title="打印"><i style="font-size: 16px; padding: 5px;" class="glyphicon glyphicon-print"></i></a></li>
                                    <li class="r-hide"><a href="javascript:pr()" title="侧边栏">隐藏边栏</a></li>
                                </ul>
                                <ul id="fontsize">
                                    A+
                                </ul>
                                <div class="single-cat-tag">
                                    <div class="single-cat">
                                        所属分类：
                                        <a href="${pageContext.request.contextPath}/category/findBlogByCategory?categoryId=${article.blog.blogCate}" >${article.blog.category.categoryName}</a>
                                    </div>
                                </div>
                            </footer>
                            <!-- .entry-footer -->
                            <div class="clear"></div>
                        </div>
                        <!-- .entry-content -->
                    </article>
                    <!-- #标签 -->
                    <div class="single-tag">
                        <ul>
                            <li><a href="#" rel="tag" style="background:#666666">个人总结</a></li>
                            <li><a href="#" rel="tag" style="background:#f99f13">二零一八</a></li>
                            <li><a href="#" rel="tag" style="background:#8e7daa">随谈</a></li>
                        </ul>
                    </div>
                </div>
                <div class="wow" data-wow-delay="0.3s">
                    <div class="authorbio">
                        <img src="//cdn.v2ex.com/gravatar/fba2757ee995aeb405f773f84a3d0496?s=128&amp;d=mm" class="avatar avatar-128" height="128" width="128" />
                        <ul class="spostinfo">
                            <li> </li>
                            <li><strong>版权声明：</strong>本站原创文章，于${article.blog.blogDateTxt}，由 <b><a href="${pageContext.request.contextPath}/author/aticles?userId=?${article.blog.user.userId}" title="由${article.blog.user.userName}发布" rel="author">${article.blog.user.userName}</a></b> 发表，共 ${article.acticleCount}字。</li>
                            <li><strong>转载请注明：</strong><a href="https://www.licoy.cn/3275.html" rel="bookmark" title="本文固定链接 ${pageContext.request.contextPath}article/articleInfo?blogId=${article.blog.blogId}">${article.blog.blogTitle} – ${article.blog.user.userName}</a><a href="#" onclick="copy_code('${pageContext.request.contextPath}article/articleInfo?blogId=${rticle.blog.blogId}'); return false;"> +复制链接</a></li>
                        </ul>
                    </div>
                </div>
                <div class="wow" data-wow-delay="0.3s">
                    <div id="related-img">
                        <c:forEach items="${article.reComActicle}" var="blog" >
                            <div class="r4">
                                <div class="related-site">
                                    <figure class="related-site-img">
                                        <div class="load">
                                            <a href="${pageContext.request.contextPath}/article/articleInfo/${article.blog.blogId}"><img src="${pageContext.request.contextPath}/dist/img/article/article_def.jpg" data-original="&amp;w=280&amp;h=210&amp;a=&amp;zc=1" alt="${blog.blogTitle}" style="display: inline;" /></a>
                                        </div>
                                    </figure>
                                    <div class="related-title">
                                        <a href="${pageContext.request.contextPath}/article/articleInfo/${article.blog.blogId}">${blog.blogTitle}</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="single-widget">
                    <div class="wow" data-wow-delay="0.3s"></div>
                    <div class="clear"></div>
                </div>
                <div class="wow" data-wow-delay="0.3s">
                    <div class="importgg-pc importgg-site">
                        <div class="comment-top-ad">
                            <a title="广告位" href="" target="_blank"><img src="${pageContext.request.contextPath}/dist/img/article/article_def.jpg" alt="广告位" /></a>
                        </div>
                    </div>
                </div>
                <nav class="nav-single wow" data-wow-delay="0.3s">
                    <c:choose>
                        <c:when test="${empty article.preBlog}">
                            <span class="meta-nav"><span class="post-nav">没有了<br /></span>已是最新文章</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/article/articleInfo?blogId=${article.preBlog.blogId}" rel="prev"><span class="meta-nav"><span class="post-nav"><i class="fa fa-angle-left"></i> 上一篇</span><br />${article.preBlog.blogTitle}</span></a>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty article.nextBlog}">
                            <span class="meta-nav"><span class="post-nav">没有了<br /></span>已是最新文章</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/article/articleInfo?blogId=${article.nextBlog.blogId}" rel="prev"><span class="meta-nav"><span class="post-nav"><i class="fa fa-angle-left"></i> 下一篇</span><br />${article.nextBlog.blogTitle}</span></a>
                        </c:otherwise>
                    </c:choose>
                    <div class="clear"></div>
                </nav>
                <%--<nav class="navigation post-navigation" role="navigation">--%>
                    <%--<h2 class="screen-reader-text">文章导航</h2>--%>
                    <%--<div class="nav-links">--%>
                        <%--<div class="nav-previous">--%>
                            <%--<a href="https://www.licoy.cn/3266.html" rel="prev"><span class="meta-nav-r" aria-hidden="true"><i class="fa fa-angle-left"></i></span></a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</nav>--%>
                <!-- 引用 -->
                <div class="scroll-comments"></div>
                    <div id="respond" class="comment-respond wow" data-wow-delay="0.3s">
                        <h3 id="reply-title" class="comment-reply-title" style="font-size: 16px">
                            <i class="layui-icon layui-icon-reply-fill"></i>发表评论<small>
                            <a rel="nofollow" id="cancel-comment-reply-link" href="javascript:void(0)" style="display:none;">取消回复</a></small>
                        </h3>
                        <form class="layui-form layui-form-pane" action="" id="submitFrom">
                            <div class="author_avatar author_avatar_info_img">
                                <div class="comments_box_tips">
                                    <p class="comments_tips">请在下方填写评论信息</p>
                                </div>
                            </div>
                            <input type="hidden"  name="fatherId" id="commentFatherId"/>
                            <input type="hidden" name="blogId" value="${article.blog.blogId}"/>
                            <c:choose>
                            <c:when test="${user!=null}">
                                <div class="user_avatar">
                                    <img alt="言曌" style=" width: 48px;height: 48px;" src="${pageContext.request.contextPath}/dist/img/headPortrait/<c:out value="${sessionScope.user.userinfo.userImage}" default="headerDef.png" />" class="avatar avatar-64 photo" height="64" width="64">
                                    登录者：<a href="${pageContext.request.contextPath}/admin/user/profile">${sessionScope.user.userName}</a>
                                    <br> <a href="javascript:void(0)" onclick="logout()">登出</a>
                                    <input type="hidden" name="role" value="1">
                                    <input type="hidden" name="userName"
                                           value="${sessionScope.user.userName}">
                                    <input type="hidden" name="userEmail"
                                           value="${sessionScope.user.userEmail}">
                                    <input type="hidden" name="userUrl" value="${sessionScope.user.userinfo.userPlace}">
                                </div>
                            </c:when>
                            <c:otherwise>
                                        <div id="comment-author-info">
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">昵称 <span class="required">*</span></label>
                                            <div class="layui-input-block">
                                                <input type="text" name="vName" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" value="${visitor.vName}">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">邮箱 <span class="required">*</span></label>
                                            <div class="layui-input-block">
                                                <input type="text" name="vEmail" lay-verify="email" placeholder="" autocomplete="off" class="layui-input" value="${visitor.vEmail}">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">网址 </label>
                                            <div class="layui-input-block">
                                                <input type="text" name="vWebAddress"  placeholder="" autocomplete="off" class="layui-input" value="${visitor.vWebAddress}">
                                            </div>
                                        </div>
                                         </div>
                            </c:otherwise>
                            </c:choose>
                            <textarea id="commentConent" style="display: none;" lay-verify="article_desc" name="content" placeholder="世界之大，不发表一下看法？" ></textarea>
                            <%--<div class="layui-form-item layui-form-text">--%>
                                <%--<div class="layui-input-block">--%>
                                    <%--<textarea placeholder="世界之大，不发表一下看法？"  name="content" class="layui-textarea"></textarea>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <!-- 成功 -->
                            <div id="success" style="display: none;"><i class="layui-icon layui-icon-ok-circle" style="color: #01AAED"></i> 评论成功，刷新页面后查看~</div>
                            <!-- 提交时 -->
                            <div id="loading" style="display: none;"><img src="${pageContext.request.contextPath}/dist/img/load/load-avatar.gif"/>正在提交, 请稍候...</div>
                            <!-- 错误时 -->
                            <div id="error" style="display: none;"><i class="glyphicon glyphicon-info-sign" style="color: #01AAED"> </i></div>
                            <div class="layui-form-item">
                                <button id="submit"  class="layui-btn layui-btn-primary layui-btn-fluid" lay-submit="" lay-filter="commentFrom">提交评论</button>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label"    style="width: 169px;">有回复时邮件通知我</label>
                                <div class="layui-input-block">
                                    <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="开|关">
                                    <div class="layui-unselect layui-form-switch layui-form-onswitch" lay-skin="_switch">
                                        <em>开</em>
                                        <i></i>
                                    </div>
                                </div>
                            </div>
                        </form>
                            <%--<p class="emoji-box" style="display: none; left: 10px;">--%>
                                <%--<script type="text/javascript">/* <![CDATA[ */--%>
                                <%--function grin(tag) {--%>
                                    <%--var myField;--%>
                                    <%--tag = ' ' + tag + ' ';--%>
                                    <%--if (document.getElementById('comment') && document.getElementById('comment').type == 'textarea') {--%>
                                        <%--myField = document.getElementById('comment');--%>
                                    <%--} else {--%>
                                        <%--return false;--%>
                                    <%--} if (document.selection) {--%>
                                        <%--myField.focus(); sel = document.selection.createRange(); sel.text = tag; myField.focus();--%>
                                    <%--} else if (myField.selectionStart || myField.selectionStart == '0') {--%>
                                        <%--var startPos = myField.selectionStart; var endPos = myField.selectionEnd;--%>
                                        <%--var cursorPos = endPos;--%>
                                        <%--myField.value = myField.value.substring(0, startPos) + tag + myField.value.substring(endPos, myField.value.length);--%>
                                        <%--cursorPos += tag.length; myField.focus();--%>
                                        <%--myField.selectionStart = cursorPos;--%>
                                        <%--myField.selectionEnd = cursorPos;--%>
                                    <%--} else {--%>
                                        <%--myField.value += tag; myField.focus();--%>
                                    <%--}--%>
                                <%--}/* ]]> */</script>--%>
                                <%--<a href="javascript:grin(':?:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_question.gif" alt=":?:" title="疑问" /></a><a href="javascript:grin(':razz:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_razz.gif" alt=":razz:" title="调皮" /></a><a href="javascript:grin(':sad:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_sad.gif" alt=":sad:" title="难过" /></a><a href="javascript:grin(':evil:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_evil.gif" alt=":evil:" title="抠鼻" /></a><a href="javascript:grin(':!:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_exclaim.gif" alt=":!:" title="吓" /></a><a href="javascript:grin(':smile:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_smile.gif" alt=":smile:" title="微笑" /></a><a href="javascript:grin(':oops:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_redface.gif" alt=":oops:" title="憨笑" /></a><a href="javascript:grin(':grin:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_biggrin.gif" alt=":grin:" title="坏笑" /></a><a href="javascript:grin(':eek:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_surprised.gif" alt=":eek:" title="惊讶" /></a><a href="javascript:grin(':shock:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_eek.gif" alt=":shock:" title="发呆" /></a><a href="javascript:grin(':???:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_confused.gif" alt=":???:" title="撇嘴" /></a><a href="javascript:grin(':cool:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_cool.gif" alt=":cool:" title="大兵" /></a><a href="javascript:grin(':lol:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_lol.gif" alt=":lol:" title="偷笑" /></a><a href="javascript:grin(':mad:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_mad.gif" alt=":mad:" title="咒骂" /></a><a href="javascript:grin(':twisted:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_twisted.gif" alt=":twisted:" title="发怒" /></a><a href="javascript:grin(':roll:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_rolleyes.gif" alt=":roll:" title="白眼" /></a><a href="javascript:grin(':wink:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_wink.gif" alt=":wink:" title="鼓掌" /></a><a href="javascript:grin(':idea:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_idea.gif" alt=":idea:" title="酷" /></a><a href="javascript:grin(':arrow:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_arrow.gif" alt=":arrow:" title="擦汗" /></a><a href="javascript:grin(':neutral:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_neutral.gif" alt=":neutral:" title="亲亲" /></a><a href="javascript:grin(':cry:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_cry.gif" alt=":cry:" title="大哭" /></a><a href="javascript:grin(':mrgreen:')"><img src="https://www.licoy.cn/wp-content/themes/begin/img/smilies/icon_mrgreen.gif" alt=":mrgreen:" title="呲牙" /></a><br /></p>--%>
                            <%--<div class="clear"></div>--%>
                            <%--<div class="qaptcha">--%>
                                <%--<div class="bgslider">--%>
                                    <%--<div class="slider ui-draggable ui-draggable-handle ui-draggable-disabled" style="position: relative; width: 21px; right: auto; left: 16px; top: 0px; cursor: default;"></div>--%>
                                <%--</div>--%>
                                <%--<div class="Icons" style="background-position: -16px 0px;"></div>--%>
                                <%--<div class="txtstatus droperror dropSuccess">--%>
                                    <%--已解锁！--%>
                                <%--</div>--%>
                                <%--<div class="clr"></div>--%>
                                <%--<input name="rh5xZ_s3smhMEYtEpUqDstPnesrVcfuQ" value="" type="hidden" />--%>
                            <%--</div>--%>
                            <%--<p class="editor_tools" style="display: block;"> --%>
                                <%--<a class="editor emoji" href="javascript:embedImage();">表情</a> --%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.strong()">粗体</a> --%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.em()">斜体</a>--%>
                                <%--a class="editor" href="javascript:embedImage();">图片</a> --%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.quote()">引用</a>--%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.ahref()">链接</a>--%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.del()">删除线</a> --%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.underline()">下划线</a> --%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.code()">插代码</a>--%>
                                <%--<a class="editor" href="javascript:SIMPALED.Editor.sign()">签到</a> </p>--%>
                            <%--<p class="comment-form-comment"><textarea id="comment" name="comment" rows="4" placeholder="世界之大，不发表一下看法？" tabindex="4"></textarea></p>--%>
                            <%--<div id="loading" style="display: none;">--%>
                                <%--<i class="fa fa-spinner"></i>正在提交, 请稍候...--%>
                            <%--</div>--%>
                            <%--<div id="error" style="display: none;">--%>
                                <%--<i class="fa fa-exclamation-circle"></i>提示：必须填写昵称及邮件。--%>
                            <%--</div>--%>
                            <%--<p></p>--%>
                            <%--<p class="form-submit"> <input id="submit" name="submit" type="submit" tabindex="5" value="提交评论" style="opacity: 1;" /> <input type="hidden" name="comment_post_ID" value="3275" id="comment_post_ID" /><input type="hidden" name="comment_parent" id="comment_parent" value="0" /> </p>--%>
                            <%--<span class="mail-notify"> <input type="checkbox" name="comment_mail_notify" id="comment_mail_notify" checked="checked" class="notify" value="comment_mail_notify" /> <label for="comment_mail_notify"><span>有回复时邮件通知我</span></label>--%>
         <%--<div id="ajax_comment_goto_box"></div> </span>--%>
                        <%--</form>--%>
                     </div>
                    <h2 class="comments-title wow" data-wow-delay="0.3s"> 目前评论：${fn:length(article.comments)} &nbsp;&nbsp;其中：访客&nbsp;&nbsp;${article.blog.blogVisit} &nbsp;&nbsp;博主&nbsp;&nbsp;7 </h2>
                    <h2 class="comments-title wow comment-loading-box" data-wow-delay="0.3s" style="overflow: hidden; display: none;">
                        <center>
                            <div class="loading-comments">
                                <img style="width: 35px;height: 35px;" src="${pageContext.request.contextPath}/dist/img/load/comment_loading.gif" width="auto" height="auto" />
                            </div>
                        </center> </h2>
                    <ol class="comment-list">
                        <c:forEach items="${article.comments}" var="comment" varStatus="status">
                            <c:set var="floor" value="0"></c:set>
                            <c:if test="${empty comment.fatherId}">
                                <c:set var="floor" value="${floor+1}"></c:set>
                                <div id="anchor">
                                    <div id="comment-${comment.id}"></div>
                                </div>
                                <li class="wow" data-wow-delay="0.3s" id="comment-${comment.id}">
                                    <div id="${comment.id}" class="comment-body">
                                        <div class="comment-author vcard">
                                            <c:choose>
                                                <c:when test="${empty comment.userId}">
                                                    <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                    <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment.address}/" rel="external nofollow" target="_blank" class="url">${comment.visitor.vName}</a> </strong>
                                                    <span class="comment_ip_home" >&nbsp;
                                                        <span class="WB-OS">
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.browserInfo}.png" title="${comment.browserInfo}" alt="${comment.browserInfo}" />
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.systemVersion}.png" title="${comment.systemVersion}" alt="${comment.systemVersion}"/>
                                                        </span>
                                                    </span>
                                                    <span class="comment-meta commentmetadata">
                                                        <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                        <span class="comment-aux">
                                                            <span class="reply" >
                                                                <a style="" rel="nofollow" at="${comment.id}" class="comment-reply-link" href="javascript:void(0)"
                                                                   onclick="" aria-label="回复给${comment.visitor.vName}">
                                                                    回复</a>
                                                            </span>
                                                        </span>
                                                            ${comment.dateTxt} <span class="floor"> &nbsp;${floor}楼 </span>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                    <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment.address}/" rel="external nofollow" target="_blank" class="url">${comment.user.userName}</a> </strong>
                                                    <span class="comment_ip_home" style="display: block;">&nbsp;
                                                        <span class="WB-OS">
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.browserInfo}.png" title="${comment.browserInfo}" alt="${comment.browserInfo}" />
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.systemVersion}.png" title="${comment.systemVersion}" alt="${comment.systemVersion}"/>
                                                        </span>
                                                    </span>
                                                    <span class="comment-meta commentmetadata">
                                                            <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                            <span class="comment-aux">
                                                                <span class="reply">
                                                                    <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)"
                                                                       onclick="reply(this)" aria-label="回复给${comment.user.userName}">
                                                                        回复</a>
                                                                </span>
                                                            </span>
                                                                ${comment.dateTxt} <span class="floor"> &nbsp;${floor}楼 </span>
                                                        </span>
                                                    <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                </c:otherwise>
                                            </c:choose>
                                                <!--<cite class="fn"><a href='http://www.smartkubaoya.com/' rel='external nofollow' class='url'>bao</a></cite> <span class="says">:</span>-->
                                                <%--<span class="comment-meta commentmetadata"> <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br /> <span class="comment-aux">--%>
                                                    <%--<span class="reply">--%>
                                                         <%--<a rel="nofollow" class="comment-reply-link" href="https://www.licoy.cn/3275.html?replytocom=3420#respond"--%>
                                                            <%--onclick="return addComment.moveForm( &quot;div-comment-3420&quot;, &quot;3420&quot;, &quot;respond&quot;, &quot;3275&quot; )" aria-label="回复给bao">回复</a>--%>
                                                    <%--</span> 2019年03月01日 下午4:14 <span class="floor"> &nbsp;11楼 </span> </span> </span>--%>
                                        </div>
                                        <p>${comment.content}</p>
                                   <!-- 待审评论区域 -->
                                    </div>
                                    <ul class="children">
                                        <c:set var="floor2" value="0"/>
                                     <c:forEach items="${article.comments}" var="comment2" varStatus="status">
                                         <c:if test="${comment2.fatherId eq comment.id}">
                                          <c:set var="floor2" value="${floor2+1}"/>
                                             <div id="anchor">
                                                 <div id="comment-${comment2.id}"></div>
                                             </div>
                                             <li class="wow" data-wow-delay="0.3s" id="comment-${comment2.id}">
                                                 <div id="${comment2.id}" class="comment-body">
                                                     <div class="comment-author vcard">
                                                         <c:choose>
                                                             <c:when test="${empty comment2.userId}">
                                                                 <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment2.address}/" rel="external nofollow" target="_blank" class="url">${comment2.visitor.vName}</a> </strong>
                                                                 <span class="comment_ip_home">&nbsp;
                                                            <span class="WB-OS">
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.browserInfo}.png" title="${comment2.browserInfo}" alt="${comment2.browserInfo}" />
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.systemVersion}.png" title="${comment2.systemVersion}" alt="${comment2.systemVersion}"/>
                                                            </span>
                                                        </span>
                                                                 <span class="comment-meta commentmetadata">
                                                                <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" at="${comment2.id}" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="" aria-label="回复给${comment2.visitor.vName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment2.dateTxt} <span class="floor"> &nbsp;${floor2}层 </span>
                                                            </span>
                                                             </c:when>
                                                             <c:otherwise>
                                                                 <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment2.address}/" rel="external nofollow" target="_blank" class="url">${comment2.user.userName}</a> </strong>
                                                                 <span class="comment_ip_home" style="display: block;">&nbsp;
                                                            <span class="WB-OS">
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.browserInfo}.png" title="${comment2.browserInfo}" alt="${comment2.browserInfo}" />
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.systemVersion}.png" title="${comment2.systemVersion}" alt="${comment2.systemVersion}"/>
                                                            </span>
                                                        </span>
                                                                 <span class="comment-meta commentmetadata">
                                                                <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="reply(this)" aria-label="回复给${comment2.user.userName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment2.dateTxt} <span class="floor"> &nbsp;${floor2}楼 </span>
                                                            </span>
                                                                 <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                             </c:otherwise>
                                                         </c:choose>
                                                     </div>
                                                 </div>
                                                 <p><span class="at">@<a href="#comment-${comment.id}"> ${comment.visitor.vName!=null?comment.visitor.vName:comment.user.uName}</a></span>   ${comment2.content}</p>
                                                 <!-- 待审评论区域 -->
                                                     <ul class="children">
                                                         <c:forEach items="${article.comments}" var="comment3" varStatus="status">
                                                         <c:if test="${comment3.fatherId eq comment2.id}">
                                                         <c:set var="floor2" value="${floor2+1}"/>
                                                         <div id="anchor">
                                                             <div id="comment-${comment3.id}"></div>
                                                         </div>
                                                         <li class="wow" data-wow-delay="0.3s" id="comment-${comment3.id}">
                                                             <div id="${comment3.id}" class="comment-body">
                                                                 <div class="comment-author vcard">
                                                                     <c:choose>
                                                                         <c:when test="${empty comment3.userId}">
                                                                             <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                                             <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment3.address}/" rel="external nofollow" target="_blank" class="url">${comment3.visitor.vName}</a> </strong>
                                                                             <span class="comment_ip_home">&nbsp;
                                                            <span class="WB-OS">
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.browserInfo}.png" title="${comment3.browserInfo}" alt="${comment3.browserInfo}" />
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.systemVersion}.png" title="${comment3.systemVersion}" alt="${comment3.systemVersion}"/>
                                                            </span>
                                                        </span>
                                                                             <span class="comment-meta commentmetadata">
                                                                <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" at="${comment3.id}" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="" aria-label="回复给${comment3.visitor.vName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment3.dateTxt} <span class="floor"> &nbsp;${floor2}层 </span>
                                                            </span>
                                                                         </c:when>
                                                                         <c:otherwise>
                                                                             <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                                             <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment3.address}/" rel="external nofollow" target="_blank" class="url">${comment3.user.userName}</a> </strong>
                                                                             <span class="comment_ip_home" style="display: block;">&nbsp;
                                                                             <span class="WB-OS">
                                                                              <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.browserInfo}.png" title="${comment3.browserInfo}" alt="${comment3.browserInfo}" />
                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.systemVersion}.png" title="${comment3.systemVersion}" alt="${comment3.systemVersion}"/>
                                                                             </span>
                                                                            </span>
                                                                             <span class="comment-meta commentmetadata">
                                                                <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="reply(this)" aria-label="回复给${comment3.user.userName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment3.dateTxt} <span class="floor"> &nbsp;${floor2}楼 </span>
                                                            </span>
                                                                             <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                                         </c:otherwise>
                                                                     </c:choose>
                                                                 </div>
                                                                 <p><span class="at">@<a href="#comment-${comment2.id}"> ${comment2.visitor.vName!=null?comment2.visitor.vName:comment2.user.uName}</a></span>   ${comment3.content}</p>
                                                                 <!-- 待审评论区域 -->
                                                             </div>
                                                                 <ul class="children">
                                                                     <c:forEach items="${article.comments}" var="comment4" varStatus="status">
                                                                         <c:if test="${comment4.fatherId eq comment3.id}">
                                                                                     <c:set var="floor2" value="${floor2+1}"/>
                                                                                 <div id="anchor">
                                                                                     <div id="comment-${comment4.id}"></div>
                                                                                 </div>
                                                                                 <li class="wow" data-wow-delay="0.3s" id="comment-${comment4.id}">
                                                                                 <div id="${comment4.id}" class="comment-body">
                                                                                     <div class="comment-author vcard">
                                                                                         <c:choose>
                                                                                             <c:when test="${empty comment4.userId}">
                                                                                                 <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment4.address}/" rel="external nofollow" target="_blank" class="url">${comment4.visitor.vName}</a> </strong>
                                                                                                 <span class="comment_ip_home">&nbsp;
                                                                                                <span class="WB-OS">
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.browserInfo}.png" title="${comment4.browserInfo}" alt="${comment4.browserInfo}" />
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.systemVersion}.png" title="${comment4.systemVersion}" alt="${comment4.systemVersion}"/>
                                                                                                </span>
                                                                                             </span>
                                                                                                 <span class="comment-meta commentmetadata">
                                                                                            <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                                                            <span class="comment-aux">
                                                                                                <%--<span class="reply">--%>
                                                                                                    <%--<a rel="nofollow" at="${comment4.id}" class="comment-reply-link" href="javascript:void(0)"--%>
                                                                                                       <%--onclick="" aria-label="回复给${comment4.visitor.vName}">--%>
                                                                                                        <%--回复</a>--%>
                                                                                                <%--</span>--%>
                                                                                            </span>
                                                                                                ${comment4.dateTxt} <span class="floor"> &nbsp;${floor2}层 </span>
                                                                                        </span>
                                                                                             </c:when>
                                                                                             <c:otherwise>
                                                                                                 <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment4.address}/" rel="external nofollow" target="_blank" class="url">${comment4.user.userName}</a> </strong>
                                                                                                 <span class="comment_ip_home" style="display: block;">&nbsp;
                                                                                                <span class="WB-OS">
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.browserInfo}.png" title="${comment4.browserInfo}" alt="${comment4.browserInfo}" />
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.systemVersion}.png" title="${comment4.systemVersion}" alt="${comment4.systemVersion}"/>
                                                                                                </span>
                                                                                            </span>
                                                                                                 <span class="comment-meta commentmetadata">
                                                                                                    <a href="https://www.licoy.cn/3275.html/#comment-3420"></a><br />
                                                                    <%--<span class="comment-aux">--%>
                                                                        <%--<span class="reply">--%>
                                                                            <%--<a rel="nofollow" class="comment-reply-link" href="javascript:void(0)"--%>
                                                                               <%--onclick="reply(this)" aria-label="回复给${comment4.user.userName}">--%>
                                                                                <%--回复</a>--%>
                                                                        <%--</span>--%>
                                                                    <%--</span>--%>
                                                                                     ${comment4.dateTxt} <span class="floor"> &nbsp;${floor2}楼 </span>
                                                                                  </span>
                                                                                                 <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                                                             </c:otherwise>
                                                                                         </c:choose>
                                                                                     </div>
                                                                                     <p><span class="at">@<a href="#comment-${comment3.id}"> ${comment3.visitor.vName!=null?comment3.visitor.vName:comment3.user.uName}</a></span>   ${comment4.content}</p>
                                                                                     <!-- 待审评论区域 -->
                                                                                 </div>
                                                                                 </li>
                                                                         </c:if>
                                                                     </c:forEach>
                                                                 </ul>
                                                                 <!-- .children -->
                                                         </li>

                                                     </c:if>
                                                     </c:forEach>
                                                     </ul>
                                                     <!-- .children -->

                                         </c:if>
                                     </c:forEach>
                                    </ul>
                                    <!-- .children -->
                                </li>
                            </c:if>
                        </c:forEach>
                    </ol>

                    <%--<!-- .comment-list -->--%>
                <%--<script src="https://www.licoy.cn/wp-content/themes/begin/js/saveinfo.js"></script>--%>
                <!-- #comments -->
            </main>
            <!-- .site-main -->
        </div>
        <!-- .右侧内容 -->

        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/right.jsp"/>
        <div class="clear"></div>
        <div class="clear"></div>
    </div>
    <!-- 导入底部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
</div>

<!-- 头部导入头部 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
<script>
    var commentURL = contextPath+"/article/comment";
    var layedit;
    var form;
    layui.use(['form', 'layedit', 'laydate'], function(){
        var layer = layui.layer
            ,laydate = layui.laydate;
        layedit = layui.layedit;
        form = layui.form;
            var index =layedit.build('commentConent', {
            tool: ['link' //超链接
                ,'unlink' //清除链接
                ,'face' //表情
                ,'image']});


        form.on('submit(commentFrom)', function(data){
            $("#loading").hide();
            $("#success").hide();
            $("#error").hide();
            //等待提交
            $("#loading").slideDown();
            //提交按钮变灰
            $("#submit").attr('disabled', true).fadeTo('slow', 0.5);

            //url
            var url = $(this).attr("action");
            //表单提交
            $.post(commentURL,data.field,
                function (data) {
                    if(data.status==1){
                        $("#loading").hide();
                        //评论成功
                        $("#success").slideDown();
                        setTimeout(function () {
                            $("submit").attr('disabled', false).fadeTo('slow', 1);
                            window.location.reload();W
                        }, 3000);
                    }else {
                        $("#loading").hide();
                        $("#error").after(data.msg).slideDown();
                        setTimeout(function() {
                            $("#submit").attr('disabled', false).fadeTo('slow', 1);
                            $('#error').slideUp();
                        }, 3000);
                    }
                });
            return false;
        });



        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });


        //自定义验证规则
        form.verify({
            pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ],
            article_desc:function(value){
                layedit.sync(index);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            if(this.checked){
                layer.tips('有回复时将收到邮箱提醒~', data.othis);
            }else {
                layer.tips('不会收到邮箱提醒~', data.othis);
            }
        });

        //监听提交


        //表单初始赋值
        form.val('example', {
            "username": "贤心" // "name": "value"
            ,"password": "123456"
            ,"interest": 1
            ,"like[write]": true //复选框选中状态
            ,"close": true //开关状态
            ,"sex": "女"
            ,"desc": "我爱 layui"
        })


    });
    /* 点击回复 回复框出现 */
    function  replyDiv(reply) {
        $("#respond").hide();
        $("#cancel-comment-reply-link").show();
        var commentId = reply.attr("id");
        $("#commentFatherId").val(commentId);
        reply.after($("#respond").show());
        var index1 =layedit.build('commentConent', {
            tool: ['link' //超链接
                ,'unlink' //清除链接
                ,'face' //表情
                ,'image']});
        form.verify({
            article_desc:function(value){
                layedit.sync(index1);
            }
        });
    }


</script>
</body>
</html>
