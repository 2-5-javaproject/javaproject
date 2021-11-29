# javaproject
- eclipse와 다르게 intellij는 Extra Config를 사용하지 않고 tomcat의 원래 server.xml을 사용한다.
- Tomcat의 수정이 필요한 경우의 tomcat home에 위치해있는 conf/server.xml을 직접 수정해서 사용해야 톰캣 설정이 변경된다.

```xml
<!--   <Host> 태그 내부에 경로를 설정해줘야한다.-->
  <Context path="" docBase="본인프로젝트경로\javaproject\web" reloadle="false"></Context>
```
