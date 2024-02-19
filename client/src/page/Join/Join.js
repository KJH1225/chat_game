import React from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import { useForm } from 'react-hook-form';
import axios from 'axios';
import { API_URL } from '../../config/contansts';
import './Join.css';

const Join = () => {
  const navigate = useNavigate();

  //validation
  const {
    register, //폼들의 유효성을 확인하는 메소드
    handleSubmit, //폼을 제출하기 위한 함수
    watch, //실시간 입력폼 값 확인하는 옵션 (keyUp event가 일어날때마다 e.target.value 확인기능)
    formState: { //폼에서 일어난 에러, 제출 여부, 값이 유효한지 등의 세부적인 상태 확인 객체 타입
      errors, //필드 오류를 포함하는 객체입니다. ErrorMessage 컴포넌트를 사용하여 오류 메시지를 쉽게 가져올 수 있습
    }, 
    getValues, //인풋에서 값 가져오기
  } = useForm({ mode: 'onChange' });

  const onSubmit = async (data) => {
    console.log("onSubmit: ", data);
    try {
      const res = await axios.post(`${API_URL}/api/user/join`, data);
      console.log("회원가입 요청 res: ", res);
      navigate('/');
    } catch (err) {
				console.error(err.response.data.message);
				alert(`가입 실패!\n${err.response.data.message}`);
    }
  }

  // console.log("watch: ", watch());

  return (
    <div className='joinOuterContainer'>
      <div className='joinInnerContainer'>
      <NavLink to="/">홈</NavLink>
        <h1 className='heading'>회원가입</h1>
        <form className='joinForm' onSubmit={handleSubmit(onSubmit)}>

          <h3 className='joinLabel mt-20'>아이디</h3>
          {errors.user_email && <span className='joinMessage' role="alert">{errors.user_email.message}</span>}
          <input
            type="text"
            className='joinInput'
            placeholder="아이디(이메일을 입력해주세요.)"
            {...register('user_email', {
              required: true, //필수 입력 true
              pattern: {
                value: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, //이메일 정규식
                message: '이메일 형식으로 입력해 주세요' 
              } 
            })}
          />
          

          <h3 className='joinLabel mt-20'>비밀번호</h3>
          {errors.user_pwd && <span className='joinMessage' role="alert">{errors.user_pwd.message}</span>}
          <input
            type="password"
            className='joinInput'
            placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자 이상)"
            {...register('user_pwd', {
              required: true, //필수 입력 true
              pattern: {
                value: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,  //비밀번호 정규식
                message: '영문, 숫자, 특수문자 포함 8자 이상' 
              }
            })}
          />
          

          <h3 className='joinLabel mt-20'>비밀번호 재확인</h3>
          {errors.user_password_confirm && <span className='joinMessage' role="alert">{errors.user_password_confirm.message}</span>}
          <input
            type="password"
            className='joinInput'
            placeholder="비밀번호 재확인"
            {...register('user_password_confirm', {
              required: true, //필수 입력 true
              validate: {
                password_confirm_check: (val) => {
                if (getValues("user_pwd") !== val) {
                    return "비밀번호가 일치하지 않습니다.";
                }
                },
              },
            })}
          />
          

          <h3 className='joinLabel mt-20'>닉네임</h3>
          {errors.user_nick_name && <span className='joinMessage' role="alert">{errors.user_nick_name.message}</span>}
          <input
            type="text"
            className='joinInput'
            placeholder="닉네임"
            {...register('user_nick_name', {
              required: "닉네임을 입력해주세요", //필수 입력 true
            })}
          />
          

          <input 
            className='button mt-20'
            type="submit" 
            value="회원가입" 
          />
        </form>
      </div>
    </div>
  )
}

export default Join