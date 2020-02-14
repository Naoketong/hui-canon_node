const knex = require('./knex');

class Base {
    constructor(props) {
        this.table = props;
    }

    all() {
        return knex(this.table).select()
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

    allManager() { /*获取所有信息 管理员*/
        return knex(this.table).select().whereNull('isdeleted')
    }

    insert(params) {
        return knex(this.table).insert(params)
    }

    update(id, params) {
        return knex(this.table).where('id', '=', id).update(params)
    }

    delete(id) {
        return knex(this.table).where('id', '=', id).del()
    }
}

module.exports = Base;