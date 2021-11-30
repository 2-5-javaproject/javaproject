package com.chatting.webSocket;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;


public class WebServer {
    final int SERVER_PORT = 9090;
    ServerSocket serverSocket = null;
    List<PrintWriter> listWriters = new ArrayList<PrintWriter>();
//    try {
//        serverSocket = new ServerSocket();
//
//        String hostAddress = InetAddress.getLocalHost().getHostAddress();
//        serverSocket.bind(new InetSocketAddress(hostAddress, SERVER_PORT));
//        System.out.println("[server] binding! \naddress:" + localHostAddress + ", port:" + SERVER_PORT);
//
//        while(true) {
//            Socket socket = serverSocket.accept();
//            new ProcessThread(socket, listWriters).start();
//        }
//    }catch (IOException e){
//        e.printStackTrace();
//    }finally {
//        try {
//            if(serverSocket != null && !serverSocket.isClosed()) {
//                serverSocket.close();
//            }
//        }catch (IOException e){
//            e.printStackTrace();
//        }
//    }
}
