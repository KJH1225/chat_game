const FaqModel = require('../database/models/faqModel')


class FaqService{
	
	static async createFaq({newFaq}){
		const result = await FaqModel.createFaq({newFaq});
		return result;
	}

	static async getAllFaq(){
		const result = await FaqModel.getAllFaq();
		return result;
	}

	static async updateFaq({ faq_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await FaqModel.updateFaq({ faq_id, toUpdate });
		return result;
	}

	static async deleteFaq({ faq_id }){
    const result = await FaqModel.deleteFaq({ faq_id });
    return result;
  }

}
module.exports = FaqService;