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
  <link rel="stylesheet" href="CSS/reset.css">
  <link rel="stylesheet" href="CSS/style.css">
  </head>
<body>
  <div class="main_box">
    <div class="form_bg">
      <form method="post" action="">
        <div class="form_box">
            <h3 class="login_tit user">User</h3>
            <input type="text" class="login_id input_sty Filter_sty" placeholder="Filter" name="Filter" maxlength="15">
        </div>
      </form>
      <dl class="user_box">
        <dt>Friend</dt>
        <dd class="friend">Friend_1</dd>
        <dt>User</dt>
        <dd class="user">Friend_1</dd>
      </dl>
    </div>
    <div class="chat_bg">
      <div class="chat_area">
        <dl class="chat_box chat_box_you">
          <dt>Friend_1</dt>
          <dd class="chat">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</dd>
          <dd class="chat">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </dd>
        </dl>
        <dl class="chat_box chat_box_me">
          <dt>Friend_1</dt>
          <dd class="chat">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</dd>
          <dd class="chat">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </dd>
        </dl>
      </div>
        <div class="send_box">
          <input class="send_in"placeholder="" type="text" name="text" id="text">
          <input class="send_btn" placeholder="send" type="submit" value="send">
        </div>
    </div>
  </div>
    <%-- 
        <fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
        </fieldset>
     --%>
</body>
<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://localhost:8090/javaproject/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };

    webSocket.onopen = function(event) {
        onOpen(event)
    };

    webSocket.onmessage = function(event) {
        onMessage(event)
    };

    function onMessage(event) {
        textarea.value += "상대 : " + event.data + "\n";
    }

    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }

    function onError(event) {
        alert(event.data);
    }

    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
</script>
<script>
    <%--   Jquery 공간--%>
</script>
</html>
