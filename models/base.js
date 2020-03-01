const knex = require('./knex');

class Base {
    constructor(props) {
        this.table = props;
    }

    all() {
        return knex(this.table).select()
    }
    als(params) {
        return knex(this.table).select(params)
    }

    select(params) {
        return knex(this.table).select().where(params)
    }
    show(params) {
        return knex(this.table).where(params).select();
    }
    where(params) {
        return knex(this.table).where(params);
    }

    allManager() {
        return knex(this.table).select().whereNull('isdeleted')
    }

    // alls() {
    //     return knex(this.table).where().whereNull('isdeleted').select()
    // }

    insert(params) {
        return knex(this.table).insert(params)
    }

    update(id, params) {
        return knex(this.table).where('id', '=', id).update(params)
    }

    delete(id) {
        return knex(this.table).where('id', '=', id).del()
    }


    pagination(pageSize = 20, currentPage = 1, params = {}, dateFilter = {}) {
        let offset = (currentPage - 1) * pageSize;
        if (dateFilter.column) {
            return knex(this.table)
                .where(params)
                .whereNull('isdeleted')
                .offset(offset)
                .limit(pageSize)
                .whereBetween(dateFilter.column, [`${dateFilter.startAt} 00:00`, `${dateFilter.endAt} 23:59`])
                .select()

        } else {
            return knex(this.table)
                .where(params)
                .whereNull('isdeleted')
                .offset(offset)
                .limit(pageSize)
                .select()
        }
    }

}

module.exports = Base;