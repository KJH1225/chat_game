//커트롤러 역할
//req수신
//req 데이터 및 내용 검증
//서버에서 수행된 결과 클라이언트에게 반환(res)

const UserService = require("../services/userService");

class UserController {

  static async createUser(req, res, next) {
    try {
      console.log("/user/join req.body: ", req.body);
      const newUser = await UserService.createUser(req.body);

      if (newUser.errorMessage) {
        throw new Error(newUser.errorMessage);
      }
      res.status(201).end();
    } catch (error) {
      next(error);
    }
  }

  static async loginUser(req, res, next) {
    try {
      console.log("로그인 req.body: ", req.body);
      const user = await UserService.loginUser(req.body);
      console.log("userControll.loginUser: ", user);

      if (user.errorMessage) {
        throw new Error(user.errorMessage);
      }

      res.cookie("accessToken", user.accessToken, {
        httpOnly: true,
        secure: false,
        sameSite: "strict",
      });
      res.cookie("refreshToken", user.refreshToken, {
        httpOnly: true,
        secure: false,
        sameSite: "strict",
      });
      res.status(200).end();
    } catch (error) {
      next(error);
    }
  }

  static async getNickName(req, res, next) {
    try {
      const userId = req.user_id;
      // const id = "rlarorn@naver.com";
      console.log("userId: ", userId);
      const { user_nick_name } = await UserService.detailUser({ userId });

      console.log("user_nick_name: ",user_nick_name);
      res.status(200).json({user_nick_name});
    } catch (error) {
      next(error);
    }
  }

  static async checkPassword(req, res, next) {
    try {
      const user_id = req.user_id;
      const user_pwd = req.body.pwd;
      console.log("컨트롤러에서 pwd: ", user_pwd);
      const user = await UserService.checkPassword({user_id, user_pwd});
      console.log("userControll.loginUser: ", user);

      if (user.errorMessage) {
        throw new Error(user.errorMessage);
      }

      res.status(200).json({"status": user});
    } catch (error) {
      next(error);
    }
  }

  static async getAllUser(req, res, next) {
    try {
      const user = await UserService.getAllUser();
      res.status(200).json(user);
    } catch (error) {
      next(error);
    }
  }


  static async detailUser(req, res, next) {
    try {
      const userId = req.user_id;
      // const id = "rlarorn@naver.com";
      console.log("userId: ", userId);
      const user = await UserService.detailUser({ userId });

      // console.log("res임니다요: ",res);
      res.status(200).json(user);
    } catch (error) {
      next(error);
    }
  }

  static async patchUser(req, res, next) {
    try {
      const user_id = req.user_id;
      // const userId = 1;
      const toUpdate = { ...req.body };
      // const updateValue = req.body;
      console.log("userController/updateValue: ", toUpdate, user_id);
      const user = await UserService.patchUser({ toUpdate, user_id });

      // console.log("res임니다요: ",res);
      res.status(200).json(user);
    } catch (error) {
      next(error);
    }
  }

  static async deleteUser(req, res, next) {
    try {
      const user_id = req.user_id;
      // const userId = 1;
      console.log("userController/deleteUser: ", user_id);
      const user = await UserService.deleteUser({ user_id });

      // console.log("res임니다요: ",res);
      res.status(200).json(user);
    } catch (error) {
      next(error);
    }
  }

  static async deleteAdminUser(req, res, next) {
    try {
      const user_id = req.params.user_id;
      // const userId = 1;
      console.log("userController/deleteUser: ", user_id);
      const user = await UserService.deleteAdminUser({ user_id });

      // console.log("res임니다요: ",res);
      res.status(200).json(user);
    } catch (error) {
      next(error);
    }
  }
}
module.exports = UserController;