const ProductService = require("../services/productService");

class ProductController {

	static async createProduct(req, res, next){
		try {
			const newProduct = req.body;
			const result = await ProductService.createProduct({newProduct});
			res.status(201).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async getOneProduct(req, res, next){
		try {
			const product_id = req.params.product_id;
			const result = await ProductService.getOneProduct({product_id});
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

	static async getCategoryProduct(req, res, next){
		try {
			const category_id = req.params.product_id;
			const result = await ProductService.getCategoryProduct({category_id});
			console.log(result);
			if (result.errorMessage) {
				console.log('에러걸림');
        throw new Error(result.errorMessage)
      }

			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async updateProduct(req, res, next){
		try {
			const product_id = req.params.product_id;
			const {...props} = req.body;
      const toUpdate = {...props}

			const result = await ProductService.updateProduct({toUpdate, product_id});
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

	static async deleteProduct(req, res, next){
		try {
			const product_id = req.params.product_id;

			const result = await ProductService.deleteProduct({product_id});
			res.status(200).json(result);
		} catch (error) {
			next(error);
		}
	}

}

module.exports = ProductController;