const Cost = require('./../models/cost.js');
const vehicle = require('./../models/vehicle.js');
const { formatTime } = require('./../utils/date.js');
const costController = {
    insert: async function(req, res, next) {
        let car_id = req.body.car_id;
        let cost_basis = req.body.cost_basis;
        let cost_lease = req.body.cost_lease;
        let cost_servic = req.body.cost_servic;
        let cost_insurance = req.body.cost_insurance;
        let cost_total = Number(cost_basis) + Number(cost_lease) + Number(cost_servic) + Number(cost_insurance)
        try {
            const cost = await Cost.insert({
                car_id,
                cost_basis,
                cost_lease,
                cost_servic,
                cost_insurance,
                cost_total
            });
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
        try {
            const cost = await Cost
                .all()
                .leftJoin('vehicle', 'cost.car_id', 'vehicle.id')
                .column(
                    'cost.id', 'cost.cost_basis', 'cost.cost_lease', 'cost.car_id',
                    'cost.cost_servic', 'cost.cost_insurance', 'cost.cost_total',
                    'vehicle.name', 'vehicle.car_img'
                )
                // .whereNull('isdeleted')


            res.json({
                code: 200,
                data: cost
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
        let car_id = req.body.car_id;
        let cost_basis = req.body.cost_basis;
        let cost_lease = req.body.cost_lease;
        let cost_servic = req.body.cost_servic;
        let cost_insurance = req.body.cost_insurance;
        let cost_total = Number(cost_basis) + Number(cost_lease) + Number(cost_servic) + Number(cost_insurance)
        try {
            const cost = await Cost.update(id, {
                car_id,
                cost_basis,
                cost_lease,
                cost_servic,
                cost_insurance,
                cost_total
            });
            res.json({
                code: 200,
                data: cost
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
            const user = await Cost.update(id, { isdeleted })
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

module.exports = costController;