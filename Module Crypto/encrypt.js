var crypto = require("crypto");

var mykey = crypto.createCipher("aes-128-cbc", "123456");
var mystr = mykey.update("abc", "utf8", "hex");
mystr += mykey.final("hex");

console.log(mystr);
//chạy file: 3f3435d40081cf85335f2c668bbadd3a
