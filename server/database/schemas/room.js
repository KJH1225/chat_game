const Sequelize = require("sequelize");


class Room extends Sequelize.Model {
  static initiate(sequelize) {
    Room.init(
      {
        room_id: {
          type: Sequelize.INTEGER,
          primaryKey: true,
          autoIncrement: true,
        },
        room_name: {
          type: Sequelize.STRING,
          allowNull: false,
          comment: "방 이름"
        },
        room_max_user: {
          type: Sequelize.INTEGER,
          allowNull: false,
          comment: "방 최대 인원"
        },
        // created_at: {
        //   type: Sequelize.DATEONLY,
        //   allowNull: false,
        //   defaultValue: Sequelize.literal('CURRENT_DATE'),
        //   comment: "글 생성일(YYYY-MM-DD)",
        // }
      }, 

      {
        sequelize,
        timestamps: true,  
        modelName: 'Room',
        tableName: 'Room',
        paranoid: true,
        charset: 'utf8',
        collate: 'utf8_general_ci',
      }
    )
  }

  static associate(db) {
    //RoomUser 모델에 참조키로 room_id(sourceKey)를 room_id(foreignKey)라는 이름으로 보냄
    db.Room.hasMany(db.RoomUser, { foreignKey: 'room_id', sourceKey: 'room_id'});

    //Chat 모델에 참조키로 user_id(sourceKey)를 user_id(foreignKey)라는 이름으로 보냄
    db.Room.hasMany(db.Chat, { foreignKey: 'room_id', sourceKey: 'room_id'});
  }
}

module.exports = Room;