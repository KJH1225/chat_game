const User = require('../schemas/user'); 

class UserModel {
  static async createUser({newUser}){
    console.log("newUser",newUser);
    const createNewUser = await User.create(newUser);
    return createNewUser;
  }

  static async findOneUserId({id}){
    // console.log("userId",id);
    const user = await User.findOne({
      where: {
        id: id
      }
    }); //where: {id: asdf} 형태가 들어와야함
    return user;
  }

  static async findOneUserEmail({email}){
    console.log("userId",typeof(email));
    const user = await User.findOne({
      where: {
        email: email
      }
    }); //where: {id: asdf} 형태가 들어와야함
    console.log("찾음: ",user);
    return user;
  }
  
  static async putUser({update, userId}){
    console.log("update: ",update);
    const user = await User.update({
      ...update
    }, {
      where: {
        id: userId
      }
    });//where: {id: asdf} 형태가 들어와야함
    return user;
  }

  static async destroyUser({userId}){
    // console.log("userId",userId);
    const user = await User.destroy({
      where: {
        id: userId
      }
    });//where: {id: asdf} 형태가 들어와야함
    return user;
  }

}

module.exports = UserModel; 