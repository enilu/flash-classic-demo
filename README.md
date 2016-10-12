# flash-demo
web-flash : [https://github.com/enilu/web-flash](https://github.com/enilu/web-flash) 的示例项目

==============
## 前端集成js

* [jQuery 1.9.1](http://jquery.com/)
* [bootstrap](http://twitter.github.com/bootstrap/)
* [select2](http://ivaynberg.github.com/select2/)
* [jquery.noty](http://needim.github.com/noty/)
* [jquery.form](http://www.malsup.com/jquery/form/)
* [validation](https://github.com/jzaefferer/jquery-validation) 前端数据校验 

## 使用方式

- 下载web-flash项目

        git clone https://github.com/enilu/web-flash.git
 
 
- 将web-flash安装到本地maven仓库
  
        mvn install
   
- 初始话数据库(mysql)
 
        create database demo;
        然后执行db中的三个文件
 
- 更改config.properties中的数据库连接信息
- 导入Intellij IDEA 或者eclipse
- 运行cn.enilu.flash.web.Main类，系统使用默认端口8080启动
- 访问系统http://localhost:8080 ,用户名/密码：admin/admin
