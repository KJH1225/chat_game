const FaqService = require("../services/faqService");

class FaqController {

	static async createFaq(req, res, next){
		try {
			const newFaq = req.body;
			console.log(newFaq);
			const result = await FaqService.createFaq({newFaq});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getAllFaq(req, res, next){
		try {
			const result = await FaqService.getAllFaq();
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async updateFaq(req, res, next){
		try {
			const faq_id = req.params.faq_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await FaqService.updateFaq({ faq_id, toUpdate });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteFaq(req, res, next){
		try {
			const faq_id = req.params.faq_id;

			const result = await FaqService.deleteFaq({ faq_id });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = FaqController;