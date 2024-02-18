// const express = require('express');
// const router = express.Router();
const jwt = require('jsonwebtoken'); 
require('dotenv').config();
const { verify, refreshVerify, makeAccessToken, makeRefreshToken} = require("./token");

// 사용자 전용 페이지 들어가기전 검증 미들웨어 
const authMiddleware = async (req, res, next) => {
  try {
    const accessToken = req.cookies.accessToken;
    const refreshToken = req.cookies.refreshToken;
    console.log('verify.get.accessToken: ', accessToken);
    console.log('verify.get.refreshToken: ', refreshToken);
    const accessTokenResult = await verify(accessToken);  
    const decode = jwt.decode(accessToken); 
    console.log("verify.get.accessTokenResult: ",accessTokenResult.ok);
    const refreshTokenResult = await refreshVerify(refreshToken, decode.id);
    console.log("verify.get.refreshTokenResult: ",refreshTokenResult);

    if (accessTokenResult.ok == false || accessToken == undefined) { //accToken 쿠키없음
      if (refreshTokenResult == false || refreshToken == undefined) { //refreshToken 쿠키도 없음
        console.log("다시로그인!");
        //다시로그인!

        res.clearCookie('accessToken');
        res.clearCookie('refreshToken');
        res.status(302).json({ 
          ok: false,
          message: '다시로그인',
          url: '/login'
        });
      }else{ //accToken은 없는데 reToken은 있음 
        // const userId = redisClient.keys('123');
        
        // reToken으로 accToken재생성
        const decoded = jwt.decode(accessToken);
        console.log("accessTokenResult.decoded: ",decoded);
        console.log("accessTokenResult.accessToken: ",accessToken);
        console.log("accessTokenResult.req.cookies.accessToken: ", req.cookies.accessToken);
        const newAccessToken = makeAccessToken({id: decoded.id});
        res.cookie('accessToken', newAccessToken, {
          httpOnly : true,
          secure : false,
          sameSite : 'strict',
        });
        console.log('accessToken 재생성!');
        // res.status(200).json({ 
        //   ok: true,
        //   message: 'accessToken 재생성!' 
        // });
        req.userId = decode.id; 
        next();
      }
    }else{ //accToken있음
      //통과!
      console.log('accessToken유효 통과!');
      // res.status(200).json({ 
      //   ok: true,
      //   message: 'accToken유효 통과!' 
      // });
      req.userId = decode.id;
      next();
    }
  } catch (error) {
    // 오류 발생 시 에러 로그를 출력
    console.error("토큰 유효성 검사 실패 다시 로그인", error);
    // 에러 응답 전송 (클라이언트에서 토큰 유효성 검증 실패를 처리할 수 있도록)
    // res.status(500).json(error);
    res.status(302).json({ 
      ok: false,
      message: '다시로그인',
      url: '/login'
    });
  }
};

module.exports = authMiddleware;