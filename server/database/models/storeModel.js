const Store = require('../schemas/store'); 
const { Op } = require('sequelize');

class StoreModel {

  static async createStore({newStore}){
    console.log("newStore",newStore);
    const result = await Store.create(newStore);
    return result;
  }

  static async getAllStore(yn_qs, searchText){
    const result = await Store.findAll({
        where: {
          ...yn_qs,
          [Op.or]: [
            { store_name: {[Op.like]: `%${searchText}%`}}, 
            { address: {[Op.like]: `%${searchText}%`} },
          ],
        },
        raw:true
      });
      console.log("result: ", result);
    return result;
  }

  static async getOneStore({store_id}){
    // console.log("storeId: ",storeId);
    const result = await Store.findOne({
      where: {
        id: store_id,
      }
    });
    return result;
  }

  static async getMcdelivery({dongWithoutLastCharacter}){
    // console.log("storeId: ",storeId);
    const result = await Store.findAll({
      where: {
        address: {
          [Op.like]: `%${dongWithoutLastCharacter}%`,
        }
      }
    });
    return result;
  }

  // static async findOneStoreEmail({email}){
  //   console.log("storeId",typeof(email));
  //   const store = await Store.findOne({
  //     where: {
  //       email: email
  //     }
  //   }); //where: {id: asdf} 형태가 들어와야함
  //   console.log("찾음: ",store);
  //   return store;
  // }
  
  static async updateStore({update, store_id}){
    console.log("Model/update: ",update);
    const store = await Store.update({
      ...update
    }, {
      where: {
        id: store_id
      }
    });//where: {id: asdf} 형태가 들어와야함
    return store;
  }

  static async deleteStore({store_id}){
    // console.log("storeId",storeId);
    const store = await Store.destroy({
      where: {
        id: store_id
      }
    });//where: {id: asdf} 형태가 들어와야함
    return store;
  }

}

module.exports = StoreModel; 