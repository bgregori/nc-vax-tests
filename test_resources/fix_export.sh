#!/bin/bash
######################################################################### 
# 
#   Takes an exported SeleniumIDE Mocha test and substitutes our hooks
#   for pulling in values via the global.js module.
#
#   USAGE: ./fix_export <filename>
######################################################################### 

sed -i '' 's/usingServer(.*)\./usingServer(globals.webDriverUrl)\./g' $1
sed -i '' 's/driver.get(.*)/driver.get(globals.appRoute)/g' $1
sed -i '' "s/\'chrome\'/globals.browser/g" $1
sed -i '' "1s;^;const globals = require\(\'../test_resources/globals.js\'\)\n\n;" $1
sed -i '' "s/beforeEach/before/g" $1
sed -i '' "s/afterEach/after/g" $1

