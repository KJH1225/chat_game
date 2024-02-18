const OrderModel = require('../database/models/orderModel');


class OrderService{

  static async addOrder({userId, store_id, menu_items, total_price}){

    const newOrder = {userId, store_id, menu_items, total_price};
		
    //예약테이블에 INSERT INTO
		const createNewOrder = await OrderModel.createOrder({newOrder});
    const order_id = createNewOrder.id;
    console.log("createNewOrder: ", createNewOrder.get({ plain: true }));
    // console.log("order_id: ", order_id);
    
    menu_items.map( (item, index) => { //장바구니에 담은 종류만큼 반복 
      // console.log('item: ', item);
      // const createNewOrderMenu = await OrderModel.createOrderMenu({order_id, newOrder});
      OrderModel.createOrderMenu({order_id, item})
        .then(createNewOrderMenu => {
          const orderMenu_id = createNewOrderMenu.id;
          console.log("createNewOrderMenu: ", createNewOrderMenu.get({ plain: true }));
          if (item.options.length != 0) { //옵션을 선택했을때만 작동
            item.options.map((option, index) => { //옵션의 종류만큼 반복
              // console.log("option: ", option);
              OrderModel.createOrderOption({orderMenu_id, option})
                .then(createNewOrderOption => {
                  console.log("createNewOrderOption: ", createNewOrderOption.get({ plain: true }));
                })
            })
            // const createNewOrderOption = await OrderModel.createOrderOption({orderMenu_id, newOrder});
          }
        })
    });
    

		return createNewOrder
  }

  static async getAllOrder(){
    let orderData = await OrderModel.getAllOrder();
    orderData = orderData.map(el => el.get({ plain: true }));
    
    orderData.map((order, index) => {
      const { created_at } = orderData[index];

      // console.log(`${created_at.getFullYear()}-${created_at.getMonth()+1}-${created_at.getDate()}`);
      orderData[index].created_at = new Date(created_at.setHours(created_at.getHours() + 9));
      orderData[index].format_date = orderData[index].created_at.toISOString().split('T')[0];
    })  
    console.log(orderData);

    return orderData;
  }

  static async getOrderByUserId({id}){
    const orderData = await OrderModel.findOneOrderUserId({id});
    // if (orderData.length === 0) {
    //   return [];
    // }
    return orderData;
  }

  static async getOrderByOrderId({order_id}){
		const result = await OrderModel.getOrderByOrderId({order_id});
		return result;
	}

  static async findAllOrderDate({userId, dateType}){

    const date = new Date();
    //월별 조회
    if (dateType.month) {
      // console.log(typeof(parseInt(dateType.month)));
      date.setMonth(date.getMonth()-parseInt(dateType.month));
    }
    // 일별 조회
    else if (dateType.day) {
      date.setDate(date.getDate()-parseInt(dateType.day));
    }
    // 주별 조회
    else if (dateType.week) {
      date.setDate(date.getDate()-(parseInt(dateType.week)*7));
    }
    //연별 조회
    else if (dateType.year) {
      date.setFullYear(date.getFullYear()-parseInt(dateType.year));
    }
    // 적절한 쿼리가 제공되지 않은 경우
    else {
      // throw new Error("'Invalid request. Please provide month, day, or week.'");
      const errorMessage = "잘못 요청";
      return errorMessage;
    }
    let result = await OrderModel.findAllOrderDate({userId, date});
    // console.log(result);
    // result.map((order, index)=> {
    //   console.log(order.OrderMenus);
    // })

    result = result.map(el => el.get({ plain: true }));
    // console.log(result);
    result.map((order, index) => {
      const { created_at } = result[index];

      // console.log(`${created_at.getFullYear()}-${created_at.getMonth()+1}-${created_at.getDate()}`);
      result[index].created_at = new Date(created_at.setHours(created_at.getHours() + 9));
      result[index].format_date = result[index].created_at.toISOString().split('T')[0];
    })
    
    console.log(result);

    return result;
  }

  static async rankMenu(){
		const result = await OrderModel.rankMenu();
		return result;
	}

	static async updateOrder({order_id, state, cancel}){
    console.log("service:",order_id, state, cancel);
		const result = await OrderModel.updateOrder({order_id, state, cancel});
		return result;
	}

  static async deleteOrder({order_id}){
    const result = await OrderModel.deleteOrder({order_id});
    return result;
  }
}

module.exports = OrderService;