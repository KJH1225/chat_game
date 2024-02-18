

const Room = ({room, index}) => {
  return (
    <div>
      <p>{index+1}. 방: {room.name} / 인원: {room.users.length}</p>
    </div>
  )
}

export default Room