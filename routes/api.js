var express = require('express');
var router = express.Router();
var userController = require('./../controllers/user');
var admin_userController = require('./../controllers/admin_user');

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.send('respond with a resource');
});

router.get('/user', userController.list);
router.post('/user', userController.insert);
router.put('/user/:id', userController.update);
router.delete('/user/:id', userController.delete);

router.get('/admin_user', admin_userController.list);
router.post('/admin_user', admin_userController.insert);
router.put('/admin_user/:id', admin_userController.update);
router.delete('/admin_user/:id', admin_userController.delete);

module.exports = router;