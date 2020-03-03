var express = require('express');
var router = express.Router();
var qiniuController = require('./../controllers/api/qiniu');

var userController = require('./../controllers/user');
var admin_userController = require('./../controllers/admin_user');
var vehicleController = require('./../controllers/vehicle');
var costController = require('./../controllers/cost');
var orderController = require('./../controllers/order');
var weixinController = require('./../controllers/weixin.js');
/* GET users listing. */
router.get('/', function(req, res, next) {
    res.send('respond with a resource');
});

router.get('/qiniu-uploadtoken', qiniuController.uploadToken);


router.get('/user', userController.list);
router.post('/user', userController.insert);
router.get('/user/:id', userController.personal);
router.put('/user/:id', userController.update);
router.delete('/user/:id', userController.delete);

router.post('/login', admin_userController.login);
router.get('/admin_user', admin_userController.list);
router.post('/admin_user', admin_userController.insert);
router.put('/admin_user/:id', admin_userController.update);
router.delete('/admin_user/:id', admin_userController.delete);

router.get('/vehicle', vehicleController.list);
router.post('/vehicle/level', vehicleController.level);
router.post('/vehicle', vehicleController.insert);
router.get('/vehicle/:id', vehicleController.personal);
router.put('/vehicle/:id', vehicleController.update);
router.delete('/vehicle/:id', vehicleController.delete);

router.get('/cost', costController.list);
router.post('/cost', costController.insert);
router.get('/cost/:id', costController.personal);
router.put('/cost/:id', costController.update);
router.delete('/cost/:id', costController.delete);

router.get('/order', orderController.list);
router.post('/order', orderController.insert);
router.get('/order/:id', orderController.personal);
router.put('/order/:id', orderController.update);
router.delete('/order/:id', orderController.delete);


//小程序
router.post('/miniprogram/wxbind', weixinController.wxbind);

router.post('/miniprogram/wxlogin', weixinController.wxlogin);
module.exports = router;