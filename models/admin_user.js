const Base = require('./base.js');

class Admin_user extends Base {
    constructor(props = 'admin_user') {
        super(props);
    }
}

module.exports = new Admin_user()