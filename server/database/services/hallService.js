const HallModel = require('../database/models/hallModel')


class HallService{
	
	static async getHallImg(){
		const halls = await HallModel.findAll();
		const _halls = [];
		
		for (let index = 0; index < halls.length; index++) {
			// console.log("hall :", hall[index].dataValues);
			_halls.push(halls[index].dataValues);
		};
		console.log(_halls);

		return _halls;
	}

}
module.exports = HallService;