const weixinModel = require('./../models/wexin.js');
const authCode = require('./../utils/authCode.js');
const User = require('./../models/user.js');
const vehicle = require('./../models/vehicle.js');
const { formatTime } = require('./../utils/date.js');
const userController = {
    insert: async function(req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let created_time = new Date();
        console.log(req.body)
            // if (!name || !phone) {
            //     res.json({ code: 0, message: '缺少必要参数' });
            //     return
            // }

        try {
            const user = await User.insert({
                name,
                phone,
                created_time
            });
            let id = user[0];
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
            const users = await User.allManager();
            const usersDisplay = users.map((data) => {
                data.created_time_display = formatTime(data.created_time);
                return data
            });
            res.json({
                code: 200,
                data: usersDisplay
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
        console.log(id, user_id)
        try {
            const user = await User.update(id, { user_id })
            const users = await User
                .where({ user_id: id })
                .leftJoin('vehicle', 'user.car_id', 'vehicle.id')
                // .column('vehicle.id', 'vehicle.name', 'vehicle.state', 'vehicle.car_img')

            res.json({
                code: 200,
                data: users
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