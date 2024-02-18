const BannerModel = require('../database/models/BannerModel')


class BannerService{
	
	static async createBanner({newBanner}){
		const result = await BannerModel.createBanner({newBanner});
		return result;
	}

	static async getAllBanner(){
		const result = await BannerModel.getAllBanner();
		return result;
	}

	static async getOneBanner(subcategory){
		const result = await BannerModel.getOneBanner(subcategory);
		return result;
	}

	static async updateBanner({ banner_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await BannerModel.updateBanner({ banner_id, toUpdate });
		return result;
	}

	static async deleteBanner({ banner_id }){
    const result = await BannerModel.deleteBanner({ banner_id });
    return result;
  }

}
module.exports = BannerService;