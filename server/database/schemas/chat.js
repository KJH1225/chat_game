const Sequelize = require("sequelize");


class Chat extends Sequelize.Model {
  static initiate(sequelize) {
    Chat.init(
      {
        chat_id: {
          type: Sequelize.INTEGER,
          primaryKey: true,
          autoIncrement: true,
        },
        room_id: {
          type: Sequelize.INTEGER,
          allowNull: false,
          comment: "채팅친 방"
        },
        user_id: {
          type: Sequelize.INTEGER,
          allowNull: false,
          comment: "채팅친 user"
        },
        chat_text: {
          type: Sequelize.STRING,
          allowNull: false,
          comment: "채팅 텍스트"
        },
        // created_at: {
        //   type: Sequelize.DATEONLY,
        //   allowNull: false,
        //   defaultValue: Sequelize.literal('CURRENT_DATE'),
        //   comment: "방 입장일(YYYY-MM-DD)",
        // }
      }, 

      {
        sequelize,
        timestamps: true,  
        modelName: 'Chat',
        tableName: 'Chat',
        paranoid: true,
        charset: 'utf8',
        collate: 'utf8_general_ci',
      }
    )
  }

  static associate(db) {
    //참조키로 Room 모델의 room_id(targetKey)를 room_id(foreignKey)라는 이름으로 가져옴
    db.Chat.belongsTo(db.Room, {foreignKey: 'room_id', targetKey: 'room_id'});

    //참조키로 User 모델의 id(targetKey)를 sub_category_id(foreignKey)라는 이름으로 가져옴
    db.Chat.belongsTo(db.User, {foreignKey: 'user_id', targetKey: 'user_id'});
  }
}

module.exports = Chat;