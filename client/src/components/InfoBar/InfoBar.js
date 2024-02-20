import React from 'react'
import { NavLink } from 'react-router-dom'
import onlineIcon from '../../icons/onlineIcon.png'
import closeIcon from '../../icons/closeIcon.png'
import { useResetRecoilState } from "recoil";
import { roomState } from "../../recoil/atoms/State";
import './InfoBar.css'


const InfoBar = ({room}) => {
  const resetRoom = useResetRecoilState(roomState);

  return (
    <div className='infoBar'>
      <div className='leftInnerContainer'>
        <img className='onlineIcon' src={onlineIcon} alt='online icon' />
        <h3>{room}</h3>
      </div>
      <div className='rightInnerContainer'>
        <NavLink to='/main' onClick={resetRoom}>
          <img src={closeIcon} alt='close icon' />
        </NavLink>
      </div>
    </div>
  )
}

export default InfoBar