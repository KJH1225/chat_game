const PlannerModel = require('../database/models/plannerModel')


class PlannerService{
	
	static async getPlanner({point}){
		const planners = await PlannerModel.findAllByPoint({point});
		const _planners = [];
		// console.log("planners: ", planners);
		for (let index = 0; index < planners.length; index++) {
			// console.log("planners :", planners[index].dataValues);
			_planners.push(planners[index].dataValues);
		};
		console.log(_planners);

		return _planners;
	}

}
module.exports = PlannerService;