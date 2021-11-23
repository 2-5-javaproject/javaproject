package com.chatting.Client;


import javax.websocket.ClientEndpoint;
import javax.websocket.ContainerProvider;
import javax.websocket.WebSocketContainer;

@ClientEndpoint
public class Client {
    // 웹소켓
    WebSocketContainer container = ContainerProvider.getWebSocketContainer();
}
