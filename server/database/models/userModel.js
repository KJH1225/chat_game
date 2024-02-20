const User = require('../schemas/user'); 

class UserModel {
  
  static async createUser({newUser}){
    console.log("newUser",newUser);
    const createNewUser = await User.create(newUser);
    return createNewUser;
  }

  //있으면 조회, 없으면 가입
  static async naverLogin(newUser){
    // console.log("newUser",newUser);
    const result = await User.findOrCreate({
      where: {user_email: newUser.user_email},
      defaults: newUser
    });

    return result;
  }

  //있으면 조회, 없으면 가입
  static async googleLogin(newUser){
    // console.log("newUser",newUser);
    const result = await User.findOrCreate({
      where: {user_email: newUser.user_email},
      defaults: newUser
    });

    return result;
  }

  //있으면 조회, 없으면 가입
  static async kakaoLogin(newUser){
    // console.log("newUser",newUser);
    const result = await User.findOrCreate({
      where: {user_email: newUser.user_email},
      defaults: newUser
    });

    return result;
  }

  static async getAllUser(){
    const user = await User.findAll({
      attributes: ["user_id", "user_email", "user_nick_name", "createdAt"]
    })
    console.log(user);
    return user;
  }

  static async findOneUserId({user_id}){
    // console.log("userId",id);
    const user = await User.findOne({
      where: {
        user_id: user_id
      }
    }); //where: {id: asdf} 형태가 들어와야함
    return user;
  }

  static async findOneUserEmail({user_email}){
    console.log("userId",typeof(user_email));
    const user = await User.findOne({
      where: {
        user_email: user_email
      }
    }); //where: {id: asdf} 형태가 들어와야함
    console.log("user 모델에서 email로 찾음: ",user);
    return user;
  }
  
  static async patchUser({update, user_id}){
    console.log("update: ",update);
    const user = await User.update({
      ...update
    }, {
      where: {
        user_id: user_id
      }
    });//where: {id: asdf} 형태가 들어와야함
    return user;
  }
  static async patchUserByEmail({update, user_email}){
    console.log("update: ",update);
    const user = await User.update({
      ...update
    }, {
      where: {
        user_email: user_email
      }
    });//where: {id: asdf} 형태가 들어와야함
    return user;
  }

  static async destroyUser({user_id}){
    // console.log("userId",userId);
    const user = await User.destroy({
      where: {
        user_id: user_id
      }
    });//where: {id: asdf} 형태가 들어와야함
    return user;
  }
  static async deleteAdminUser({user_id}){
    // console.log("userId",userId);
    const user = await User.destroy({
      where: {
        user_id: user_id
      }
    });//where: {id: asdf} 형태가 들어와야함
    return user;
  }
}

module.exports = UserModel; 