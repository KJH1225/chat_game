const rooms = [];

const addRoom = (roomName) => {
  //앞뒤 공백 제거
  const room = roomName.trim().toLowerCase(); 

  // if (rooms.includes(room)) {
  //   return '생성 안됨 있던 방';
  // }
  if (rooms.some(existingRoom => existingRoom.name.toLowerCase() === room)) {
    return { room: roomName };
  }

  // rooms.push(room);
  rooms.push({ name: room, users: [] });

  return { room };
};

// 방 제거 함수
const removeRoom = (roomName) => {
  const room = roomName.trim().toLowerCase();

  const index = rooms.findIndex((r) => r.name === room);
  if (index !== -1) {
    rooms.splice(index, 1);
    return { room };
  }

  return { error: '존재하지 않는 방입니다.' };
};


// 방에 사용자 추가 함수
const addUserToRoom = (roomId, user) => {
  console.log("방에 user추가: ", roomId, user);
  const room = rooms.find((r) => r.name === roomId);

  if (room) {
    room.users.push(user);
    console.log("room에 user 추가: ", room);
  }
};

// 방에서 사용자 제거 함수
const removeUserFromRoom = (roomId, userId) => {
  
  //사용자가 들어있는 방 찾기
  const index = rooms.findIndex((r) => r.name === roomId);
  
  if (index !== -1) {
    // 해당 방에서 사용자 제거
    rooms[index].users = rooms[index].users.filter((user) => user !== userId);

    // 방이 비어있는지 확인하고 비어있다면 방을 제거
    if (rooms[index].users.length === 0) {
      rooms.splice(index, 1);
      console.log(`방 '${roomId}'이 비어있어서 제거되었습니다.`);
    }
  }
};

// 방 목록 가져오기 함수
const getRooms = () => rooms;


module.exports = { addRoom, removeRoom, addUserToRoom, removeUserFromRoom, getRooms };