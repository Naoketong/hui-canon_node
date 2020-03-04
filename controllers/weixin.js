const weixinModel = require('./../models/wexin.js');
const authCode = require('./../utils/authCode.js');
const axios = require('axios');
const userModel = require('./../models/user.js');
var { formatDate, formatMin } = require('./../utils/date.js');



const miniController = {
    wxbind: async function(req, res, next) {
        const code = req.body.code;
        const name = req.body.name;
        const phone = req.body.phone;

        if (!code) {
            res.json({ code: 0, mssage: 'code empty!' })
            return
        }

        try {
            let weixinRequest = await weixinModel.login(code);
            let weixinData = weixinRequest.data;
            console.log(weixinData)
            let open_id = weixinData.openid;
            // console.log(open_id, 'open_id')

            let userInfo = await userModel.show({ name, phone });
            userInfo = userInfo[0] || {};

            if (!userInfo.id) {
                res.json({ code: 0, message: '请检查姓名、电话是否正确' });
                return
            }

            if (userInfo.open_id && userInfo.open_id === open_id) {
                res.json({ code: 0, message: '该用户已绑定，请联系管理员进行解绑' });
                return
            }

            await userModel.update(userInfo.id, { open_id });
            res.json({
                ceshi: weixinData,
                code: 200,
                success: '绑定成功'
            });
        } catch (err) {
            console.log(err)
            res.json({ code: 0, message: '绑定失败' })
        }
    },
    wxlogin: async function(req, res, next) {
        const code = req.body.code;
        if (!code) {
            res.json({ code: 0, mssage: 'code empty!' })
            return
        }

        try {
            let weixinRequest = await weixinModel.login(code);
            let weixinData = weixinRequest.data;
            let open_id = weixinData.openid;
            console.log(open_id, '222')

            let userInfo = await userModel.show({ open_id });
            console.log(userInfo)
            userInfo = userInfo[0] || {};

            if (!userInfo.id) {
                res.json({ code: 0, message: '用户没有绑定' });
                return
            }
            let str = open_id + '\t' + userInfo.id;
            let token = authCode(str, 'ENCODE');
            res.json({
                code: 200,
                data: {
                    userInfo,
                    token
                }
            })
        } catch (err) {
            console.log(err)
            res.json({ code: 0, message: '登录失败' })
        }
    },

}

module.exports = miniController;