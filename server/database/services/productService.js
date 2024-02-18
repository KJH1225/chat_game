const ProductModel = require('../database/models/productModel')


class ProductService{
	
	static async createProduct({newProduct}){
		const result = await ProductModel.createProduct({newProduct});
		return result;
	}

	static async getOneProduct({product_id}){
		const result = await ProductModel.getOneProduct({product_id});
		return result;
	}

	static async getCategoryProduct({category_id}){
		let result = await ProductModel.getCategoryProduct({category_id});
    if (result.length == 0) {
      result.errorMessage = "카테고리ID 잘못 입력 OR 카테고리에 등록된 상품이 없음";
			return result
    }

    // result = result.map(el => el.get({ plain: true }));

		result.map((order, index) => {
      const { created_at } = result[index];

      // console.log(`${created_at.getFullYear()}-${created_at.getMonth()+1}-${created_at.getDate()}`);
      result[index].created_at = new Date(created_at.setHours(created_at.getHours() + 9));
      result[index].created_at = result[index].created_at.toISOString().split('T')[0];
    })
    
		return result;
	}

	static async updateProduct({toUpdate, product_id}){
		console.log("서비스에서: ",toUpdate);
		const { sub_category_id, admin_id, product_category, k_name, e_name, thumbnail_img_url, seq, description, sale_start_time, sale_end_time, llergen_information, cuntry_of_origin, price} = toUpdate;
		const update = {
			"sub_category_id": sub_category_id,
			"admin_id": admin_id,
			"product_category": product_category,
			"k_name": k_name,
			"e_name": e_name, 
			"thumbnail_img_url": thumbnail_img_url,
			"seq": seq,
			"description": description, 
			"sale_start_time": sale_start_time,
			"sale_end_time": sale_end_time,
			"llergen_information": llergen_information,
			"cuntry_of_origin": cuntry_of_origin,
			"price": price,
		};
		console.log("Service/update: ", update);

		const result = await ProductModel.updateProduct({update, product_id});
		return result;
	}

	static async deleteProduct({product_id}){
    const result = await ProductModel.deleteProduct({product_id});
    return result;
  }

}
module.exports = ProductService;