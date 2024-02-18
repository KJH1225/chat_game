import React, { useState, useEffect } from 'react'

import ScrollToBottom from 'react-scroll-to-bottom'

import Message from './Message/Message'

import './Messages.css'

const Messages = ({ messages, name, user }) => {
  console.log("messages: ", name);
  
  // 2:2를 제외한 요소들을 필터링
  const [lastItem, setLastItem] = useState();
  // setTimeout(() => { lastItem = null }, 5000);
  
  useEffect(() => {
    const filteredArray = messages.filter(item => item.user == user.name);
    const lastItem = filteredArray.pop();
    setLastItem(lastItem);
    // setTimeout(() => { setLastItem(null); }, 5000);
  })

  


  console.log("lastItem: ", lastItem);

  return (
    // <ScrollToBottom className='messages'>
    //   {messages.map((message, i) => (
    //     <div key={i}>
    //       <Message message={message} name={name} />
    //     </div>
    //   ))}
    // </ScrollToBottom>

    <div className='user'>
        <div>
          {lastItem && <h2>{lastItem.text}</h2>}
          <h1>{user.name}</h1>
        </div>
    </div>
  )
}
export default Messages