const CrewService = require("../services/crewService");

class CrewController {

	static async createCrew(req, res, next){
		try {
			const newCrew = req.body;
			const result = await CrewService.createCrew({newCrew});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getAllCrew(req, res, next){
		try {
			const result = await CrewService.getAllCrew();
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async updateCrew(req, res, next){
		try {
			const crew_id = req.params.crew_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await CrewService.updateCrew({ crew_id, toUpdate });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteCrew(req, res, next){
		try {
			const crew_id = req.params.crew_id;

			const result = await CrewService.deleteCrew({ crew_id });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = CrewController;