const OptionService = require("../services/optionService");

class OptionController {

	static async createOption(req, res, next){
		try {
			const newOption = req.body;
			const result = await OptionService.createOption({newOption});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getAllOption(req, res, next){
		try {
			const result = await OptionService.getAllOption();
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async getOneOption(req, res, next){
		try {
			const option_id = req.params.option_id;
			const result = await OptionService.getOneOption({option_id});
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async updateOption(req, res, next){
		try {
			const option_id = req.params.option_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await OptionService.updateOption({ option_id, toUpdate });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteOption(req, res, next){
		try {
			const option_id = req.params.option_id;

			const result = await OptionService.deleteOption({ option_id });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = OptionController;