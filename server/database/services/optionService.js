const OptionModel = require('../database/models/optionModel')


class OptionService{
	
	static async createOption({newOption}){
		const result = await OptionModel.createOption({newOption});
		return result;
	}

	static async getAllOption(){
		const result = await OptionModel.getAllOption();
		return result;
	}

	static async getOneOption({option_id}){
		const result = await OptionModel.getOneOption({option_id});
		return result;
	}

	static async updateOption({ option_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await OptionModel.updateOption({ option_id, toUpdate });
		return result;
	}

	static async deleteOption({ option_id }){
    const result = await OptionModel.deleteOption({ option_id });
    return result;
  }

}
module.exports = OptionService;