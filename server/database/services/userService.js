const UserModel = require('../database/models/userModel')
const crypto = require('crypto');
const redisClient = require("../utils/redis.utils");
require('dotenv').config();
const { makeRefreshToken, makeAccessToken } = require('../utils/token');


class UserService{
	//유효성 검사 이메일 겹치는지 등등
	static async createUser({email, pwd, user_name, phone, address, detail_address, selectedYear, selectedMonth, selectedDay}){

		const user = await UserModel.findOneUserEmail({ email });
		if (user) {
			user.errorMessage = "해당 id는 이미 가입되어 있습니다.";
			return user;
		}

		// const birth = selectedYear+'-'+selectedMonth+'-'+selectedDay;
		const birth = selectedYear+'-'+selectedMonth+'-'+selectedDay;
		console.log("birth: ", birth);
		//crypto.randomBytes(128): 길이가 128인 임의의 바이트 시퀀스를 생성
		//.toString('base64'): 임의의 바이트를 base64로 인코딩된 문자열로 변환
		const salt = crypto.randomBytes(128).toString('base64'); 

		// crypto.createHash('sha512'): SHA-512 해시 개체를 생성
		//.update(pwd + salt): 비밀번호( pwd)와 솔트를 연결하여 해시를 업데이트
		//.digest('hex'): 16진수 형식으로 최종 해시를 생성
		const hashPassword = crypto
			.createHash('sha512')
			.update(pwd + salt)
			.digest('hex'); 

		const newUser = { email, pwd: hashPassword, salt, user_name, phone, address, detail_address, birth }

		const createNewUser = await UserModel.createUser({newUser});
		return createNewUser
	}

	static async loginUser({email, pwd}){
		console.log("서비스에서: ",email);
		// console.log("id: ",id);
		// console.log("pwd: ",pwd);

		let user = await UserModel.findOneUserEmail({ email });
		console.log("user: ", user);
		
		if (!user) {
			console.log('null걸림');
			user = {}; // null이면 속성 할당 안됨 그래서 {} 빈 객체 재할당
			user.errorMessage = "해당 id는 가입 내역이 없습니다. 다시 한 번 확인해 주세요.";
			return user;
		}

		// 입력한 비밀번호와 조회해온 암호화 난수 함침
		const combinedPassword = pwd + user.salt;

		// 함친 combinedPassword 암호화
		const hashedPassword = crypto
			.createHash('sha512')
			.update(combinedPassword)
			.digest('hex');

		// hashedPassword와 DB의 비밀번호 비교
		if (hashedPassword === user.pwd) {
			console.log('Login successful!');
			// console.log("userService.js/loginUser()/user: ", user);
			const accessToken = makeAccessToken({id: user.id});
			const refreshToken = makeRefreshToken();

			// userId를 키값으로 refresh token을 redis server에 저장
			await redisClient.set(user.id, refreshToken);
			// await redisClient.get(user.id, (err, value) => {
			// 	console.log("redis.value: ", value); 
			// });
			
			const name = user.user_name; 
			const email = user.email;			
			const newUser = {name, email, accessToken, refreshToken};

			return newUser
		}else {
			console.log('Invalid login credentials.');
			user.errorMessage = "id 또는 비밀번호가 다릅니다.";
			return user;
		}
	}

	static async detailUser({id}){
		const user = await UserModel.findOneUserId({id});
		// console.log({myId});
		const name = user.user_name;
		const user_email = user.email;
		const address = user.address;
		const detail_address = user.detail_address;
		// const phone = user.phone;
		const phone_number_prefix = user.phone.substring(0, 3);
		const phone_number_suffix = user.phone.substring(3);
		// const birth = user.birth;
		const date = new Date(user.birth);
		const year = date.getFullYear();
		const month = date.getMonth()+1;
		const day = date.getDate();

		const userInfo = {
			name,
			user_email,
			address,
			detail_address,
			phone_number_prefix,
			phone_number_suffix,
			year,
			month,
			day,
		};

		return userInfo;
	}

	static async putUser({toUpdate, userId}){
		console.log("서비스에서: ",toUpdate, userId);
		// const email = toUpdate.user_name;
		// const phone = toUpdate.phoneNumberPrefix + toUpdate.phoneNumberSuffix;
		// const address = toUpdate.address;
		// const detail_address = toUpdate.detail_address;
		// const birth = toUpdate.selectedYear+'-'+toUpdate.selectedMonth+'-'+toUpdate.selectedDay;
		const update = {
			user_name: toUpdate.user_name,
			phone: toUpdate.phone_number_prefix + toUpdate.phone_number_suffix,
			address: toUpdate.address,
			detail_address: toUpdate.detail_address,
			birth: toUpdate.selected_year+'-'+toUpdate.selected_month+'-'+toUpdate.selected_day,
		};
		// update.user_name = toUpdate.user_name;
		// update.phone = toUpdate.phone_number_prefix + toUpdate.phone_number_suffix;
		// update.address = toUpdate.address;
		// update.detail_address = toUpdate.detail_address;
		// update.birth = toUpdate.selectedYear+'-'+toUpdate.selectedMonth+'-'+toUpdate.selectedDay;
		console.log(update);

		const user = await UserModel.putUser({update, userId});
		return user;
	}

	static async deleteUser({userId}){
		console.log("서비스에서: ", userId);
		const user = await UserModel.destroyUser({userId});
		return user;
	}
}
module.exports = UserService;