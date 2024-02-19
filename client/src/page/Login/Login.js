import React, { useState } from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import axios from 'axios';
import { API_URL } from '../../config/contansts';
import './Login.css';

const Login = () => {
  const navigate = useNavigate();
  const [user_email, setUser_Email] = useState('');
  const [user_pwd, setUser_pwd] = useState('');
  

  
  const login = async () => {
    if( user_email.trim() == "" && user_pwd.trim() == "" ){
      alert("전부 입력해주세요");
      return 
    } 
    
    try {
      const res = await axios.post(
        `${API_URL}/api/user/login`,
        {user_email, user_pwd},
        { withCredentials: true }// 쿠키 수정허용
      );
      alert("로그인성공!");
      // setIslogin(true);// 로컬스토리지에 저장. 브라우저닫아도 유지
      navigate('/main'); 
    } catch (error) {
      console.error(error);
      alert(`로그인 실패!`);
    }
  }

  return (
    <div className='joinOuterContainer'>
      <div className='joinInnerContainer'>
        {/* <button onClick={() => navigate('/join')}>회원가입</button> */}
        <NavLink to="/join">회원가입</NavLink>
        <h1 className='heading'>Login</h1>
        <div>
          <input
            placeholder='이메일'
            className='joinInput mt-20'
            type='text'
            onChange={(event) => setUser_Email(event.target.value)}
          />
        </div>
        <div>
          <input
            placeholder='비밀번호'
            className='joinInput mt-20'
            type='password'
            onChange={(event) => setUser_pwd(event.target.value)}
          />
        </div>
        <div>
          <button 
            className='button mt-20'
            onClick={login}
          >로그인</button>
        </div>
      </div>
    </div>
  )
}

export default Login