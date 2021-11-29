<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-11-11
  Time: 오후 7:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CHAT JAVA</title>
  <link rel="stylesheet" href="https://use.typekit.net/pnh7kfy.css">
  <script>
    (function(d) {
      var config = {
        kitId: 'lto7oob',
        scriptTimeout: 3000,
        async: true
      },
      h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
    })(document);
  </script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="../CSS/reset.css">
  <link rel="stylesheet" href="../CSS/style.css">
  </head>
  <body>
    <div class="main_box">
      <div class="img_box">
        <img src="#" alt="main imges">
      </div>
      <div class="main_tit_box">
        <h1 class="main_tit">C<span class="high_color">HA</span>T<br/><span class="">JAVA PRO</span></h1>
        <p class="main_txt">Lorem Ipsum is simply dummy text of the prin tingand typesetting industry. Lorem Ipsum</p>
      </div>
      <a href="/signup" class="singUP_btn">Sign Up</a>
      <a href="/login" class="login_btn">Login</a>
    </div>
  </body>
  <script>
<%--   Jquery 공간--%>
  </script>
</html>
