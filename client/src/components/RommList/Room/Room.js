import React from "react"
import { NavLink } from "react-router-dom"

const Room = ({room, index}) => {

  return (
    <div>
      <span>{index+1}. 방: {room.name} / 인원: {room.users.length}</span>
      <NavLink to={`/chat`}>입장</NavLink>
    </div>
  )
}

export default Room