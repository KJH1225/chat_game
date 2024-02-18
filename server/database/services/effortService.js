const EffortModel = require('../database/models/effortModel')


class EffortService{
	
	static async createEffort({newEffort}){
		const result = await EffortModel.createEffort({newEffort});
		return result;
	}

	static async getAllEffort(){
		const result = await EffortModel.getAllEffort();
		return result;
	}

	static async updateEffort({ effort_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await EffortModel.updateEffort({ effort_id, toUpdate });
		return result;
	}

	static async deleteEffort({ effort_id }){
    const result = await EffortModel.deleteEffort({ effort_id });
    return result;
  }

}
module.exports = EffortService;