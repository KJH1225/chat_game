const express = require('express');
const app = express();
const path = require("path");
require("dotenv").config();
const PORT = process.env.PORT || 8002
const cookieParser = require("cookie-parser");
const http = require('http');
const socketIO = require('socket.io');
const multer = require("multer"); //파일 업로드
const cors = require('cors');
const { sequelize } = require("./database/schemas"); //DB테이블

const errorMiddleware = require("./utils/errorMiddleware");
const router = require('./routers/router');
const { addUser, removeUser, getUser, getUsersInRoom, getAllUser } = require('./utils/user');
const { addRoom, removeRoom, addUserToRoom, removeUserFromRoom, getRooms } = require('./utils/room');  // 방 관리 모듈

//시퀄라이즈 연결 부분
sequelize
  .sync({ force: false}) //force가 true면 킬때마다 DB 새로 만듬
  .then(() => {
    console.log("DB연결 성공");
  })
  .catch((err) => {
    console.error(err);
  });

//쿠키파서
app.use(cookieParser());
// URL-encoded방식 사용할수있게 설정 (.urlencoded()은 x-www-form-urlencoded형태의 데이터를 해석  )
// json형식의 데이터를 처리할 수 있게 설정 (.json()은 JSON형태의 데이터를 해석.)
// 자세한 설명: https://kirkim.github.io/javascript/2021/10/16/body_parser.html
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cors());

app.use(router);
app.use(errorMiddleware);

//소켓부분?
const server = http.createServer(app);
const io = socketIO(server, {
  cors: {
    origin: "http://localhost:3000",
    methods: ["GET", "POST"],
    credentials: true,
  }
});
// socketHandlers 모듈을 불러와서 실행
const socketHandlers = require('./utils/socketHandlers')(io);


app.use(express.static(path.join(__dirname, "../client/build")));
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "../client/build/index.html"));
});

server.listen(PORT, () => {
  console.log(`${PORT}번 포트에서 서버 실행중...`);
});
