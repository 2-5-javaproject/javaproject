<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.chatting.Friend.FriendDAO" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CHAT JAVA</title>
    <link rel="stylesheet" href="https://use.typekit.net/pnh7kfy.css">
    <script>
        (function (d) {
            var config = {
                    kitId: 'lto7oob',
                    scriptTimeout: 3000,
                    async: true
                },
                h = d.documentElement, t = setTimeout(function () {
                    h.className = h.className.replace(/\bwf-loading\b/g, "") + " wf-inactive";
                }, config.scriptTimeout), tk = d.createElement("script"), f = false,
                s = d.getElementsByTagName("script")[0], a;
            h.className += " wf-loading";
            tk.src = 'https://use.typekit.net/' + config.kitId + '.js';
            tk.async = true;
            tk.onload = tk.onreadystatechange = function () {
                a = this.readyState;
                if (f || a && a != "complete" && a != "loaded") return;
                f = true;
                clearTimeout(t);
                try {
                    Typekit.load(config)
                } catch (e) {
                }
            };
            s.parentNode.insertBefore(tk, s)
        })(document);
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../CSS/reset.css">
    <link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
<%;String nickname = (String) session.getAttribute("sessinID");%>
<div class="main_box">
    <div class="form_bg">
        <form method="post" action="">
            <div class="form_box">
                <h3 class="login_tit user">User</h3>
                <input type="text" class="login_id input_sty Filter_sty" placeholder="Filter" name="Filter"
                       maxlength="15">
            </div>
        </form>
        <dl class="user_box">
            <dt>Friend</dt>
            <div id="friendList">
                <dd class="friend">Friend_1</dd>
            </div>
            <dt>User</dt>
            <div id="userList">
            <%--채팅 접속자 표시--%>
            </div>
        </dl>
    </div>
    <div class="chat_bg">
        <div class="chat_area" id="chat-container">
        <%--채팅 공간--%>
        </div>
        <div class="send_box">
            <input class="send_in" placeholder="" type="text" name="text" id="inputMessage" onkeyup="enterkey()">
            <input class="send_btn" placeholder="send" type="submit" value="send" onclick="send()">
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var inputMessage = document.getElementById('inputMessage');
    var webSocket = new WebSocket('ws://localhost:8090/javaproject/WebSocket');

    webSocket.onopen = function (event) {
        onOpen(event)
    };
    webSocket.onerror = function (event) {
        onError(event)
    };
    webSocket.onmessage = function (event) {
        onMessage(event)
    };

    function onOpen(event) {
        console.log("연결 성공");
    }

    function onMessage(event) {
        var msg = event.data;

        var $chat = $("<dl class='chat_box chat_box_you'> + " +
            "<dt>상대 이름</dt>" +
            "<dd>" + msg + "</dd>" +
            "</dl>"
        )
        $('#chat-container').append($chat);
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
    }

    function send() {
        var msg = inputMessage.value;
        if (msg == '') {
            return;
        }
        var $chat = $("<dl class='chat_box chat_box_me'> " +
            "<dt>" + "<%=nickname%>" + "</dt>" +
            "<dd class='chat'>" + msg + "</dd>" +
            "</dl>"
        )
        $('#chat-container').append($chat);
        webSocket.send(msg);
        inputMessage.value = "";
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
    }

    function enterkey() {
        if(window.event.keyCode == 13) {
            send();
        }
    }
    $(function() {
        var $user = $("<dd class='user'><a href=''>" + "<%=nickname%>" + "</a></dd>");
        $('#userList').append($user);
        $('#userList').scrollTop($('#userList')[0].scrollHeight + 10);
    });
    $(function() {
        var $friend = $("<dd class='friend'>" + "<%=nickname%>" + "</dd>");
        $('#userList').append($user);
        $('#userList').scrollTop($('#userList')[0].scrollHeight + 10);
    });
</script>
</html>
