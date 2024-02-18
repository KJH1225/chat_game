import React, { useEffect, useState } from 'react'
import { NavLink } from 'react-router-dom'
import io from 'socket.io-client';
import RoomList from '../../components/RommList/RoomList'
import './Join.css'
import { API_URL } from '../../config/contansts'
// let socket;

const Join = () => {
  const [socket, setSocket] = useState(null);
  const [name, setName] = useState('');
  const [room, setRoom] = useState('');
  const [roomList, setRoomList] = useState([]);

  useEffect(() => {

    // 소켓 연결 설정
    const socket = io(API_URL, {
      cors: {
        origin: "*",
      }
    });
    setSocket(socket);

    // 서버에 'join' 이벤트를 emit하여 사용자를 방에 추가
    socket.emit('roomList');

    // 클라이언트에서 'roomList' 이벤트 수신
    socket.on('roomList', (rooms) => {
      // 서버로부터 전달받은 방 목록을 콘솔에 출력
      console.log("Received room list:", rooms);
      setRoomList(rooms);
    });

  }, []);

  return (
    <div className='joinOuterContainer'>
      <div className='joinInnerContainer'>
        <h1 className='heading'>join</h1>
        <div>
          <input
            placeholder='이름'
            className='joinInput'
            type='text'
            onChange={(event) => setName(event.target.value)}
          />
        </div>
        <div>
          <input
            placeholder='채팅방'
            className='joinInput mt-20'
            type='text'
            onChange={(event) => setRoom(event.target.value)}
          />
        </div>
        <NavLink
          onClick={(e) => (!name || !room ? (e.preventDefault()) : null)}
          to={`/chat?name=${name}&room=${room}`}
        >
          <button className={'button mt-20'} type='submit'>
            가입
          </button>
        </NavLink>
      </div>

      <RoomList roomList={roomList}/>
    </div>
  )
}

export default Join