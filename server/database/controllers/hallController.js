const HallService = require("../services/hallService");

class HallController {

    static async getHall(req, res, next){
        try {
            const result = await HallService.getHallImg();
            res.status(200).json(result);
        } catch (error) {
            next(error);
        }
    }
}

module.exports = HallController;