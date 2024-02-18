const StoreService = require("../services/storeService");

class StoreController {

	static async createStore(req, res, next){
		try {
			const reqBody = req.body;
			console.log("reqBody: ", reqBody);
			// const storeId = req.body;
			const result = await StoreService.createStore({reqBody});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getAllStore(req, res, next){
		try {
			const query = req.query;
			console.log("query: ", query);
			const result = await StoreService.getAllStore(query);
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getOneStore(req, res, next){
		try {
			const store_id = req.params.store_id;
			const result = await StoreService.getOneStore({store_id});
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getMcdelivery(req, res, next){
		try {
			const address = req.query.address;
			console.log("dong: ", address);
			// const storeId = req.body;
			const result = await StoreService.getMcdelivery({address});
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async updateStore(req, res, next){
		try {
			const store_id = req.params.store_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await StoreService.updateStore({toUpdate, store_id});
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteStore(req, res, next){
		try {
			const store_id = req.params.store_id;

			const result = await StoreService.deleteStore({store_id});
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = StoreController;