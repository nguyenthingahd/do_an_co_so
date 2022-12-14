var express = require('express');
var router = express.Router();
var db = require('../models/database')
var modelUser = require('../models/model_user');
const bcrypt = require("bcrypt");

/* GET users listing. */
router.get('/tai-khoan', function(req, res, next) {
    if (req.session.User) {
        res.render("site/my-account.ejs", { user: req.session.User });
    } else {
        req.session.back = "/users/tai-khoan";
        res.redirect("/users/dang-nhap");
    }
});
router.get('/dang-nhap', function(req, res, next) {
    res.render('site/dang-nhap.ejs')
});
router.post('/dang-nhap', function(req, res, next) {
    let u = req.body.username;
    let p = req.body.password;
    let sql = `SELECT * FROM user WHERE username = '${u}' OR email = '${u}'`;
    db.query(sql, (err, rows) => {
        if (rows.length <= 0) {
            res.redirect("/users/dang-nhap");
            return;
        }
        let user = rows[0];
        let pass_fromdb = user.password;
        console.log(pass_fromdb);
        var kq = bcrypt.compareSync(p, pass_fromdb);
        console.log(kq)
        if (kq) {
            req.session.User = {
                id: user.idUser,
                username: user.username,
                ho: user.ho,
                ten: user.ten,
                phone: user.phone,
                email: user.email,
                address: user.address,
                logIn: true
            };
            console.log("OK");
            if (req.session.back) {
                console.log(req.session.back);
                res.redirect(req.session.back);
            } else {
                res.redirect("/");
            }
        } else {
            console.log("Not OK");
            res.redirect("/users/dang-nhap");
        }
    });
});
router.get('/dang-ky', function(req, res, next) {
    res.render('site/dang-ky.ejs')
});
router.post('/luu', function(req, res, next) {
    let ho = req.body.ho;
    let ten = req.body.ten;
    let u = req.body.username;
    let em = req.body.email;
    let phone = req.body.phone;
    let p = req.body.password;
    let rp = req.body.retypePassword;
    let address = req.body.address;

    if (p === rp && p != "") {

        var salt = bcrypt.genSaltSync(10);
        var pass_mahoa = bcrypt.hashSync(p, salt);

        let user_info = { ho: ho, ten: ten, email: em, username: u, password: pass_mahoa, phone: phone, address: address };

        let sql = 'INSERT INTO user SET ?';
        db.query(sql, user_info);
    } else {
        res.redirect("/users/dang-ky");
    }

    res.redirect("/users/thanh-cong");
})
router.get('/thanh-cong', function(req, res, next) {
    let message = "????ng k?? th??nh c??ng";
    res.render('site/thanh-cong', { message: message })
})
router.get('/dang-xuat', function(req, res, next) {
    req.session.destroy();
    res.redirect("/users/dang-nhap");
});
router.post('/doi-mat-khau', function(req, res, next) {
    let password = req.body.password;
    let newPassword = req.body.newPassword;
    let confirmPassword = req.body.confirmPassword;
    let u = req.session.User.username;
    console.log(u)
    let sql = 'SELECT * FROM user WHERE username = ?';
    db.query(sql, [u], (err, rows) => {
        if (rows.length <= 0) { res.redirect("/users/error"); return; }
        let user = rows[0];
        let pass_fromdb = user.password;
        var kq = bcrypt.compareSync(password, pass_fromdb);
        if (kq) {
            if (newPassword === confirmPassword) {
                var salt = bcrypt.genSaltSync(10);
                var pass_mahoa = bcrypt.hashSync(newPassword, salt);
                let sql2 = `UPDATE user SET password='${pass_mahoa}' WHERE username LIKE '%${u}%'`;
                db.query(sql2, (err, result) => {
                    console.log('Update success');
                    let mess = "?????i m???t kh???u th??nh c??ng";
                    res.render('site/thanh-cong', { message: mess })
                });
            }
        }
    });
})

router.get('/quen-mat-khau', (req, res) => {
    res.render('site/quen-mat-khau', { message: '' });
})
router.post('/quen-mat-khau', async(req, res) => {
    let email = req.body.email;
    let checkEmail = await modelUser.checkEmail(email); // Ki???m tra email c?? trong database hay kh??ng

    if (email == '') {
        let mess = "M???i b???n nh???p email";
        res.render('site/quen-mat-khau', { message: mess });
    }
    if (checkEmail) { // N???u email c?? trong database
        let mess = `M???t kh???u ???? ???????c g???i qua email ${email} c???a b???n!`;
        let newPassword = Math.random().toString(36).substring(7);

        var salt = bcrypt.genSaltSync(10);
        var pass_mahoa = bcrypt.hashSync(newPassword, salt);
        let sql = `UPDATE user SET password='${pass_mahoa}' WHERE email='${email}' `;
        db.query(sql, (err, result) => { console.log('Update success'); });

        var nodemailer = require('nodemailer'); // Nh??ng module nodemailer ????? g???i password v??o email c???a kh??ch h??ng

        var transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: { user: '', pass: '' }, // Email c???a ng?????i g???i
            tls: { rejectUnauthorized: false }
        });

        var mailOptions = {
            from: 'nguyennga0302002@gmail.com', //Email ng?????i g???i
            to: `${email}`, // Email ng?????i nh???n
            subject: 'L???y l???i m???t kh???u',
            //text: 'N???i dung th??, kh??ng c?? code html'
            html: `C???a h??ng Laptopstore xin g???i l???i m???t kh???u c???a b???n. <br>
      Your password: <b style="padding: 5px 7px; background: #eee; color: red"> ${newPassword} </b>`, // N???i dung th??, c?? th??? c?? code html
        };

        transporter.sendMail(mailOptions, function(error, info) {

            if (error) console.log(error);
            else console.log('???? g???i mail: ' + info.response);
            res.render('site/thanh-cong', { message: mess });
        });
    } else {
        let mess = "Email kh??ng t???n t???i!";
        res.render('site/quen-mat-khau', { message: mess });
    }
})

module.exports = router;