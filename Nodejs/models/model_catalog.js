var db = require("./database"); //nhúng model database vào đế kết nối db
var itemCat = []; // biến để chứa dữ liệu đổ về cho controller
var dataList = [];
var dataListPro = [];

// định nghĩa các hàm để tương tác vào mysql
exports.list = async () => {
  return new Promise((hamOK, hamLoi) => {
    let sql = "SELECT * FROM laptop_shop.catalog;";
    db.query(sql, (err, d) => {
      console.log("List success");
      dataList = d;
      hamOK(dataList);
    });
  });
};
exports.listByName = async (nameCat) => {

  return new Promise((hamOK, hamLoi) => {
    let sql = `SELECT * FROM laptop_shop.catalog WHERE nameCat='${nameCat}'`;
    db.query(sql, (err, result) => {
      console.log("Get idCat by nameCat success");
      itemCat = result[0].idCat;
    });
    let sql2 = `SELECT * FROM laptop_shop.product WHERE idCat=${itemCat}`;
    db.query(sql2, (err, result) => {
      console.log("Get list product by id Cat success");
      dataListPro = result;
      hamOK(dataListPro);
    });
  });
};
