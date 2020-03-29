const Cost = require('./../models/cost.js');
const vehicle = require('./../models/vehicle.js');
const { formatTime } = require('./../utils/date.js');
const costController = {
    insert: async function(req, res, next) {
        let car_id = req.body.car_id;
        let cost_basis = req.body.cost_basis;
        // let cost_lease = req.body.cost_lease;
        let cost_servic = req.body.cost_servic;
        let cost_insurance = req.body.cost_insurance;
        let cost_total = Number(cost_basis) + /*Number(cost_lease) +*/ Number(cost_servic) + Number(cost_insurance)
        try {
            const cost = await Cost.insert({
                car_id,
                cost_basis,
                // cost_lease,
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
        let currentPage = req.query.current_page || 1;
        let pageSize = req.query.page_size || 10;
        let params = {};
        try {
            const cost = await Cost
                // 
                // .all()
                .paging(pageSize, currentPage, params)
                .whereNull('cost.isdeleted')
                .leftJoin('vehicle', 'cost.car_id', 'vehicle.id')

            .column(
                'cost.id', 'cost.cost_basis', 'cost.car_id',
                'cost.cost_servic', 'cost.cost_insurance', 'cost.cost_total',
                'vehicle.car_name', 'vehicle.car_img', 'vehicle.price'
            )

            let costCount = await Cost.count(params);
            let total = costCount[0].total;
            res.json({
                code: 200,
                data: cost,
                pagination: {
                    total: total,
                    current_page: currentPage,
                    page_size: pageSize,
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
        let car_id = req.body.car_id;
        let cost_basis = req.body.cost_basis;
        let cost_lease = req.body.cost_lease;
        let cost_servic = req.body.cost_servic;
        let cost_insurance = req.body.cost_insurance;
        let cost_total = Number(cost_basis) + /*Number(cost_lease) +*/ Number(cost_servic) + Number(cost_insurance)
        try {
            const cost = await Cost.update(id, {
                car_id,
                cost_basis,
                // cost_lease,
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
    personal: async function(req, res, next) {
        let car_id = req.params.id;
        // let car_id = id;
        try {
            const cost = await Cost.select({ car_id })


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

}

module.exports = costController;