

var MyUtil = {};

var contextPath = $("#path").val();

var Param={};


/**
 * 请求热门博客 
 */
function findHot(param){
$('#cate_title li').removeClass("active");
  $('.enpty').remove();
  $('ul.pagination li').removeClass("active");
  if(!param.pc){
	  param.pc=1;
  }
  $.post("blog/"+param.method,
			{
		 		pc:param.pc,
                userId:param.uid,
                categoryId:param.cid
			},
			 function(data){
				if(data.success==false){
					// $('#msg_sub').text("错误信息");
                    // $('#msg_content').text("服务器阻塞，请稍后访问！");
                    // $('#mgs_regSu').modal('show');
                    layer.alert('服务器拉闸，请稍后访问！', {
                        icon: 5,
                        skin: 'layer-ext-moon'
                    })
				}else {
                    $('.post').remove();
                    $('#h_head').text("热门");
                    $('.post').remove();
                    $('.enpty').remove();
                    $('#menu_category li').eq(param.cid - 1).addClass("active");
                    $('#menu_category').addClass("active");
                }
					switch (param.cid) {
						case '1':
							 $('#h_head').text("Java");
								$('#java_cate').parent().addClass("active");
							break;
						case '2':
							 $('#h_head').text("Python");
							break;
						case '3':
							 $('#h_head').text(".NET");
							break;
						case '4':
							 $('#h_head').text("前端");
							break;
						case '5':
							$('#h_head').text("JavaScript");
							break;
						case '6':
							$('#h_head').text("C++");
							break;
						default:
							break;
				}	
			
		     if(data.blogs.listBean.length==0){
				$('#ib-container').append("<div class=\"enpty\"><p><svg class=\"icon\" aria-hidden=\"true\" style=\"width:120px;height:73px\"><use xlink:href=\"#monkey\"><svg class=\"icon\" viewBox=\"0 0 1706 1024\" id=\"monkey\" width=\"100%\" height=\"100%\"><path d=\"M1450.666667 768h-42.666667v170.666667H1237.333333v-42.666667H1066.666667v-42.666667H597.333333v42.666667H426.666667v42.666667H256V768h170.666667v-42.666667h85.333333v-42.666666h42.666667v-85.333334h-42.666667v-85.333333h-85.333333v-42.666667h-42.666667V298.666667h42.666667v128h42.666666v42.666666h42.666667V298.666667h-85.333333v-42.666667h85.333333V128h42.666667V85.333333h42.666666v42.666667h128v42.666667h85.333334V128h42.666666v42.666667h85.333334V128h128V85.333333h42.666666v42.666667h42.666667v128h85.333333v42.666667h-85.333333v170.666666h42.666667v-42.666666h42.666666v-128h42.666667v170.666666h-42.666667v42.666667h-85.333333v85.333333h-42.666667v85.333334h42.666667v42.666666h85.333333v42.666667h170.666667v-42.666667h42.666667v42.666667zM1066.666667 213.333333h-128v42.666667h-42.666667v42.666667h-42.666667v42.666666h-42.666666v-42.666666h-42.666667v-42.666667h-42.666667v-42.666667h-128v42.666667h-42.666666v128h42.666666v42.666667h42.666667v42.666666h42.666667v42.666667h-42.666667v42.666667h-42.666667v85.333333h85.333334v42.666667h298.666666v-42.666667h85.333334v-85.333333h-42.666667v-42.666667h-42.666667v-42.666667h42.666667v-42.666666h42.666667v-42.666667h42.666666v-128h-42.666666v-42.666667zM1024 42.666667h42.666667v42.666666h-128v42.666667h-85.333334V85.333333h42.666667V42.666667h-42.666667v42.666666h-42.666666V42.666667h-42.666667v42.666666h42.666667v42.666667h-85.333334V85.333333h-128V42.666667h42.666667V0h384v42.666667zM682.666667 384h42.666666v42.666667h-42.666666v-42.666667z m256 0h42.666666v42.666667h-42.666666v-42.666667zM768 554.666667h128v42.666666h-128v-42.666666z m554.666667-42.666667h42.666666v42.666667h-42.666666v-42.666667z m42.666666 42.666667h42.666667v42.666666h-42.666667v-42.666666z m85.333334 0h42.666666v42.666666h-42.666666v-42.666666z m-42.666667 42.666666h42.666667v42.666667h-42.666667v-42.666667z m42.666667 85.333334h42.666666v42.666666h-42.666666v-42.666666z m42.666666-42.666667h42.666667v42.666667h-42.666667v-42.666667z m42.666667-42.666667h42.666667v42.666667h-42.666667v-42.666667z m-170.666667-128h42.666667v42.666667h-42.666667v-42.666667z m170.666667 0h42.666667v42.666667h-42.666667v-42.666667z m42.666667 42.666667h42.666666v85.333333h-42.666666v-85.333333z m-170.666667-85.333333h128v42.666666h-128v-42.666666zM0 853.333333h213.333333v42.666667H0v-42.666667z m1450.666667 0h256v42.666667h-256v-42.666667z m-867.555556 128h213.333333v42.666667H583.111111v-42.666667z m270.222222-42.666666h170.666667v42.666666H853.333333v-42.666666z\" p-id=\"7714\" fill=\"#4d4d4d\"></path></svg></use></svg></p><h4 style=\"color:#ccc\">  空空如也~</h4></div>");
		     }
	    	for(var i=0;i<data.blogs.listBean.length;i++){
	    		$('#ib-container').append(
                    "<div class=\"post\"><!-- 左侧图片，信息 --><figure class=\"thumbnail\">\n" +
                    "            <span class=\"load\">\n" +
                    "                <a href=\"article/articleInfo/"+data.blogs.listBean[i].blogId+"\" >\n" +
                    "                    <img  src=\"dist/img/category/"+data.blogs.listBean[i].category.categoryImg+"\" alt=\""+data.blogs.listBean[i].blogTitle+"\">\n" +
                    "                </a>\n" +
                    "            </span>\n" +
                    "            <span class=\"cat\">\n" +
                    "                    <a href=\""+contextPath+"/category/"+data.blogs.listBean[i].category.categoryId+"\" >"+data.blogs.listBean[i].category.categoryName+"</a>\n" +
                    "            </span>\n" +
                    "        </figure><header class=\"entry-header\">\n" +
                    "            <h2 class=\"entry-title\">\n" +
                    "                <a href=\"article/articleInfo/"+data.blogs.listBean[i].blogId+"\"   rel=\"bookmark\">\n" +
                    " "+ data.blogs.listBean[i].blogTitle+"\n"+
                    "                </a>\n" +
                    "            </h2>\n" +
                    "        </header><div class=\"entry-content\">\n" +
                    "            <div class=\"archive-content\">\n" +
                    "   "         +data.blogs.listBean[i].blogInfo+"\n" +
                    "            </div>\n" +
                    "            <span class=\"title-l\"></span>\n" +
                    "            <span class=\"new-icon\"></span>\n" +
                    "            <span class=\"entry-meta\">\n" +
                    "                <span class=\"date\">"+data.blogs.listBean[i].blogDateTxt+"&nbsp;&nbsp;</span>\n" +
                    "                <span class=\"views\"><i class=\"glyphicon glyphicon-eye-open\"></i> "+data.blogs.listBean[i].blogVisit+" views</span>\n" +
                    "                <span class=\"comment\">&nbsp;&nbsp;\n" +
                    "                    <a href=\"/article/articleInfo/"+data.blogs.listBean[i].blogId+"#comments\" rel=\"external nofollow\">\n" +
                    "                        <i class=\"glyphicon glyphicon-comment\"></i> 7\n" +
                    "                    </a>\n" +
                    "                </span>\n" +
                    "            </span>\n" +
                    "            <div class=\"clear\"></div>\n" +
                    "        <span class=\"entry-more\">\n" +
                    "             <a href=\"article/articleInfo/"+data.blogs.listBean[i].blogId+"\" rel=\"bookmark\">阅读全文</a>\n" +
                    "        </span>" +
                    "</div>" );
	    	}
	    	var begin = data.blogs.pc-2 ;
	    	var end =  data.blogs.pc+2;
	    		if(end>=data.blogs.tp-3){
		    		end=data.blogs.tp;
		    		begin=data.blogs.tp-7
		    	}
	    		if(data.blogs.tp<8){
	    			begin = 1;
	    			end = data.blogs.tp;
	    		}
	    		if(begin<1){
		    		begin=1;
		    		end = 5;
		    	}
	    		$('ul.pagination').empty();
                 if(data.blogs.pc==1){
                     $('ul.pagination').append("<li class=\"disabled layui-bg-gray\"><span aria-hidden=\"true\">&laquo;</span> </a></li>");
                 }else{
                     $('ul.pagination').append("<li ><a href=\"javascript:void(0);\" onclick='findHot({\"method\":\""+param.method+"\",\"cid\":\""+param.cid+"\",\"pc\":\""+(data.blogs .pc-1)+"\"});\' aria-label=\"\n" +
                         "\t    \tif(data.blogs.pc==1){\n" +
                         "\t    \t\t\t\n" +
                         "\t\t\t}\"><span aria-hidden=\"true\">&laquo;</span> </a></li>");
				 }

	    		for(var i=begin;i<end+1;i++){
	    			if(i==data.blogs.pc){
	    				$('ul.pagination').append(" <li Class=\"active\"><a href=\"javascript:void(0);\" onclick='findHot({\"method\":\""+param.method+"\",\"cid\":\""+param.cid+"\",\"pc\":\""+i+"\"});'>"+i+"</a></li>");
	    				continue;
		    		}
	    			$('ul.pagination').append("<li><a href=\"javascript:void(0)\" onclick='findHot({\"method\":\""+param.method+"\",\"cid\":\""+param.cid+"\",\"pc\":\""+i+"\"});'>"+i+"</a></li>");
	    		}

	    		if(!(data.blogs.tr<8||end>=data.blogs.tp-3)){
	    			$('ul.pagination').append("<li id=\"blok\" class=\"disabled\"><span><span aria-hidden=\"true\">...</span></span></li>");
	    			$('ul.pagination').append(" <li ><a href=\"javascript:void(0);\" onclick='findHot({\"method\":\""+param.method+"\",\"cid\":\""+param.cid+"\",\"pc\":\""+(data.blogs.tp-1)+"\"});'>"+(data.blogs.tp-1)+"</a></li>");
	    			$('ul.pagination').append(" <li><a href=\"javascript:void(0);\" onclick='findHot({\"method\":\""+param.method+"\",\"cid\":\""+param.cid+"\",\"pc\":\""+(data.blogs.tp)+"\"});'>"+(data.blogs.tp)+"</a></li>");
	    		}
	    		$('ul.pagination').append("<li><a id=\"next\" href=\"javascript:void(0)\" onclick='findHot({\"method\":\""+param.method+"\",\"cid\":\""+param.cid+"\",\"pc\":\""+(data.pc+1)+"\"});' aria-label=\"Previous\"><span aria-hidden=\"true\">&raquo;</span> </a></li>");
	    		if(data.blogs.pc==data.blogs.tp){
	    			$('#next').attr("onclick","null");
	    			$('#next').parent().addClass("disabled");
	    		}else{
	    			$('#next').attr("onclick","findHot({\"method\":\""+param.method+"\",\"cid\":\""+param.cid+"\",\"pc\":\""+(data.blogs.pc+1)+"\"});");
	    			$('#next').parent().removeClass("disabled");
	    		}
//	    	}
			},
			 "json"
	)
	return false;
}
/**
 * 请求java类的博客
 * href=\"BlogServlet?category_id="+data[i].category_id+"&method=findByCid\"
 */

/*导航*/
function daohang(){
    var banOffTop=$(".navbar").offset().top;//获取到距离顶部的垂直距离
    var scTop=0;//初始化垂直滚动的距离
    $(document).scroll(function(){
        scTop=$(this).scrollTop();//获取到滚动条拉动的距离
        //console.log(scTop);查看滚动时，垂直方向上，滚动条滚动的距离
        if(scTop>=banOffTop){
            //核心部分：当滚动条拉动的距离大于等于导航栏距离顶部的距离时，添加指定的样式
            $(".navbar").addClass("fixDiv");
            $(".navbar").css("margin"," 0 auto 10px");
            $("#search-main").addClass("fixDivSearch");
            $(".container-fluid ").attr("style","width:50%");
        }else{
            $(".navbar").removeClass("fixDiv");
            $(".navbar").css("margin","");
            $("#search-main").removeClass("fixDivSearch");
            $(".container-fluid ").attr("style","width:100%");
    }

    })
}

/* 二级菜单 */

function caidan(){
    var sp =  $(this).children("a span");
    $("#menu-mainmenu li").mouseover(function(){
        $(this).parent().css("background","#666");
        // $(this).children("a").css("color","#fff");
        $(this).children("ul").show();

    });
    $("#menu-mainmenu li").mouseout(function(){
        // $(this).css("background","");
        // $(this).css("color","");
        // $(this).children("a").css("color","");
        $(this).children("ul").hide();
        // this.getElementsByTag("ul").css("display","none");
    });
}





/* 鼠标悬停 在微信出现图片 */
function weixinInfo(){
    $("#weixin_info").mouseover(function(){
        $(".weixin-code").show();
    });
    $("#weixin_info").mouseout(function(){
        $(".weixin-code").hide();
    });
}

/* 搜索按钮点击事件 */
function  serchEach() {
    $(".nav-search").click(function () {
        var searchMain = $("#search-main").css("display");
        if(searchMain == "none") {
            $("#search-main").fadeIn();
        }else {
            $("#search-main").fadeOut();
        }
    });
}
/* 时间显示 */
function TopCurrentTime() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var isnDay = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日");
    var timestr = year + "年" + month + "月" + day + "日 " + isnDay[date.getDay()];
    document.getElementById("TopCurrentTime").innerHTML = timestr;
    var timerID = setTimeout('TopCurrentTime()', 1000);
}

/*导航*/
function infoIn(){
    var banOffTop=$(".sidebar-roll").offset().top;//获取到距离顶部的垂直距离
    var scTop=0;//初始化垂直滚动的距离
    $(document).scroll(function(){
        scTop=$(this).scrollTop();//获取到滚动条拉动的距离
        //console.log(scTop);查看滚动时，垂直方向上，滚动条滚动的距离
        if(scTop>=banOffTop){
            alert("ss");
            //核心部分：当滚动条拉动的距离大于等于导航栏距离顶部的距离时，添加指定的样式
            $(".sidebar-roll").addClass("follow");
            $(".sidebar-roll").fadeIn();
        }else{
            alert("ss");
            $(".navbar").removeClass("follow");
        }

    })
}




/**
 * 用户退出
 */
function logout() {
    $.post("user/exit",
        function(data){
            if(data.result){
                layer.msg('用户已退出！',
                    {"icon":1,time:2000,skin: 'layer-ext-moon'}
                    ,function () {
                        window.location.reload();
                    })
            }
        },
        "json"
    )
}

/* 评论按钮显示 */



(
	function (){


        TopCurrentTime();

        serchEach();

        caidan();

        weixinInfo();

        daohang();

        /*回复 */
        $(".comment-body").mouseover(function(){
            $(this).find(".comment-reply-link").show();
        }).mouseout(function (){
            $(this).find(".comment-reply-link").hide();
        });

        /* 回复框点击 */
        $(".comment-reply-link").click(
           function () {
              replyDiv($(this).parents(".comment-body"));
           }
        );

        /* 取消回复框 */

        $("#cancel-comment-reply-link").click(function () {
            $("#respond").hide();
            $("#cancel-comment-reply-link").hide();
            $(".scroll-comments").after( $("#respond").show());

        });




        /**
         * 点赞 ，分享的鼠标事件
         */

        $(".favorite").mouseover(function (){
            $(".layui-icon-praise").css("color","#d03f42");
        }).mouseout(function (){
            $(".layui-icon-praise").css("color","");
        });
        $(".favorite").click(

        /*点赞*/
            function favorite() {
                var blogId= $(".favorite").data("id");
                $.post(contextPath+"/article/favorite",
                    {"blogId":blogId},
                    function (data) {
                        if(data.status==1){
                            var count = $(".count").text();
                            var countM = parseInt(count);
                            $(".count").text(countM+1);
                            $(".layui-icon-praise").css("color","#d03f42");
                        }else if(data.status==-1){
                            layer.msg(data.msg,
                                {"icon":1,time:2000,skin: 'layer-ext-moon'}
                            );
                        }else {
                            alert(data.status);
                            layer.msg(data.msg,
                                {"icon":1,time:2000,skin: 'layer-ext-moon'}
                            );
                        }
                    },
                    "json");
            }
           );
        $("#share-s").mouseover(function (){
            $(".layui-icon-share").css("color","#B3EE3A");
        }).mouseout(function (){
            $(".layui-icon-share").css("color","");
        });
       
        /**
		 * 热门标签 
		 */
		

		/*
		 * 我的博客链接点击事件
		 */
		$('#myBlog').click(function(){
			findHot({"method":"findAllByUserId"});
			$('#myBlog').parent().addClass("active");
		}
		);
		/**
		 * java类点击事件
		 */
        $('#java_cate').click(function(){
            findHot({"method":"findAllByUserId","cid":"1"});
            $('#java_cate').parent().addClass("active");
        });


        // /*
        //  * Ajax请求分类
        //  */
        // $.post(contextPath+"/category/findAll",
        //     function(data){
		// 		if(data.success) {
		// 			$('#menu_category').empty();
		// 			let categorys = data.categorys;
		// 			for (var i = 0; i < categorys.length; i++) {
		// 				$('#menu_category').append("<li><a id=\"category" + (i + 1) + "\"href=\"javascript:void(0)\" onclick='findHot({\"method\":\"findAllByUserId\",\"cid\":\"" + categorys[i].categoryId + "\"});' >" + categorys[i].categoryName + "</a></li>");
		// 			}
		// 		}else {
        //             layer.alert(data.msg, {
        //                 icon: 5,
        //                 skin: 'layer-ext-moon'
        //             })
		// 		}
        //     },
        //     "json"
        // );
	 
	 
	 
	 
   findHot({"method":"findAllByUserId"});

   $('#myBlog').parent().addClass("active");
		
	MyUtil.MainColor_Bla = "#34374C";
	MyUtil.MainColor_Black = "#2C2E3E";
	MyUtil.MainColor_Red = "#EE2B47";
	
	
	$(document).on('show.bs.modal', '.modal', function(event) {
        $(this).appendTo($('body'));
    }).on('shown.bs.modal', '.modal.in', function(event) {
        setModalsAndBackdropsOrder();
    }).on('hidden.bs.modal', '.modal', function(event) {
        setModalsAndBackdropsOrder();
    });


    function setModalsAndBackdropsOrder() {  
        var modalZIndex = 1040;
        $('.modal.in').each(function(index) {
            var $modal = $(this);
            modalZIndex++;
            $modal.css('zIndex', modalZIndex);
            $modal.next('.modal-backdrop.in').addClass('hidden').css('zIndex', modalZIndex - 1);
        });
        $('.modal.in:visible:last').focus().next('.modal-backdrop.in').removeClass('hidden');
    }
    
    
	/**
	 * 按钮实现读秒
	 * 
     * 
     * 邮箱验证码 采用ajax 请求
     */

    $('#eamilCode').click(function() {
    	var ecbtn = $("#eamilCode");
    	 $.post("user/emailCode",
		  {
              userEmail:$('[id=user_email]').val()
		  },
		  function(data){
		    if(data.valid==true){
		    	test.init(ecbtn)
		    }else{
                layer.msg(data.msg,{"icon":0,time:2000},function () {

                });
		    }
		  },
		  "json"
		  );
    });


        /**
		 * 发送邮箱验证码读秒函数
         * @type {{node: null, count: number, start: start, init: init}}
         */
    var test = {
    	       node:null,
    	       count:60,
    	       start:function(){
    	          if(this.count > 0){
    	             this.node.html(this.count--+"秒后重新获取");
    	             var _this = this;
    	             setTimeout(function(){
    	                 _this.start();
    	             },1000);
    	          }else{
    	        	  this.node.attr("disabled",false);
    	             this.node.html( "重新获取");

    	        //60秒读完，变回开始背景颜色，在这里添加。
    	             this.count = 60;
    	          }
    	       },
    	       //初始化
    	       init:function(node){
    	          this.node = node;
    	          this.node.attr("disabled",true);
    	          this.start();
    	       },
    	       //恢复
				reset:function (node) {
					this.node = node;
					this.node.attr("active",true);
					this.node.attr("value","获取验证码");
                }
    	    };
    
    /**
     * 登录按钮注册事件
     */
     $('#loginBtn').click(function() {
    	 $('#form1').submit();
     });
    
     /**
      * 
      */
    /*$('#user_name1').blur(function() {
    	 $("#msg_name").remove();
     });*/
     
    /*
     * 登录表单验证
     */
    
   function login_validaror(){
       $('#form1').bootstrapValidator({

           message: 'This value is not valid',

           feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
           },
           fields: {
               userName: {
                   message: '用户名验证失败',
                   validators: {

                       notEmpty: {
                           message: '用户名不能为空'
                       },
                       stringLength: {
                           min: 4,
                           max: 18,
                           message: '用户名长度必须在4到18位之间'
                       }
                   }
               },
               userPassword:{
                   validators:{
                       notEmpty:{
                           message: '密码不能为空'
                       }
                   }
               }
           }
       }).on("success.form.bv",function(e){
           e.preventDefault();

           // 实用ajax提交表单
           $.post($("#form1").attr('action'), $("#form1").serialize(), function(result) {
               if(result.valid==false){
                   layer.msg(result.msg,{"icon":5,time:2000});
               }else{
                    layer.msg(result.msg,{"icon":1,time:2000},function () {
                        window.location.href="index.jsp";
                    });
               }
           }, 'json');
       });
   }
       function register_validaror(){
            $("#form2").bootstrapValidator({

                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    userName: {
                        message: '用户名验证失败',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            stringLength: {
                                min: 4,
                                max: 18,
                                message: '用户名长度必须在4到18位之间'
                            },
                            threshold :  4 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                            remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                                url: 'user/checkName',  //验证地址
                                message: '用户已存在',//提示消息
                                delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                                type: 'POST',//请求方式
                                /**自定义提交数据，默认值提交当前input value*/
                                data: function(validator) {
                                    return {
                                        user_name: $('[name=userName]').val()
                                    };
                                }

                            }
                        }
                    },
                    userEmail: {
                        validators: {
                            notEmpty: {
                                message: '邮箱不能为空'
                            },
                            emailAddress: {
                                message: '邮箱地址格式有误'
                            },
                            threshold :  4 , //有4字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                            remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                                url: 'user/checkEmail',  //验证地址
                                message: '邮箱已存在',//提示消息
                                delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                                type: 'POST',//请求方式
                                /**自定义提交数据，默认值提交当前input value*/
                                data: function(validator) {
                                    return {
                                        user_email: $('[name=verifyCode]').val()
                                    };
                                }

                            }
                        }
                    },
                    userPassword:{
                        validators:{
                            notEmpty:{
                                message: '密码不能为空'
                            },
                            identical: {
                                field: 'userPassword2',
                                message: '两次密码输入不一致'
                            }
                        }
                    },
                    userPassword2:{
                        validators:{
                            notEmpty:{
                                message: '密码不能为空'
                            },
                            identical: {
                                field: 'userPassword',
                                message: '两次密码输入不一致'
                            }
                        }
                    },
                    verifyCode:{
                        validators:{
                            notEmpty:{
                                message: '验证码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 6,
                                message: '验证码长度必须6位'
                            }
                        }
                    }
                }

            }).on("success.form.bv",function(e){
                e.preventDefault();
                // 实用ajax提交表单
                $.post($("#form2").attr('action'), $("#form2").serialize(), function(result) {
                    if(result.valid==true){/*
                        $('#msg_sub').text("注册信息");
                        $('#msg_content').text(result.msg);
                        $('#mgs_regSu').modal('show');
                        $('#RegisterModal').modal('hide');
                        $("#submitButton").removeAttr("disabled");*/
						//注册成功提示信息
                        layer.alert(result.msg, {
                            icon: 6,
                            skin: 'layer-ext-moon'
                        },function(){
                        	//注册成功后清楚 表单信息
                            $("#form1")[0].reset();
                            $("#form2").data('bootstrapValidator').resetForm();
                            //移除上次的校验配置
                            $("#form2").data('bootstrapValidator').destroy();
                            $('#form2').data('bootstrapValidator',null);
                            register_validaror();

                        })
                    }else{
                    	//注册失败
                        // $("input[name='user_code']").parent().append('<small data-bv-validator="notEmpty" data-bv-validator-for="user_code" class="help-block">' + result.msg + '</small>');
                        // $("input[name='user_code']").parent().addClass("has-error");
                        layer.alert(result.msg, {
                            icon: 0,
                            skin: 'layer-ext-moon'
                        })
                    }
                }, 'json');
            });

        };
	/*
	 * 注册表单验证
	 */
        login_validaror();
     	register_validaror();

	/*
	当鼠标移动到功能块面板时：
	改变背景颜色、字体颜色
	*/
	MyUtil.setFunctionsBgColor = function (target,color) {
		target.css("background-color", color);
	};

	MyUtil.setFunctionsTvColor = function (target,color) {
		target.css("color", color);
	};

	//************************ 初始化代码************
	var mColorArr = [MyUtil.MainColor_Bla,  MyUtil.MainColor_Black, "#DB9019", "#5Ed5d1", "#ff6e97",  "#f1aaa6"]

	/* 设置三个功能块按钮鼠标滑过样式 */
	var pFuncArr = [$("#pFunc1"),$("#pFunc2"),$("#pFunc3")]
	for (let i =0; i <  pFuncArr.length; i++) {
		pFuncArr[i].mouseover(function () {			
			MyUtil.setFunctionsTvColor(pFuncArr[i],"#fff");
			MyUtil.setFunctionsBgColor(pFuncArr[i],MyUtil.MainColor_Black);
		});

		pFuncArr[i].mouseout(function () {
			MyUtil.setFunctionsTvColor(pFuncArr[i],"#000");
			MyUtil.setFunctionsBgColor(pFuncArr[i],"#fff");
		})
	}






	/* 设置小功能按钮初始颜色（随机）*/
	var pLittleFuncArr = [$(".btn_login"), $(".btn_stay"),  $(".btn_write")]
	for (var i = 0; i < pLittleFuncArr.length; i++) {
        var btnItem = pLittleFuncArr[i];
        var colorIndex = parseInt(Math.random()*6)
		btnItem.css("color", mColorArr[colorIndex]);
		btnItem.css("border-color", mColorArr[colorIndex]);
	}


})();