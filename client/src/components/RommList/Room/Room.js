import React from "react"
import { NavLink, useNavigate } from "react-router-dom"

const Room = ({name, room, index}) => {
  const navigate = useNavigate();

  console.log("name: ", name);
  const joinGameRoom = () => {
    
    if (name.trim() === '') {
      alert('이름입력');
      return
    } 

    navigate(`/chat?name=${name}&room=${room.name}`);
  }

  return (
    <div>
      <span>{index+1}. 방: {room.name} / 인원: {room.users.length}</span>
      {/* <NavLink to={`/chat?name=${name}&room=${room.name}`}>입장</NavLink> */}
      <button onClick={joinGameRoom}>입장</button>
    </div>
  )
}

export default Room