const StoreModel = require('../database/models/storeModel')


class StoreService{

	static async createStore({reqBody}){
		const {store_name, phone, address, start_time, end_time, latitude, longitude, yn_mcmorning, yn_mcdrive, yn_mcdelivery, yn_parking} = reqBody;

		const newStore = {
			"store_name": store_name, //매장 이름
    	"phone": phone, //매장 번호
    	"address": address, //주소
    	"start_time": start_time, //시작시간
    	"end_time": end_time, //종료시간
    	"latitude": latitude, //위도 좌표
    	"longitude": longitude, //경도좌표
    	"yn_24h": start_time==="00:00" && end_time==="24:00" ? 1 : 0, //24시간 여부
    	"yn_mcmorning": yn_mcmorning, //맥모닝 여부
    	"yn_mcdrive": yn_mcdrive, //맥드라이브 여부
    	"yn_mcdelivery": yn_mcdelivery, //맥딜리버리 여부	
    	"yn_parking": yn_parking //맥딜리버리 여부	
		};
		const result = await StoreModel.createStore({newStore});
		return result;
	}
	
	static async getAllStore(query){
		const keys = Object.keys(query) 

		const yn_qs = {}; 
		let searchText = ''; 
		for (let i = 0; i < keys.length; i++) {
			const key = keys[i] // 각각의 키
			const value = query[key] // 각각의 키에 해당하는 각각의 값

			if (value === "true") {
				yn_qs[key] = true;
			}else {
				searchText = value;
			}
		}
		console.log(yn_qs, searchText);

		const result = await StoreModel.getAllStore(yn_qs, searchText);
		return result;
	}
	
	static async getOneStore({store_id}){
		const result = await StoreModel.getOneStore({store_id});
		return result;
	}

	static async getMcdelivery({address}){
		const elements = address.split(' '); //주소 띄어쓰기 기준으로 나누기
		const dong = elements[elements.length - 2]; //나눈주소[길이-2]번째 글자
		const dongWithoutLastCharacter = dong.slice(0, -1); // 마지막 글자 제거
		let result = await StoreModel.getMcdelivery({dongWithoutLastCharacter});
		// console.log(result);
    if (result.length === 0) {
      result = false;
    }else{
			result = true;
		}
		return result;
	}

	static async updateStore({toUpdate, store_id}){
		console.log("서비스에서: ",toUpdate);
		const { store_name, phone, address, start_time, end_time, latitude, longitude, yn_mcmorning, yn_mcdrive, yn_mcdelivery, yn_parking} = toUpdate;
		const update = {
			"store_name": store_name,
			"phone": phone,
			"address": address,
			"start_time": start_time,
			"end_time": end_time, 
			"latitude": latitude,
			"longitude": longitude,
			"yn_24h": start_time==="00:00" && end_time==="24:00" ? 1 : 0, //24시간 여부
			"yn_mcmorning": yn_mcmorning,
			"yn_mcdrive": yn_mcdrive,
			"yn_mcdelivery": yn_mcdelivery,
			"yn_parking": yn_parking,
		};
		console.log("Service/update: ", update);

		const result = await StoreModel.updateStore({update, store_id});
		return result;
	}

	static async deleteStore({store_id}){
    const result = await StoreModel.deleteStore({store_id});
    return result;
  }

}
module.exports = StoreService;