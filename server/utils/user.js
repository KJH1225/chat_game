const users = [];

// 사용자 추가 함수
const addUser = ({ id, name, room }) => {
  // 이름과 방의 공백 제거 및 소문자로 변환
  name = name.trim().toLowerCase();
  room = room.trim().toLowerCase();

  // 이미 사용 중인 사용자 확인
  const existingUser = users.find(
    (user) => user.room === room && user.name === name
  );

  // 이름 또는 방이 누락된 경우 에러 반환
  if (!name || !room) return { error: '사용자 이름과 방이 필요합니다.' };
  // 이미 사용 중인 이름인 경우 에러 반환
  if (existingUser) return { error: '이미 사용중인 이름입니다.' };

  // 사용자 정보 생성 및 배열에 추가
  const user = { id, name, room };
  users.push(user);

  return { user };
};

// 사용자 제거 함수
const removeUser = (id) => {
  const index = users.findIndex((user) => user.id === id);

  // 해당 사용자가 배열에 존재하면 제거하고 반환
  if (index !== -1) return users.splice(index, 1)[0];
};

// ID를 기반으로 사용자 찾기 함수
const getUser = (id) => {
  console.log("users: ", users);
  return users.find((user) => user.id === id);
};

// 특정 방에 속한 모든 사용자 찾기 함수
const getUsersInRoom = (room) => users.filter((user) => user.room === room);

const getAllUser = () => users;

// 모듈 내보내기
module.exports = { addUser, removeUser, getUser, getUsersInRoom, getAllUser };