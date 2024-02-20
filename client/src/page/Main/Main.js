import React, { useEffect, useState } from 'react'
import { NavLink } from 'react-router-dom'
import io from 'socket.io-client';
import axios from 'axios';
import { API_URL } from '../../config/contansts'
import { useRecoilState } from "recoil";
import { loginState, nameState, roomState } from "../../recoil/atoms/State";
import { errHandler } from '../../utils/globalFunction';
import RoomList from '../../components/RommList/RoomList'
import './Main.css'

const Main = () => {
  const [socket, setSocket] = useState(null);
  const [islogin, setIslogin] = useRecoilState(loginState);
  const [name, setName] = useRecoilState(nameState); //useState와 거의 비슷한 사용법
  const [room, setRoom] = useRecoilState(roomState); //useState와 거의 비슷한 사용법
  const [roomList, setRoomList] = useState([]);

  useEffect(() => {
    axios.get(`${API_URL}/api/user/nick-name`)
      .then((res) => {
        console.log(res);

        // state 업데이트
        setName(res.data.user_nick_name);
      })
      .catch((err) => {
        const {reLogin} = errHandler(err);
        if (reLogin === true) {
          setIslogin(false);
        }
      });

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
        <h1 className='heading'>Main</h1>
        <h2>{name && name}</h2>
        <div>
          <input
            placeholder='채팅방 생성'
            className='joinInput mt-20'
            type='text'
            onChange={(event) => setRoom(event.target.value)}
          />
        </div>
        <NavLink
          onClick={(e) => ( !room ? (e.preventDefault()) : null)}
          to={`/chat`}
        >
          <button className={'button mt-20'} type='submit'>
            생성
          </button>
        </NavLink>
      </div>

      <RoomList 
        roomList={roomList}
      />
    </div>
  )
}

export default Main