const Order = require('./../models/order.js');
const Vehicle = require('./../models/vehicle.js');
const Cost = require('./../models/cost.js');
const User = require('./../models/user.js');
const { formatTime } = require('./../utils/date.js');
const orderController = {
	insert: async function(req, res, next) {
		// let order_number = ""; //订单号
		// for (let i = 0; i < 6; i++) //6位随机数，用以加在时间戳后面。
		// {
		//     order_number += Math.floor(Math.random() * 10);
		// }
		// order_number = new Date().getTime() + order_number; //时间戳，用来生成订单号。
		let order_number = req.body.order_number
		let order_state = 1; //订单状态 1：进行中 2：已完成 3：已取消
		let get_car = 1;
		let order_date = new Date();
		let created_time = order_date;
		let sat_at = req.body.sat_at; //开始时间
		let end_at = req.body.end_at; //结束时间
		let rent_days = req.body.rent_days; //租借天数 计算
		let name = req.body.name //客户名字
		let phone = req.body.phone //客户电话
		let car_id = req.body.car_id //车型ID
		let cost_total = req.body.cost_total; //前端计算好返回后端
		if (!order_number || !order_state || !order_date ||
			!sat_at || !end_at || !rent_days || !name ||
			!phone || !car_id || !cost_total) {
			res.json({ code: 0, message: '缺少必要参数' });
			return
		}
		let user = await User.select({ phone })
		if (user == '') {
			console.log('没有此用户')
			let is_online = 2;
			await User.insert({
				name,
				phone,
				is_online,
				created_time,
			});
		} else {
			console.log('有此用户')
		}
		try {
			const order = await Order.insert({
					order_number,
					order_state,
					order_date,
					get_car,
					sat_at,
					end_at,
					rent_days,
					name,
					phone,
					car_id,
					cost_total,
			});
			let id = order[0];

			if (id) {
				let state = 2; //改变车辆状态
				let id = car_id; //被改变车辆的ID
				await Vehicle.update(id, { state })
			}
			res.json({
				code: 200,
				data: { id },
				user: user
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
		let currentPage = req.query.current_page || 1;
		let pageSize = req.query.page_size || 10;
		let params = {};
		try {
			const order = await Order
				.pagination(pageSize, currentPage, params)
				.orderBy('id', 'desc');
			const orderDisplay = order.map((data) => {
				data.order_date = formatTime(data.order_date);
				return data
			});
			let orderCount = await Order.count(params);
			let total = orderCount[0].total;
			let order_all = await Order.allManager()
			res.json({
				code: 200,
				data: {
					datas: orderDisplay,
					pagination: {
						total: total,
						current_page: currentPage,
						page_size: pageSize,
					},
					order_all:order_all,
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
	state: async function(req, res, next) {
		let order_state = req.query.order_state;
		let currentPage = req.query.current_page || 1;
		let pageSize = req.query.page_size || 10;
		let params = {};
		try {
			let orderState = await Order
				.pagination(pageSize, currentPage, params)
				.where({ order_state })
				.orderBy('id', 'desc');
			let orderState_arr = await Order.select({ order_state })
			let orderState_total = orderState_arr.length;
			let state_all = await Order.select({order_state})
			res.json({
				code: 200,
				data: {
					datas: {
						order_state: orderState,
						orderState_pagination: {
							total: orderState_total,
							current_page: currentPage,
							page_size: pageSize,
						}
					},
					state_all:state_all,

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
	update: async function(req, res, next) {
		let id = req.params.id;
		let order_state = req.body.order_state;
		let order_date = new Date();
		let created_time = order_date;
		let sat_at = req.body.sat_at;
		let end_at = req.body.end_at;
		let rent_days = req.body.rent_days; //前端 计算
		let name = req.body.name;
		let phone = req.body.phone;
		let car_id = req.body.car_id;
		let cost_total = req.body.cost_total; //前端计算好返回后端
		if (car_id) {
			let id = car_id;
			let state = 2;
			await Vehicle.update(id, { state })
		}
		try {
			const order = await Order.update(id, {
				order_state,
				order_date,
				sat_at,
				end_at,
				rent_days,
				name,
				phone,
				car_id,
				cost_total,
			});
			await User.update({
				name,
				phone,
				created_time,
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
	modify: async function(req, res, next) {
		let order_number = req.params.id;
		let order_state = req.body.order_state;
		let timeout_cost = req.body.timeout_cost;
		let timeout_days = req.body.timeout_days;
		let cost_total = req.body.cost_total;
		let get_car = req.body.get_car;
		let id = req.body.car_id;
		let state = 1; //改变车辆状态
		try {
			await Order.modify(order_number, { 
				order_state, 
				get_car,
				timeout_cost, 
				timeout_days,
				cost_total
			})
			if (order_state == '2') {
				await Vehicle.update(id, { state })
			} else if (order_state == '3') {
				await Vehicle.update(id, { state })
			}
			res.json({
				code: 200,
				data: '修改成功'
			})
		} catch (err) {
			console.log(err)
			res.json({
				code: 0,
				message: '修改失败'
			})
		}
	},
	personal: async function(req, res, next) {
		let id = req.params.id;
		let order_id = id;
		try {
			const orderID = await Order.update(id, { order_id })
			const order = await Order
				.select({ order_id: id })
				.whereNull('order.isdeleted')
				.leftJoin('vehicle', 'order.car_id', 'vehicle.id')
				.column(
					'order.id', 'order.order_number', 'order.order_state', 'order.order_date',
					'order.sat_at', 'order.end_at', 'order.rent_days', 'order.name', 'order.car_id',
					'order.phone', 'order.cost_total', 'order.get_car','timeout_cost','timeout_days',
					'vehicle.car_name', 'vehicle.car_img', 'vehicle.price', 'vehicle.level'
				)
				.orderBy('id', 'desc');
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
	find: async function(req, res, next) {
		let order_number = req.params.id;
		try {
			const order = await Order
				.select({ order_number })
				.whereNull('order.isdeleted')
				.leftJoin('vehicle', 'order.car_id', 'vehicle.id')
				.column(
					'order.id', 'order.order_number', 'order.order_state', 'order.order_date',
					'order.sat_at', 'order.end_at', 'order.rent_days', 'order.name', 'order.car_id',
					'order.phone', 'order.cost_total', 'get_car',
					'vehicle.car_name', 'vehicle.car_img', 'vehicle.price', 'vehicle.level', 'vehicle.car_displacement', 'vehicle.car_structure'
				)
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
	phone: async function(req, res, next) {
		let phone = req.params.id;
		try {
			const order = await Order
				.select({ phone })
				.whereNull('order.isdeleted')
				.leftJoin('vehicle', 'order.car_id', 'vehicle.id')
				.column(
					'order.id', 'order.order_number', 'order.order_state', 'order.order_date',
					'order.sat_at', 'order.end_at', 'order.rent_days', 'order.name',
					'order.phone', 'order.get_car',
					'vehicle.car_name', 'vehicle.car_img'
				)
				.orderBy('id', 'desc');
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