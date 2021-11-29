<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2021-11-19
  Time: 오후 12:28
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
    <H1 class="">logo</H1>
    <form method="post" action="">
      <div class="form_box">
          <h3 class="login_tit">Login</h3>
          <input type="text" class="login_id input_sty" placeholder="ID" name="id" maxlength="15">
          <input type="text" class="login_pw input_sty" placeholder="PW" name="password" maxlength="15">
          <input type="submit" class="login_btn" placeholder="로그인버튼" value="Login">
          <p>Don’t you have ID? <a href="/signup">sign up</a></p>
      </div>
    </form>
  </div>
</body>
<script>
    <%--   Jquery 공간--%>
</script>
</html>
