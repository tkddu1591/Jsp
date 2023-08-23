package sub3;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

@WebListener
public class MySessionListener implements HttpSessionAttributeListener {
    public MySessionListener() {
        System.out.println("MySessionListener()...");
    }
/*
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("MySessionCreated()...");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("MySessionDestroyed()...");
    }*/

    int count =0;
    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        System.out.println("attributeAdded()...");
        count++;
        System.out.println("로그인 사용자 수 : "+count);
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent se) {
        System.out.println("attributeRemoved()...");
        count--;
        System.out.println("로그인 사용자 수 : "+count);
    }
}
