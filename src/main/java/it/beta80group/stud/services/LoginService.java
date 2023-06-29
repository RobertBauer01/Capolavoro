package it.beta80group.stud.services;

import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import it.beta80group.stud.dao.DataSource;
import it.beta80group.stud.dao.Userdao;
import it.beta80group.stud.model.User;
import it.beta80group.stud.model.UserInfo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.security.Key;
import java.util.Calendar;
import java.util.Date;

public class LoginService {
    private DataSource dataSource;
    private static LoginService INSTANCE = null;
    final Logger logger = LogManager.getLogger(LoginService.class);
    protected LoginService(){
        dataSource = DataSource.getInstance();
    }

    private String secret = "SkRVQ05PV0VJQ1A3Q0lXOUNXTTkzVUpYTFNDREMhbGphc2lhc2Fqbm5zZDdjQThYSEhhaHN1Y2l3aQ==";

    private Key signinKey = null;
    private Key getSigningKey() {
        if(signinKey == null) {
            byte[] keyBytes = Decoders.BASE64.decode(this.secret);
            signinKey = Keys.hmacShaKeyFor(keyBytes);
        }
        return signinKey;
    }

    public static LoginService getInstance(){
        if(INSTANCE == null){
            INSTANCE = new LoginService();
        }
        return INSTANCE;
    }


    public UserInfo doLogin(String username, String password) {
        UserInfo ui = null;
        try {
            User user = Userdao.attemptLogin(username, password);
            if(user != null){
                ui = new UserInfo();
                ui.setUserType(user.getRl());
                ui.setUsername(username);
                ui.setIdLoggedUser(user.getIdUser());
            }
            return ui;
        }catch (Exception e){
            logger.error("Unable to fetche results");
            throw new RuntimeException(e);
        }
    }

    public String createToken(UserInfo ui) {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, 3);
        Date date = c.getTime();

        String jwt = Jwts.builder()
                .addClaims(UserInfo.toMap(ui))
                .setExpiration(date)
                .signWith(getSigningKey())
                .compact();
        return jwt;
    }

    public Boolean isValid(String jwtCookieValue) {
        try{
            Jws<Claims> claimsJws = Jwts.parserBuilder()
                    .setSigningKey(getSigningKey())
                    .build()
                    .parseClaimsJws(jwtCookieValue);
            Date expiration = claimsJws.getBody().getExpiration();
            Date now = Calendar.getInstance().getTime();
            if(expiration.before(now)){
                return false;
            }
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public String cryptPassword(String password){
        return password;
    }

}
