/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class CookieUtils {

    public static Cookie add(String name, String value, int hour,
            HttpServletResponse response) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(60 * 60 * hour);
        cookie.setPath("/");
        response.addCookie(cookie);
        return cookie;

    }

    // for find a cookie in a group of cookie
    public static String get(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equalsIgnoreCase(name)) {
                return cookie.getValue();
            }
        }
        return "";
    }
}
