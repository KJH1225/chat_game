const SliderService = require("../services/sliderService");

class SliderController {

	static async createSlider(req, res, next){
		try {
			const newSlider = req.body;
			const result = await SliderService.createSlider({newSlider});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getAllSlider(req, res, next){
		try {
			const result = await SliderService.getAllSlider();
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async updateSlider(req, res, next){
		try {
			const slider_id = req.params.slider_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await SliderService.updateSlider({ slider_id, toUpdate });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteSlider(req, res, next){
		try {
			const slider_id = req.params.slider_id;

			const result = await SliderService.deleteSlider({ slider_id });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = SliderController;