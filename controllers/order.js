const Order = require('./../models/order.js');
const Vehicle = require('./../models/vehicle.js');
const Cost = require('./../models/cost.js');
const { formatTime } = require('./../utils/date.js');
const orderController = {
    insert: async function(req, res, next) {
        let order_number = ""; //订单号
        for (let i = 0; i < 6; i++) //6位随机数，用以加在时间戳后面。
        {
            order_number += Math.floor(Math.random() * 10);
        }
        order_number = new Date().getTime() + order_number; //时间戳，用来生成订单号。

        let order_state = 1; //订单状态 1：进行中 2：已完成 3：已取消
        let order_date = new Date();
        let sat_at = req.body.sat_at; //开始时间
        let end_at = req.body.end_at; //结束时间
        let rent_days = req.body.rent_days; //租借天数 计算
        let guest_name = req.body.guest_name //客户名字
        let phone = req.body.phone //客户电话
        let open_id = req.body.open_id //客户ID
        let car_id = req.body.car_id //车型ID
        let cost_total = req.body.cost_total; //前端计算好返回后端

        console.log(order_number, /*order_state, order_date, sat_at, end_at, rent_days, guest_name, phone, open_id, car_id, cost_total*/ )
            // if (!order_number || !order_state || !order_date ||
            //     !sat_at || !end_at || !rent_days || !guest_name ||
            //     !phone || !open_id || !car_id || !cost_total) {
            //     res.json({ code: 0, message: '缺少必要参数' });
            //     return
            // }


        try {
            const order = await Order.insert({
                order_number,
                order_state,
                order_date,
                sat_at,
                end_at,
                rent_days,
                guest_name,
                phone,
                open_id,
                car_id,
                cost_total,
            });
            let id = order[0];
            res.json({
                code: 200,
                data: { id }
            })
        } catch (e) {
            console.log(e)
            res.json({
                code: 0,
                message: '内部错误'
            })
        }
    },
    list: async function(req, res, next) {
        try {
            const order = await Order.allManager();
            const orderDisplay = order.map((data) => {
                data.order_date = formatTime(data.order_date);
                return data
            });
            res.json({
                code: 200,
                data: orderDisplay
            })
        } catch (e) {
            console.log(e)
            res.json({
                code: 0,
                message: '内部错误'
            })
        }
    },
    update: async function(req, res, next) {
        let id = req.params.id;
        let order_state = req.body.order_state;
        let order_date = new Date();
        let sat_at = req.body.sat_at;
        let end_at = req.body.end_at;
        let rent_days = req.body.rent_days; //前端 计算
        let guest_name = req.body.guest_name;
        let phone = req.body.phone;
        let open_id = req.body.open_id;
        let car_id = req.body.car_id;
        let cost_total = req.body.cost_total; //前端计算好返回后端




        try {
            const order = await Order.update(id, {
                order_state,
                order_date,
                sat_at,
                end_at,
                rent_days,
                guest_name,
                phone,
                open_id,
                car_id,
                cost_total,
            });
            res.json({
                code: 200,
                data: order,
                message: '修改成功'
            })
        } catch (e) {
            console.log(e)
            res.json({
                code: 0,
                message: '内部错误'
            })
        }
    },

    delete: async function(req, res, next) {
        let id = req.params.id;
        let isdeleted = 1;
        try {
            const user = await Order.update(id, { isdeleted })
            res.json({
                code: 200,
                data: '删除成功'
            })
        } catch (err) {
            console.log(err)
            res.json({
                code: 0,
                message: '删除失败'
            })
        }
    },
    personal: async function(req, res, next) {
        let id = req.params.id;
        let order_id = id;
        // console.log(id, user_id)
        try {
            const orderID = await Order.update(id, { order_id })
            const order = await Order
                .select({ order_id: id })
                .whereNull('order.isdeleted')
                .leftJoin('vehicle', 'order.car_id', 'vehicle.id')
                // .column(
                //     'order.id', 'order.order_number', 'order.order_state', 'order.order_date',
                //     'order.sat_at', 'order.end_at', 'order.rent_days','order.guest_name',
                //     'order.phone',
                //     'vehicle.car_name', 'vehicle.car_img'
                // )
            let orders = order.map((data) => {
                data.order_date = formatTime(data.order_date);
                return data
            });

            res.json({
                code: 200,
                data: orders,
            })
        } catch (e) {
            console.log(e)
            res.json({
                code: 0,
                message: '内部错误'
            })
        }
    },
}

module.exports = orderController;