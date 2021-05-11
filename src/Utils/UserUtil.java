package Utils;

import javax.servlet.http.HttpServletRequest;
import java.util.Random;

public class UserUtil {
//    public static String getRemortIP(HttpServletRequest request) {
//
//        if (request.getHeader("x-forwarded-for") == null) {
//            return request.getRemoteAddr();
//        }
//        return request.getHeader("x-forwarded-for");
//    }

    public static String getRemoteIP(HttpServletRequest request){
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
    }

    public static String getHeader(HttpServletRequest request) {
        return request.getHeader("User-Agent");
    }

    public static String getRandomNum(int num) {
        Random r = new Random();
        String i = String.valueOf(r.nextInt(num) + 1);
        return i;
    }
}
