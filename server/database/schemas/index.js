const Sequelize = require('sequelize');

const Room = require('./room');
const User = require('./user'); 
const RoomUser = require('./roomUser'); 
const Chat = require('./chat'); 
const ImageData = require('./imageData'); 


const env = process.env.NODE_ENV || 'development'; //상수 env에 NODE_ENV없으면 'development' 넣음
const config = require('../../config/config.json')[env]; //상수config에 ../config/config파일에서 env(development) 불러옴
const db = {}; //상수 db라는 빈 객체 생성

//sequelize 인스턴스 생성../config/config파일의 development 내용들 넣음  
const sequelize = new Sequelize(config.database, config.username, config.password, config); 

//생성된 인스턴스를 나중에 재사용하기 위해 db.sequelize에 넣음
db.sequelize = sequelize;

//만든 모델들 추가
db.User = User;
db.Room = Room;
db.RoomUser = RoomUser;
db.Chat = Chat;
db.ImageData = ImageData;


User.initiate(sequelize);
Room.initiate(sequelize);
RoomUser.initiate(sequelize);
Chat.initiate(sequelize);
ImageData.initiate(sequelize);


User.associate(db);
Room.associate(db);
RoomUser.associate(db);
Chat.associate(db);
ImageData.associate(db);

module.exports = db;