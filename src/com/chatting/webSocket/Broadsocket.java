package com.chatting.webSocket;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;

// 웹소켓 요청을 받는 endpoint
@ServerEndpoint("/WebSocket") // <- endpoint의 경로
public class Broadsocket{
    // 웹소켓 연결이 구성되면, Session(Session 인스턴스는 웹소켓이 닫히기 전까지 유효)이 생성되고
    // @OnOpen 어노테이션이 붙은 endpoint가 호출된다.
    // 접속한 클라이언트 목록을 List 컬렉션으로 만듬

    private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());

    public List<Session> getUserList(){
        return clients;
    }

    @OnMessage // 웹소켓 endpoint가 메시지를 수신하면 @OnMessage 어노테이션이 붙은 매서드 호출
    public void onMessage(String message, Session session) throws IOException {

        for(Session client : clients) {
            if (!client.equals(session)){
                client.getBasicRemote().sendText(message);
            }
        }
    }

    @OnOpen // 클라이언트 접속 시
    public void onOpen(Session session) {
        clients.add(session);
    }

    @OnClose // 클라이언트 접속 해제 시
    public void onClose(Session session) {
        clients.remove(session);
    }

    @OnError // 소켓 에러 시 호출
    public void handleError(Throwable e){
        e.printStackTrace();
    }
}
