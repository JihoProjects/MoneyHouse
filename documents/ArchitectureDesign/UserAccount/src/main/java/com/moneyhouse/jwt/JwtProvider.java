package com.moneyhouse.jwt;

import java.security.Key;
import java.util.Date;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

public class JwtProvider {

    /**
     * Secret Key Value
     */
    private final Key key;

    /**
     * Token 유효시간
     */
    private long tokenValidMilisecond = 5 * 60 * 1000L;

    /**
     * 키를 암호화 하여 저장하고, 객체 생성
     * @param secret
     */
    public JwtProvider(String secret) {
        this.key = Keys.hmacShaKeyFor(secret.getBytes());
    }

    /**
     * 유저 정보를 받아 토큰을 생성합니다.
     * 
     * @param user_id
     * @param user_name
     * @return 토큰
     */
    public String createToken(String user_id, String user_name) {

        Date now = new Date();

        String token = Jwts.builder()
                .claim("user_id", user_id)
                .claim("user_name", user_name)
                .setIssuedAt(now)
                .setExpiration(new Date(now.getTime() + tokenValidMilisecond))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();

        return token;

    }

    /**
     * 토큰을 받아 실제 값으로 파싱하여 반환
     * @param token
     * @return
     */
    public Claims getClaims(String token) {

        return Jwts.parser()
                .setSigningKey(key)
                .parseClaimsJws(token)
                .getBody();

    }

    /**
     * 토큰으로 user_id 얻기
     * @param token
     * @return
     */
    public String getUserID(String token) {

        return Jwts
                .parser()
                .setSigningKey(key)
                .parseClaimsJws(token)
                .getBody()
                .get("user_id")
                .toString();

    }

    /**
     * 토큰의 유효시간 확인
     * @param token
     * @return
     */
    public boolean validateToken(String token) {
        try {
            Jws<Claims> claims = Jwts.parser().setSigningKey(key).parseClaimsJws(token);
            return !claims.getBody().getExpiration().before(new Date());
        } catch (Exception e) {
            return false;
        }
    }

}
