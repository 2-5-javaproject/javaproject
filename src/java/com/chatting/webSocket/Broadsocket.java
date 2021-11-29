package java.com.chatting.webSocket;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

// 웹소켓 요청을 받는 endpoint
@ServerEndpoint("/broadcasting") // <- endpoint의 경로
public class Broadsocket{
    // 웹소켓 연결이 구성되면, Session(Session 인스턴스는 웹소켓이 닫히기 전까지 유효)이 생성되고
    // @OnOpen 어노테이션이 붙은 endpoint가 호출된다.

    // 접속한 클라이언트 목록을 Set 컬렉션으로 만듬
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

    @OnMessage // 웹소켓 endpoint가 메시지를 수신하면 @OnMessage 어노테이션이 붙은 매서드 호출
    public void onMessage(String message, Session session) throws IOException {
        System.out.println(message);

        for(Session client : clients) {
            if (!client.equals(session)){
                client.getBasicRemote().sendText(message);
            }
        }
    }

    @OnOpen // 클라이언트 접속 시
    public void onOpen(Session session) {
        System.out.println(session);
        clients.add(session);
    }

    @OnClose // 클라이언트 접속 해제 시
    public void onClose(Session session) {
        clients.remove(session);
    }
}
