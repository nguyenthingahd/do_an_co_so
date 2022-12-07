var crypto = require("crypto");

var mykey = crypto.createDecipheriv("aes-128-cbc", "123456");
var mystr = mykey.update("3f3435d40081cf85335f2c668bbadd3a", "hex", "utf8");
mystr += mykey.final("utf8");

console.log(mystr);
// chạy file: abc
