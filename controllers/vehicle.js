const Vehicle = require('./../models/vehicle.js');
const Cost = require('./../models/cost.js');
const { formatTime } = require('./../utils/date.js');
const vehicleController = {
    insert: async function(req, res, next) {
        // 车型信息
        let car_name = req.body.car_name;
        let state = req.body.state;
        let level = req.body.level;
        let car_img = req.body.car_img;
        let price = req.body.price;
        let created_time = new Date();
        let car_displacement = req.body.car_displacement;
        let car_structure = req.body.car_structure;
        // 费用信息
        let cost_basis = req.body.cost_basis;
        let cost_servic = req.body.cost_servic;
        let cost_insurance = req.body.cost_insurance;
        let cost_total = Number(cost_basis) + Number(cost_servic) + Number(cost_insurance)
            // if (!car_name || !) {
            //     res.json({ code: 0, message: '缺少必要参数' });
            //     return
            // }
        try {
            const vehicle = await Vehicle.insert({
                car_name,
                state,
                level,
                car_img,
                price,
                created_time,
                car_displacement,
                car_structure,
            });
            let id = vehicle[0];
            let car_id = id;
            const cost = await Cost.insert({
                car_id,
                cost_basis,
                cost_servic,
                cost_insurance,
                cost_total
            });




            res.json({
                code: 200,
                data: { id },
                vehicle: vehicle,
                cost: cost,
                message: '车型、费用添加成功',
            })
        } catch (e) {
            console.log(e)
            res.json({
                code: 0,
                message: '内部错误'
            })
        }
    },
    cost: async function(req, res, next) {
        let car_id = req.body.car_id;
        let cost_basis = req.body.cost_basis;
        let cost_servic = req.body.cost_servic;
        let cost_insurance = req.body.cost_insurance;
        let cost_total = Number(cost_basis) + Number(cost_servic) + Number(cost_insurance)
        try {
            const cost = await Cost.insert({
                car_id,
                cost_servic,
                cost_insurance,
                cost_total
            });
            console.log(cost)
            let id = cost[0];
            res.json({
                code: 200,
                data: { id },
                message: '添加成功'
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
        let pageSize = req.query.page_size || 10;
        let currentPage = req.query.current_page || 1;
        let params = {}
        try {
            const vehicles = await Vehicle
                .pagination(pageSize, currentPage, params)
            const vehiclesDisplay = vehicles.map((data) => {
                data.created_time_display = formatTime(data.created_time);
                return data
            });
            let vehicleCount = await Vehicle.count(params);
            let total = vehicleCount[0].total;
            let state = 0;
            let vehicleFree = await Vehicle.allManager().where({ state }) //能租的车型
            res.json({
                code: 200,
                data: {
                    datas: vehiclesDisplay,
                    vehicleFree: vehicleFree,
                    pagination: {
                        total: total,
                        current_page: currentPage,
                        page_size: pageSize,
                    }
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
        let car_name = req.body.car_name;
        let state = req.body.state;
        let level = req.body.level;
        let car_img = req.body.car_img;
        let price = req.body.price;
        let created_time = new Date();
        let car_displacement = req.body.car_displacement;
        let car_structure = req.body.car_structure;

        // if (!car_name || ! || !car_img) {
        //     res.json({ code: 0, message: '缺少必要参数' });
        //     return
        // }

        try {
            const vehicle = await Vehicle.update(id, {
                car_name,
                state,
                level,
                car_img,
                price,
                created_time,
                car_displacement,
                car_structure,
            });
            res.json({
                code: 200,
                data: vehicle
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
        let car_id = id;
        let isdeleted = 1;
        console.log(car_id)
        try {
            let vehicle = await Vehicle.update(id, { isdeleted })
            if (vehicle) {
                let cost = await Cost.select({ car_id })
                let id = cost[0].id
                await Cost.update(id, { isdeleted })
            }

            res.json({
                code: 200,
                data: '删除成功',
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
        console.log(id)
        try {
            const vehicles = await Vehicle.allManager().where({ id });
            const vehiclesDisplay = vehicles.map((data) => {
                data.created_time_display = formatTime(data.created_time);
                return data
            });
            res.json({
                code: 200,
                data: vehiclesDisplay
            })
        } catch (e) {
            console.log(e)
            res.json({
                code: 0,
                message: '内部错误'
            })
        }
    },
    level: async function(req, res, next) {
        let level = req.body.level;
        let state = 0;
        console.log(state)
        try {
            const vehicles = await Vehicle.select({ level, state }) //空闲车型
            const vehiclesVue = await Vehicle.select({ level }) //所有车型
            const vehiclesDisplay = vehicles.map((data) => {
                data.created_time_display = formatTime(data.created_time);
                return data
            });
            res.json({
                code: 200,
                data: {
                    datas: vehiclesDisplay,
                    vehicle: vehiclesVue,
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
}

module.exports = vehicleController;