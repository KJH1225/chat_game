//커트롤러 역할
//req수신
//req 데이터 및 내용 검증
//서버에서 수행된 결과 클라이언트에게 반환(res)

const OrderService = require("../services/orderService");

class OrderController {
  static async addOrder(req,res,next){
    try {
        const tmp = req.body;
        tmp.userId = req.userId;
        // tmp.userId = 1;
        // console.log("tmp: ",tmp);
        const newOrder = await OrderService.addOrder(tmp);
        
        if(newOrder.errorMessage){
            throw new Error(newOrder.errorMessage)
        }
        res.status(201).json(newOrder);

    } catch (error) {
        next(error)
    }
  }

  static async getAllOrder(req, res, next){
    try {
      const result = await OrderService.getAllOrder();
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  }

  static async getOrderByUserId(req, res, next){
    try {
      console.log("req.userId: ", req.userId);
      const userId = req.userId;
      // const userId = 1;
      const result = await OrderService.getOrderByUserId({id: userId});
      console.log("orderController.js/getOrderByUserId()/result: ", result);
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  }

  static async getOrderByOrderId(req, res, next){
		try {
			const order_id = req.params.order_id;
			const result = await OrderService.getOrderByOrderId({order_id});
			res.status(200).json(result);
		} catch (error) {
			next(error)
		}
	}

  static async findAllOrderDate(req, res, next){
    try {
      const userId = req.userId;
      // const userId = 1;
      const dateType = req.query;
      const result = await OrderService.findAllOrderDate({userId, dateType});
      if (result.errorMessage) {
        throw new Error(result.errorMessage);
      }
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  }
  
  static async rankMenu(req, res, next){
    try {
      const result = await OrderService.rankMenu();
      if (result.errorMessage) {
        throw new Error(result.errorMessage);
      }
      res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  }

  static async updateOrder(req, res, next){
		try {
			const order_id = req.params.order_id;
			const { state, cancel } = req.query;
      console.log(state);
      console.log(cancel);
      // const toUpdate = {...props}

			const result = await OrderService.updateOrder({order_id, state, cancel});
			res.status(200).json(result);
		} catch (error) {
      console.log(error);
			next(error);
		}
	}

  static async deleteOrder(req, res, next){
    try {
      const order_id = req.params.order_id;
      // const orderId = 8;
      const result = await OrderService.deleteOrder({order_id});
      res.status(200).json(result);
    } catch (error) {
      next(error)
    }
  }
}

module.exports = OrderController;