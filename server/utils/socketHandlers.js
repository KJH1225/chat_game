const { addUser, removeUser, getUser, getUsersInRoom, getAllUser } = require('./user');
const { addRoom, removeRoom, addUserToRoom, removeUserFromRoom, getRooms } = require('./room');

module.exports = (io) => {

  io.on('connection', (socket) => {
    console.log('새로운 connection이 발생하였습니다.');

    // 'join' 이벤트를 처리하는 부분
    socket.on('join', ({ name, room }, callback) => {

      
      // addUser 함수를 사용하여 사용자를 추가하고, 추가된 사용자 정보와 에러 여부를 가져오기
      const { error, user } = addUser({ id: socket.id, name, room });
      console.log("사용자 목록: ", getAllUser());
      
      // 에러가 발생한 경우, 클라이언트에 에러 메시지를 콜백 함수를 통해 전달하고 함수 종료
      if (error) {
        callback({ error: '아이디 중복' })
      }else {
        //방 생성 
        const { room: addedRoom } = addRoom(room);

        //방에 사용자 추가
        addUserToRoom(addedRoom, user.name);

        // 'message' 이벤트를 사용자에게 보내기
        socket.emit('message', {
            user: 'admin',
            text: `${user.name}님, ${user.room}에 오신 것을 환영합니다.`,
        });

        // 다른 사용자에게 'message' 이벤트를 브로드캐스트하여 새로운 사용자 가입 알림
        socket.broadcast.to(user.room).emit('message', {
            user: 'admin',
            text: `${user.name} 님이 가입하셨습니다.`,
        });

        
        // 해당 사용자를 특정 방에 조인시키기
        socket.join(user.room);

        // 'roomData' 이벤트를 특정 방에 속한 모든 클라이언트에게 보내기
        io.to(user.room).emit('roomData', {
            room: user.room,
            users: getUsersInRoom(user.room), // 해당 방에 속한 사용자 목록 가져오기
        });

        // 클라이언트에게 콜백 함수 호출
        callback();
      }
    });

    //* 클라이언트로부터 메시지 수신
    socket.on('roomList', () => { // reply라는 이벤트로 송신오면   메세지가 data인수에 담김
      const rooms = getRooms();
      console.log("rooms: ", rooms);

      socket.emit('roomList', rooms);
    });


    // 클라이언트에서 'sendMessage' 이벤트를 수신할 때의 처리
    socket.on('sendMessage', (message, callback) => {
      console.log('수신 받은 메세지: ', message);
      // 현재 소켓 ID를 사용하여 사용자 정보 가져오기
      const user = getUser(socket.id);

      // 현재 방에 속한 모든 클라이언트에게 'message' 이벤트를 emit하여 메시지 브로드캐스트
      io.to(user.room).emit('message', { user: user.name, text: message });

      // 클라이언트에서 제공된 콜백 함수 호출하여 클라이언트 측의 작업 완료 신호 전달
      callback();
    });

    
    // 클라이언트의 연결이 끊겼을 때의 처리
    socket.on('disconnect', () => {
      // 소켓 ID를 사용하여 해당 사용자를 제거하고 제거된 사용자 정보 가져오기
      const user = removeUser(socket.id);

      // 만약 사용자 정보가 존재한다면 (연결이 성공적으로 제거되었다면)
      if (user) {
          // 'message' 이벤트를 통해 모든 클라이언트에게 방을 나간 사용자의 메시지 브로드캐스트
          io.to(user.room).emit('message', {
              user: 'Admin',
              text: `${user.name} 님이 방을 나갔습니다.`,
          });

          //방에서 사용자 제거
          removeUserFromRoom(user.room, user.name);

          // 'roomData' 이벤트를 통해 방의 정보와 해당 방에 속한 사용자 목록 업데이트 브로드캐스트
          io.to(user.room).emit('roomData', {
              room: user.room,
              users: getUsersInRoom(user.room),
          });
      }

      // 서버 측 콘솔에 유저가 나갔음을 로깅
      console.log('유저가 떠났어요.');
    });
  })

}