﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// PageBase 的摘要说明
/// </summary>
public class PageBase : System.Web.UI.Page
{
    /// <summary>
    /// 是否需要登录，默认为需要
    /// </summary>
    /// <returns></returns>
    protected virtual bool NeedLogin
    {
        get
        {
            return true;
        }
    }
    protected override void OnLoad(EventArgs e)
    {

        base.OnLoad(e);
    }

    protected override void OnInit(EventArgs e)
    {
        if (NeedLogin && !UserIsLogin)
        {
            RedirectToLoginPage();//跳转到登录页面
            return;
        }
        base.OnInit(e);

    }

    /// <summary>
    /// 跳转到登录页面(执行于服务端)
    /// </summary>
    public void RedirectToLoginPage()
    {
        Response.Clear();
        string url = "http://" + Request.Url.Host + "/admin/login.aspx";
        Response.Write("<script>parent.location='" + url + "';</script>");
        Response.End();
        //Response.Clear(); 
        //Response.Redirect(url, true);
        //  Response.End();
    }
    #region 用户登录相关
    /// <summary>
    /// 用户唯一标识ID
    /// </summary>
    public int UserID
    {
        get
        {
            return SessionAccess.UserId;
        }
    }
    /// <summary>
    /// 判断用户是否登录
    /// </summary>
    public bool UserIsLogin
    {
        get
        {
            return SessionAccess.IsLogin;
        }
    }
    #endregion
    /// <summary>
    /// 返回json格式数据
    /// 
    /// </summary>
    /// <param name="obj">
    /// 
    /// 表格：new DataGridJson() { total = total, rows = dt }
    /// 其他任意
    /// </param>
    public void ResponseJson(object obj)
    {
        Response.Clear();
        Response.ContentType = "application/json";
        // 返回到前台的值必须按照如下的格式包括 total and rows 
        string json = Newtonsoft.Json.JsonConvert.SerializeObject(obj);
        Response.Write(json);
        Response.End();
    }
}

public class DataGridJson
{
    public int total { get; set; }
    public object rows { get; set; }
}