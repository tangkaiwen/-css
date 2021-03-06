﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="m_banner_edit.aspx.cs" Inherits="admin_m_banner_edit" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="/js/jquery-1.8.3.js"></script>
    <link href="/admin/style/admin.css" rel="stylesheet" />
    <script src="/js/layer.js" type="text/javascript"></script>
    <link href="/style/layer.css" rel="stylesheet" type="text/css" />
    <link href="/style/css.css" rel="stylesheet" />
    <script src="/js/jquery-twExt.js"></script>
    <%--    <script src="/js/jquery-uploadimg.js"></script>--%>
    <script>
        $(function () {
            //$.tw.loadimg();
            init();
            var id = '<%=ID%>';
            $("#btn_ok").click(function () {
                var _layer = $.layer({ type: 3 });
                var img = $(".u-imgaddress").attr("src");
                var title = $("#txt_title").val();
                var showindex = $("#txt_showindex").val();
                var url = $("#txt_url").val();
                $.ajax({
                    url: "/admin/action/actionadmin.aspx",
                    type: "POST",
                    data: {
                        action: "saverebanner",
                        id: id,
                        img: img,
                        title: title,
                        showindex: showindex,
                        url: url
                    }, dataType: "json",
                    success: function (result) {
                        if (result.res > 0) {
                            alert(result.desc);
                            location.href = "/admin/m_banner.aspx";
                            layer.close(_layer);
                        }
                        else {
                            alert(result.desc);
                            layer.close(_layer);
                        }
                    }, fail: function () { alert("请求失败！"); }
                });
            });

            $(".btn_uploadimg").click(function () {
                $.tw.photo.uploadImage({ single: true, area: ['800px', '400px'] }).done(function (result) {
                    var tn = result.result[0].tn;
                    var id = result.result[0].id;
                    $(".u-imgaddress").attr("src", tn);
                });
            });
        });

        var init = function () {
            if (typeof (jsonbanner) != 'undefined' && jsonbanner.length > 0) {
                $(".txt_title").val(jsonbanner[0].Title);
                $(".txt_url").val(jsonbanner[0].URL);
                $(".txt_showindex").val(jsonbanner[0].ShowIndex);
                $(".u-imgaddress").attr("src", jsonbanner[0].ImgAddress);
            }
        }
    </script>
</head>
<body>
    <form id="form2" runat="server">
        <div class="e_box">
            <div class="e-item">
                <span class="sp150">标题：</span>
                <input type="text" maxlength="200" class="txt_title" runat="server" id="txt_title" />
            </div>
            <div class="e-item">
                <span class="sp150">URL：</span>
                <input type="text" maxlength="200" value="http://" class="txt_url" runat="server" id="txt_url" />

            </div>
            <div class="e-item">
                <span class="sp150">排序：</span>
                <input type="text" maxlength="5" class="txt_showindex" value="1" runat="server" id="txt_showindex" />
            </div>
            <div class="e-item">
                <span class="sp150">图片：</span>
                <img class="u-imgaddress" width="200" height="130" src="" />
                <a class="inpbbut3 btn_uploadimg">选择图片</a>
            </div>
        </div>
        <div class="btn-content" style="margin-left: 200px;">
            <input type="button" id="btn_ok" class="inpbbut3" value="保存" />
        </div>
    </form>
</body>
</html>
