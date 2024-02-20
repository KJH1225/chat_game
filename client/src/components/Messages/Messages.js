import React, { useState, useEffect } from 'react'

import ScrollToBottom from 'react-scroll-to-bottom'

import Message from './Message/Message'

import './Messages.css'

const Messages = ({ messages, name, user }) => {
  console.log("messages: ", name);
  
  const [lastItem, setLastItem] = useState();
  
  useEffect(() => {
    const filteredArray = messages.filter(item => item.user == user.name);
    const lastItem = filteredArray.pop();
    setLastItem(lastItem);
  }, [messages]);

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