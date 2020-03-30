const Base = require('./base.js');

class Vehicle extends Base {
	constructor(props = 'vehicle') {
		super(props);
	}
}

module.exports = new Vehicle()