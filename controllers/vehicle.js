const Vehicle = require('./../models/vehicle.js');
const { formatTime } = require('./../utils/date.js');
const vehicleController = {
    insert: async function(req, res, next) {
        let car_name = req.body.car_name;
        let state = req.body.state;
        let level = req.body.level;
        let car_img = req.body.car_img;
        let price = req.body.price;
        let created_time = new Date();
        let car_displacement = req.body.car_displacement;
        let car_structure = req.body.car_structure;
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
            const vehicles = await Vehicle.allManager();
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
        let isdeleted = 1;
        try {
            const manager = await Vehicle.update(id, { isdeleted })
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
    level: async function(req, res, next) {
        let level = req.body.level;
        try {
            const vehicles = await Vehicle.select({ level })
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
}

module.exports = vehicleController;