const WhatsNewService = require("../services/whatsNewService");

class WhatsNewController {

	static async createWhatsNew(req, res, next){
		try {
			const newWhatsNew = req.body;
			const result = await WhatsNewService.createWhatsNew({newWhatsNew});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getMainPageWhatsNew(req, res, next){
		try {
			const result = await WhatsNewService.getMainPageWhatsNew();
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}
	
	static async getCategoryWhatsNew(req, res, next){
		try {
			const subcategory_id = req.params.subcategory_id;
			const result = await WhatsNewService.getCategoryWhatsNew({subcategory_id});
			// console.log(result);
			if (result.errorMessage) {
				throw new Error(result.errorMessage)
      }
			
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getOneWhatsNew(req, res, next){
		try {
			const subCategory_id = req.params.subcategory_id;
			const whatsNew_id = req.params.whatsnew_id;
			const result = await WhatsNewService.getOneWhatsNew({subCategory_id, whatsNew_id});
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async updateWhatsNew(req, res, next){
		try {
			const whatsNew_id = req.params.whatsnew_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await WhatsNewService.updateWhatsNew({ whatsNew_id, toUpdate });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteWhatsNew(req, res, next){
		try {
			const whatsNew_id = req.params.whatsnew_id;

			const result = await WhatsNewService.deleteWhatsNew({ whatsNew_id });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = WhatsNewController;