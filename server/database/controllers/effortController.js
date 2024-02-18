const EffortService = require("../services/effortService");

class EffortController {

	static async createEffort(req, res, next){
		try {
			const newEffort = req.body;
			const result = await EffortService.createEffort({newEffort});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getAllEffort(req, res, next){
		try {
			const result = await EffortService.getAllEffort();
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async updateEffort(req, res, next){
		try {
			const effort_id = req.params.effort_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await EffortService.updateEffort({ effort_id, toUpdate });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteEffort(req, res, next){
		try {
			const effort_id = req.params.effort_id;

			const result = await EffortService.deleteEffort({ effort_id });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = EffortController;