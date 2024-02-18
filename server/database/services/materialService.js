const MaterialModel = require('../database/models/materialModel')


class MaterialService{
	
	static async createMaterial({newMaterial}){
		const result = await MaterialModel.createMaterial({newMaterial});
		return result;
	}

	static async getAllMaterial(){
		const result = await MaterialModel.getAllMaterial();
		return result;
	}

	static async updateMaterial({ material_id, toUpdate }){
		console.log("서비스에서: ",toUpdate);
		const result = await MaterialModel.updateMaterial({ material_id, toUpdate });
		return result;
	}

	static async deleteMaterial({ material_id }){
    const result = await MaterialModel.deleteMaterial({ material_id });
    return result;
  }

}
module.exports = MaterialService;