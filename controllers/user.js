const weixinModel = require('./../models/wexin.js');
const authCode = require('./../utils/authCode.js');
const User = require('./../models/user.js');
const { formatTime } = require('./../utils/date.js');
const userController = {
    insert: async function(req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let is_online = req.body.is_online;
        let code = req.body.code;
        let created_time = new Date();
        if (!name || !phone) {
            res.json({ code: 0, message: '缺少必要参数' });
            return
        }

        try {
            let weixinRequest = await weixinModel.login(code);
            let weixinData = weixinRequest.data;
            let open_id = weixinData.openid;
            const user = await User.insert({
                name,
                phone,
                open_id,
                is_online,
                created_time,
            });
            let id = user[0];
            res.json({
                code: 200,
                data: {
                    id: id,
                    open_id: open_id,

                }
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
            // const userNo_openid = await User.allManager().whereNull('open_id');
            // const userON_open = await User.allManager().whereNotNull(' open_id ');
            const userOnline = await User.select({ is_online: 1 });
            const userOffline = await User.select({ is_online: 2 });
            res.json({
                code: 200,
                data: {
                    userOnline: userOnline,
                    userOffline: userOffline,
                },
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
        let name = req.body.name;
        let phone = req.body.phone;
        let open_id = req.body.open_id;
        let car_id = req.body.car_id;
        let id = req.params.id;
        let created_time = new Date();

        // if (!name || !phone || !password) {
        //     res.json({ code: 0, message: '缺少必要参数' });
        //     return
        // }

        try {
            const user = await User.update(id, {
                name,
                phone,
                open_id,
                car_id,
                created_time
            });
            res.json({
                code: 200,
                data: user
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
            const user = await User.update(id, { isdeleted })
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
        let user_id = id;
        let name = req.body.name;
        let phone = req.body.phone;
        try {
            const user = await User.update(id, { user_id })
            const users = await User
                .where({ user_id: id })
                .leftJoin('order', 'user.name', 'order.name')
                .leftJoin('vehicle', 'order.car_id', 'vehicle.id')
                .column(
                    'order.id', 'order.order_number', 'order.order_state', 'order.order_date',
                    'order.sat_at', 'order.end_at', 'order.rent_days', 'order.name', 'order.car_id',
                    'order.phone', 'order.cost_total', 'get_car',
                    'vehicle.car_name', 'vehicle.car_img', 'vehicle.price', 'vehicle.level'
                )
            res.json({
                code: 200,
                data: users,
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

module.exports = userController;