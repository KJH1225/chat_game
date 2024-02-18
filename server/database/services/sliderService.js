const SliderModel = require('../database/models/sliderModel')


class SliderService{
	
	static async createSlider({newSlider}){
		const result = await SliderModel.createSlider({newSlider});
		return result;
	}

	static async getAllSlider(){
		const result = await SliderModel.getAllSlider();
		return result;
	}

	static async updateSlider({ slider_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await SliderModel.updateSlider({ slider_id, toUpdate });
		return result;
	}

	static async deleteSlider({ slider_id }){
    const result = await SliderModel.deleteSlider({ slider_id });
    return result;
  }

}
module.exports = SliderService;