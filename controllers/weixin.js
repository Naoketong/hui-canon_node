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
			let open_id = weixinData.openid;
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
				data: {
					open_id: open_id,
				},
				code: 200,
				success: '绑定成功'
			});
		} catch (err) {
			res.json({ code: 0, message: '绑定失败啊' })
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
			let userInfo = await userModel.show({ open_id });
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
	wxexit: async function(req, res, next) {
		let open_id = req.body.open_id;
		try {
			let user = await userModel
				.select({ open_id })
				.update({ open_id: null })
			res.json({
				data: user,
				code: 200,
				success: '你已退出'
			});
		} catch (err) {
			console.log(err)
			res.json({ code: 0, message: '退出失败' })
		}
	},
}

module.exports = miniController;