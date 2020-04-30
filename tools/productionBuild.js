const shell = require("shelljs");

shell.exec(
  "wget --no-verbose -O mint https://mint-lang.s3-eu-west-1.amazonaws.com/mint-latest-linux"
);

shell.chmod("+x", "mint");

shell.exec("./mint build");
