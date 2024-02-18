const CrewModel = require('../database/models/crewModel')


class CrewService{
	
	static async createCrew({newCrew}){
		const result = await CrewModel.createCrew({newCrew});
		return result;
	}

	static async getAllCrew(){
		const result = await CrewModel.getAllCrew();
		return result;
	}

	static async updateCrew({ crew_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await CrewModel.updateCrew({ crew_id, toUpdate });
		return result;
	}

	static async deleteCrew({ crew_id }){
    const result = await CrewModel.deleteCrew({ crew_id });
    return result;
  }

}
module.exports = CrewService;