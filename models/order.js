const Base = require('./base.js');

class Order extends Base {
    constructor(props = 'order') {
        super(props);
    }
}

module.exports = new Order()