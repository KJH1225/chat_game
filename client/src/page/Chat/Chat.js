import React, { useState, useEffect } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';
import io from 'socket.io-client';
import { useRecoilState } from "recoil";
import { nameState, roomState } from "../../recoil/atoms/State";
import { API_URL } from '../../config/contansts';
import './Chat.css';

import InfoBar from '../../components/InfoBar/InfoBar';
import Messages from '../../components/Messages/Messages';
import Input from '../../components/Input/Input';
import TextContainer from '../../components/TextContainer/TextContainer';
import Popup from '../../components/Popup/Popup';

// 소켓 연결을 담당할 변수
let socket;

const Chat = () => {
  // 사용할 state들을 정의
  const [name, setName] = useRecoilState(nameState); //useState와 거의 비슷한 사용법
  const [room, setRoom] = useRecoilState(roomState); //useState와 거의 비슷한 사용법
  const [users, setUsers] = useState('');
  const [message, setMessage] = useState('');
  const [messages, setMessages] = useState([]);
  const [popup, setPopup] = useState(false);
  const [gameStatus, setGameStatus] = useState(false);

  // React Router를 사용하여 URL의 쿼리 파라미터를 가져오기 위한 hook
  const [searchParams, setSearchParams] = useSearchParams();
  
  const navigate = useNavigate();

  // 페이지가 처음 로드될 때와 엔드포인트 또는 쿼리 파라미터가 변경될 때 실행
  useEffect(() => {
      
    console.log("name: ", name);
    console.log("room: ", room);

    // 소켓 연결 설정
    socket = io(API_URL, {
      cors: {
          origin: "*",
      }
    });

    // 서버에 'join' 이벤트를 emit하여 사용자를 방에 추가
    socket.emit('join', { name, room }, (error) => {
      if (error) {
        alert(error.error);
        socket.disconnect();
        navigate('/');
      }
    });

    // 컴포넌트가 언마운트될 때 소켓 연결 해제
    return () => {
      socket.disconnect();
    };
  }, [API_URL, searchParams.toString()]);

  // 페이지 로딩 시 한 번만 실행
  useEffect(() => {
    // 'message' 이벤트를 수신하고, 메시지를 state에 추가
    socket.on('message', (message) => {
      console.log("Chat.js/message: ", message);
      setMessages((prevMessages) => [...prevMessages, message]);
    });

    // 'roomData' 이벤트를 수신하고, 사용자 목록을 state에 업데이트
    socket.on('roomData', ({ users }) => {
      setUsers(users);
    });

    // 클라이언트에서 'roomList' 이벤트 수신
    socket.on('gameStart', async () => {
      const wait = (timeToDelay) => new Promise((resolve) => setTimeout(resolve, timeToDelay))
      // 서버로부터 전달받은 방 목록을 콘솔에 출력
      setPopup(true);

      await wait(5000); //5초기다리기
      setPopup(false); 
      setGameStatus(true);

      await wait(10000); //10초기다리기
      setGameStatus(false);
    });

    // 페이지 언마운트 시 소켓 연결 해제
    return () => {
      socket.disconnect();
    };
  }, []);

  // 메시지를 전송하는 함수
  const sendMessage = (event) => {
    event.preventDefault();
    
    if (message) {
      console.log("Chat.js/53/message: ", message);
      // 서버에 'sendMessage' 이벤트를 emit하여 메시지 전송
      socket.emit('sendMessage', message, () => setMessage(''));
    }
  };



  return (
    <div className='outerContainer'>
      <div className='container'>

        {/* 채팅창 상단바 컴포넌트 */}
        <InfoBar room={room} />

        {gameStatus && 
          <div>
            게임 시작시 나올 이미지 컴포넌트
          </div>
        }

        {/* 메세지 출력 부분 */}
        <div className='users'>
          {users && users.map((user, index) => (
            <Messages messages={messages} name={name} user={user} />
          ))}
        </div>

        {/* 입력창 컴포넌트 */}
        <Input
          message={message}
          setMessage={setMessage}
          sendMessage={sendMessage}
        />
      </div>

      <TextContainer users={users} />
      {popup && <Popup />}
      <button onClick={() => {
        socket.emit('gameStart');
      }}>
        시작
      </button>
    </div>
  );
}

export default Chat;