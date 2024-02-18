const WhatsNew = require('../schemas/whatsNew'); 
const { Op } = require('sequelize');

class WhatsNewModel {
  static async createWhatsNew({newWhatsNew}){
    console.log("newWhatsNew",newWhatsNew);
    const result = await WhatsNew.create(newWhatsNew);
    return result;
  }

  static async getMainPageWhatsNew(){
    const result = await WhatsNew.findAll({
      where: {
        [Op.or]: [
          {sub_category_id: 12},
          {sub_category_id: 14},
        ]
      }
    });
    return result;
  }

  static async getCategoryWhatsNew({subcategory_id}){
    const result = await WhatsNew.findAll({
      where: {
        sub_category_id: subcategory_id,
      },
      order: [ ['seq', 'ASC'] ],
    });
    return result;
  }

  static async getOneWhatsNew({subCategory_id, whatsNew_id}){
    const result = await WhatsNew.findOne({
      where: {
        sub_category_id: subCategory_id,
        id: whatsNew_id,
      }
    });
    return result;
  }
  
  static async updateWhatsNew({ whatsNew_id, toUpdate }){
    console.log("update: ",toUpdate);
    const result = await WhatsNew.update({
      ...toUpdate
    }, {
      where: {
        id: whatsNew_id
      }
    });//where: {id: asdf} 형태가 들어와야함
    return result;
  }

  static async deleteWhatsNew({ whatsNew_id }){
    // console.log("whatsNewId",whatsNewId);
    const result = await WhatsNew.destroy({
      where: {
        id: whatsNew_id
      }
    });//where: {id: asdf} 형태가 들어와야함
    return result;
  }

}

module.exports = WhatsNewModel; 