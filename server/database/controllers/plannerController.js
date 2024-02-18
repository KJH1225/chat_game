const PlannerService = require("../services/plannerService");

class PlannerController {

    static async getPlanner(req, res, next){
        try {
            const tmp = req.query;
            console.log("tmp: ", tmp.point);
            const result = await PlannerService.getPlanner(tmp);
            res.status(200).json(result);
        } catch (error) {
            next(error);
        }
    }
}

module.exports = PlannerController;