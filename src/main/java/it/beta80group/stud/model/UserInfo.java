package it.beta80group.stud.model;

import java.util.HashMap;
import java.util.Map;

public class UserInfo {
    private String username;
    private Long userType;

    public UserInfo() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getUserType() {
        return userType;
    }

    public void setUserType(Long userType) {
        this.userType = userType;
    }

    public static Map<String, Object> toMap(UserInfo ui){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("username", ui.getUsername());
        result.put("type", ui.getUserType());
        return result;
    }
}
