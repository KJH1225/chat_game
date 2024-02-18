import React from "react"
import Room from "./Room/Room"

const RoomList = ({name, roomList}) => {
  console.log("RoomList.js/roomList: ", roomList);
  return (
    <>
      <div className='roomList'>
        <h3>방 목록</h3>
        <div className='rooms'>
          {roomList && roomList.map((room, index) => (
            <Room key={index} name={name} room={room} index={index} />
          ))}
        </div>
      </div>
    </>
  )
}

export default RoomList