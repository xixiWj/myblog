(
    function () {

        $("#wp-submit").click(

            function () {
                var prevLink = document.referrer;
                $('#wp-submit').button('loading');
                var name = $("#user_login").val();
                var pwd = $("#user_pass").val();
                var encrypt = new JSEncrypt();
                // var key =mydate.getDay()+ mydate.getHours()+ mydate.getMinutes()+mydate.getSeconds()+mydate.getMilliseconds();
                if (name == "" || pwd == "") {
                   // pw showMsg("密码不能为空", "info", 2000);、
                    alert("密码不能为空");
                    $('#wp-submit').button('reset');
                } else {
                    $.ajax({
                        type: 'POST',
                        url: '/user/getPublicKey',
                        async: false,
                        data: {
                            'userName': name
                        },
                        success:function(data){
                            if(data.rel==1) {
                                alert(pwd);
                                var publicKeyJS = data.publicKey;
                                alert(publicKeyJS);
                                encrypt.setPublicKey(publicKeyJS);
                                pwd = encrypt.encrypt(pwd);
                                    $.ajax({
                                    type: "POST",
                                    url: '/user/login',
                                    async: false,
                                    data: {
                                        'userName':name,
                                        'userPassword':pwd
                                    },success :function(data2){
                                        alert("ss");
                                         if(data2.rel==1){
                                             $('#wp-submit').button('reset');
                                             layer.msg('登陆成功',
                                                 {"icon":1,time:2000,skin: 'layer-ext-moon'}
                                                 ,function () {
                                                     window.location.href = '/user';
                                                 })
                                         }else {
                                             $('#wp-submit').button('reset');
                                         }
                                    }
                                })

                        }
                        }

                    });
                }
         }
        )



        // function (data) {
        //     localStorage.setItem('loginName', $("#login-name").val());
        //     if (data.code == 1) {
        //         $.toast({
        //             text: data.msg,
        //             heading: heading,
        //             icon: 'success',
        //             showHideTransition: 'fade',
        //             allowToastClose: true,
        //             hideAfter: 1000,
        //             stack: 1,
        //             position: 'top-center',
        //             textAlign: 'left',
        //             loader: true,
        //             loaderBg: '#ffffff',
        //             afterHidden: function () {
        //                 if ($.trim(prevLink) == '') {
        //                     window.location.href = '/admin';
        //                 } else {
        //                     window.location.href = prevLink;
        //                 }
        //             }
        //         });
        //     } else {
        //         $('.login-body').addClass('animate shake');
        //         $.toast({
        //             text: data.msg,
        //             heading: heading,
        //             icon: 'error',
        //             showHideTransition: 'fade',
        //             allowToastClose: true,
        //             hideAfter: 2000,
        //             stack: 1,
        //             position: 'top-center',
        //             textAlign: 'left',
        //             loader: true,
        //             loaderBg: '#ffffff',
        //             afterHidden: function () {
        //                 $('.login-body').removeClass('animate shake');
        //             }
        //         });
        //         $('#btn-login').button('reset');
        //     }
        // }
    }
)();