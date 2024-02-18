const Sequelize = require("sequelize");

//고객(id, pw, name, phone, 생일, 성별, companionName, companionPhone)
class User extends Sequelize.Model {
  static initiate(sequelize) {
    User.init({
      user_id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      user_email: {
        type: Sequelize.STRING,
        allowNull: false,
        comment: "ID(이메일)",
      },
      user_pwd: {
        type: Sequelize.STRING(128),
        allowNull: false,
        comment: "비밀번호",
      },
      salt: {
        type: Sequelize.STRING(200),
        allowNull: false,
        comment: "암호화할때 쓴 난수",
      },
      user_nick_name: {
        type: Sequelize.STRING,
        allowNull: false,
        comment: "이름",
      },
    }, {
      sequelize,
      timestamps: true,
      modelName: 'User',
      tableName: 'User',
      paranoid: true,
      charset: 'utf8',
      collate: 'utf8_general_ci',
    });
  }

  static associate(db) {
    //RoomUser 모델에 참조키로 user_id(sourceKey)를 user_id(foreignKey)라는 이름으로 보냄
    db.User.hasMany(db.RoomUser, { foreignKey: 'user_id', sourceKey: 'user_id'});
    //Chat 모델에 참조키로 user_id(sourceKey)를 user_id(foreignKey)라는 이름으로 보냄
    db.User.hasMany(db.Chat, { foreignKey: 'user_id', sourceKey: 'user_id'});
  }
};

module.exports = User;