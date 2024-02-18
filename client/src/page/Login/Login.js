import React, { useState } from 'react';
import './Login.css';
import { API_URL } from '../../config/contansts';
import axios from 'axios';
// let socket;

const Login = () => {
  const [id, setId] = useState('');
  const [password, setPassword] = useState('');
  

  
  const login = () => {
    if( id.trim() !== "" && password.trim() !== "" ){
      axios.post(
				`${API_URL}/api/user/login`,
				{email, pwd},
				{ withCredentials: true }// 쿠키 수정허용
			)
			.then(() =>{
				alert("로그인성공!");
				setIslogin(true);// 로컬스토리지에 저장. 브라우저닫아도 유지
				navigate('/');  
			})
			.catch(err =>{
				// console.error(err);
				console.error(err);
				alert(`로그인 실패!`);
			})
    } 
    else{
			return alert("전부 입력해주세요");
		}
  }

  return (
    <div className='joinOuterContainer'>
      <div className='joinInnerContainer'>
        <h1 className='heading'>Login</h1>
        <div>
          <input
            placeholder='아이디'
            className='joinInput'
            type='text'
            onChange={(event) => setId(event.target.value)}
          />
        </div>
        <div>
          <input
            placeholder='비밀번호'
            className='joinInput mt-20'
            type='text'
            onChange={(event) => setPassword(event.target.value)}
          />
        </div>
        <div>
          <button 
            className={'button mt-20'}
            onClick={login}
          >로그인</button>
        </div>
      </div>
    </div>
  )
}

export default Login