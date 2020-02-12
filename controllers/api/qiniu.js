const config = require('./../../config.js');
const qiniu = require('qiniu');

const qiniuController = {
    uploadToken: async function(req, res, next) {
        try {
            const accessKey = config.qiniu.accessKey;
            const secretKey = config.qiniu.secretKey;
            const mac = new qiniu.auth.digest.Mac(accessKey, secretKey);
            const options = {
                scope: 'hui-canon', // 空间名称
            };
            const putPolicy = new qiniu.rs.PutPolicy(options);
            const uploadToken = putPolicy.uploadToken(mac);
            res.json({
                token: uploadToken,
                domain: 'http://q5ipb3766.bkt.clouddn.com/',
            });
        } catch (e) {
            console.log(e);
            res.json({ code: 0, message: 'server error' })
        }
    },
}

module.exports = qiniuController;