const WhatsNewModel = require('../database/models/whatsNewModel')


class WhatsNewService{
	
	static async createWhatsNew({newWhatsNew}){
		const result = await WhatsNewModel.createWhatsNew({newWhatsNew});
		return result;
	}

	static async getMainPageWhatsNew(){
		const result = await WhatsNewModel.getMainPageWhatsNew();
		return result;
	}
	
	static async getCategoryWhatsNew({subcategory_id}){
		const result = await WhatsNewModel.getCategoryWhatsNew({subcategory_id});
		if (result.length == 0) {
			result.errorMessage = "카테고리ID 잘못 입력 OR 카테고리에 등록된 whatsNew 없음";
		}
		return result;
	}

	static async getOneWhatsNew({subCategory_id, whatsNew_id}){
		const result = await WhatsNewModel.getOneWhatsNew({subCategory_id, whatsNew_id});
		return result;
	}

	static async updateWhatsNew({ whatsNew_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await WhatsNewModel.updateWhatsNew({ whatsNew_id, toUpdate });
		return result;
	}

	static async deleteWhatsNew({ whatsNew_id }){
    const result = await WhatsNewModel.deleteWhatsNew({ whatsNew_id });
    return result;
  }

}
module.exports = WhatsNewService;