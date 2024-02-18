// import { StatusCodes } from "http-status-codes";
const { StatusCodes } = require('http-status-codes');

function errorMiddleware(error, req, res, next) {
  console.log("\x1b[33m%s\x1b[0m", error); //에러를 콘솔에 출력합니다. 출력 문자열은 노란색으로 표시됩니다.
  res.status(StatusCodes.NOT_FOUND).json({ //클라이언트에게 404 상태 코드와 함께 JSON 응답을 보냅니다. 응답 내용은 result가 "fail"이고 error는 현재 요청의 경로
    result: "fail",
    error: `Page not found ${req.path}`,
    message: error.message,
  });
}

module.exports = errorMiddleware;