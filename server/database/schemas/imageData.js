const Sequelize = require("sequelize");

//맞출 이미지
class ImageData extends Sequelize.Model {
  static initiate(sequelize) {
    ImageData.init({
      image_data_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      image_url: {
        type: Sequelize.STRING,
        allowNull: false,
        comment: "이미지 저장 경로",
      },
      correct_answer: {
        type: Sequelize.STRING,
        allowNull: false,
        comment: "정답",
      },
      category: {
        type: Sequelize.STRING,
        allowNull: false,
        comment: "이미지 카테고리",
      },
      // created_at: {
      //   type: Sequelize.DATE,
      //   allowNull: false,
      //   defaultValue: Sequelize.NOW,
      //   comment: "회원 가입일",
      // }
    }, {
      sequelize,
      timestamps: true,
      modelName: 'ImageData',
      tableName: 'Image_Data',
      paranoid: true,
      charset: 'utf8',
      collate: 'utf8_general_ci',
    });
  }

  static associate(db) {
  }
};

module.exports = ImageData;