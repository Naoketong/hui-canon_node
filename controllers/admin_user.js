const Admin_user = require('./../models/admin_user.js');
const authCodeFunc = require('./../utils/authCode');
const userController = {
    login: async function(req, res, next) {
        try {
            let ttt = req.cookies.ac;
            console.log(req);
            let phone = req.body.phone;
            let password = req.body.password;
            let decide = await Admin_user.select({ phone: phone, password: password });
            console.log(decide, 'qqq');
            if (decide[0].id == null) {
                throw new Error('无此用户');
            }
            // console.log(authCodeFunc);
            let id = decide[0].id + '/tmp' + password;
            let auth_Code = authCodeFunc(id, 'ENCODE');
            res.cookie('ac', auth_Code, { maxAge: 24 * 60 * 60 * 1000 });
            res.json({
                code: 200,
                data: '有此用户',
                token: auth_Code
            });
        } catch (e) {
            console.log(e);
            res.json({
                code: 0,
                data: '无此用户'
            })
        }
    },
    insert: async function(req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let password = req.body.password;
        // if (!name || !phone) {
        //     res.json({ code: 0, message: '缺少必要参数' });
        //     return
        // }

        try {
            const user = await Admin_user.insert({
                name,
                phone,
                password,
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
    list: async function(req, res, next) {
        try {
            const users = await Admin_user.allManager();
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
    update: async function(req, res, next) {
        let name = req.body.name;
        let phone = req.body.phone;
        let password = req.body.password;
        let car_id = req.body.car_id;
        let id = req.params.id;

        // if (!name || !phone || !password) {
        //     res.json({ code: 0, message: '缺少必要参数' });
        //     return
        // }

        try {
            const user = await Admin_user.update(id, {
                name,
                phone,
                password,
                car_id,
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
            const manager = await Admin_user.update(id, { isdeleted })
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
}

module.exports = userController;