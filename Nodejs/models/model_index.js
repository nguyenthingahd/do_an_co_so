var db = require("./database");
var data = [];
var dataNewArrivel = [];
var dataRecent = [];

exports.listCat = async () => {
  return new Promise((hamOK, hamLoi) => {
    let sql = "SELECT * FROM laptop_shop.catalog";
    db.query(sql, (err, d) => {
      console.log("List success");
      data = d;
      hamOK(data);
    });
  });
};
exports.listNewArrival = async () => {
  return new Promise((hamOK, hamLoi) => {
    let sql = "SELECT * FROM laptop_shop.product limit 7";
    db.query(sql, (err, d) => {
      console.log("List success");
      dataNewArrivel = d;
      hamOK(dataNewArrivel);
    });
  });
};
exports.listRecent = async () => {
  return new Promise((hamOK, hamLoi) => {
    let sql =
      "SELECT * FROM laptop_shop.product ORDER BY dateUpdate DESC limit 6";
    db.query(sql, (err, d) => {
      console.log("List success");
      dataRecent = d;
      hamOK(dataRecent);
    });
  });
};
exports.listCart = async (user) => {
  return new Promise((hamOK, hamLoi) => {
    let sql = `SELECT * FROM laptop_shop.cart WHERE user='${user}'`;
    db.query(sql, (err, d) => {
      console.log("List success");
      data = d;
      hamOK(data);
    });
  });
};
