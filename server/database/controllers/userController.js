//커트롤러 역할
//req수신
//req 데이터 및 내용 검증
//서버에서 수행된 결과 클라이언트에게 반환(res)

const UserService = require("../services/userService");

class UserController {
    static async createUser(req,res,next){
        try {
            console.log(req.body);
            const tmp = req.body;
            console.log("유저컨트롤러에서 받은 tmp: ",tmp);
            const newUser = await UserService.createUser(tmp);
            
            if(newUser.errorMessage){
                throw new Error(newUser.errorMessage)
            }
            res.status(201).json(newUser);

        } catch (error) {
            next(error)
        }
    }
    static async loginUser(req,res,next){
        try {
            const tmp = req.body;
            console.log("컨트롤러에서 tmp: ",tmp);
            const user = await UserService.loginUser(tmp);
            console.log("userControll.loginUser: ", user);
            
            if(user.errorMessage){
                throw new Error(user.errorMessage);
            };

            res.cookie('accessToken', user.accessToken, {
                httpOnly : true,
                secure : false,
                sameSite : 'strict',
            });
            res.cookie('refreshToken', user.refreshToken, {
                httpOnly : true,
                secure : false,
                sameSite : 'strict',
            });
            console.log("req.cookie.accessToken: ", req.cookies.accessToken);
            console.log("req.cookie.accessToken: ", req.cookies.refreshToken);
            res.status(200).end();
        } catch (error) {
            next(error)
        }
    }
    static async detailUser(req, res, next){
        try{
            const id = req.userId;
            // const id = 1;
            console.log("id: ",id);
            const user = await UserService.detailUser({id});

            // console.log("res임니다요: ",res);
            res.status(200).json(user)
        }catch(error){
            next(error)
        }
    }

    static async putUser(req, res, next){
        try{
            const userId = req.userId;
            // const userId = 1;
            const {...props} = req.body;
            const toUpdate = {...props};
            // const updateValue = req.body;
            console.log("userController/updateValue: ", toUpdate, userId);
            const user = await UserService.putUser({toUpdate, userId});

            // console.log("res임니다요: ",res);
            res.status(200).json(user)
        }catch(error){
            next(error)
        }
    }

    static async deleteUser(req, res, next){
        try{
            const userId = req.userId;
            // const userId = 1;
            console.log("userController/deleteUser: ", userId);
            const user = await UserService.deleteUser({userId});

            // console.log("res임니다요: ",res);
            res.status(200).json(user)
        }catch(error){
            next(error)
        }
    }
}
module.exports = UserController;