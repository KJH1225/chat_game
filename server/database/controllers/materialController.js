const MaterialService = require("../services/materialService");

class MaterialController {

	static async createMaterial(req, res, next) {
    try {
      const { image, backgroundImage, ...newMaterial } = req.body;
      const result = await MaterialService.createMaterial({ newMaterial, image, backgroundImage });
      res.status(201).json(result);
    } catch (error) {
      next(error);
    }
  }

	static async getAllMaterial(req, res, next){
		try {
			const result = await MaterialService.getAllMaterial();
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async updateMaterial(req, res, next){
		try {
			const material_id = req.params.material_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await MaterialService.updateMaterial({ material_id, toUpdate });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteMaterial(req, res, next){
		try {
			const material_id = req.params.material_id;

			const result = await MaterialService.deleteMaterial({ material_id });
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = MaterialController;