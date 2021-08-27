#!/bin/bash
######################################################################### 
# 
#   Installs dependencies for running UI tests. Would need to do this
#   inside the StepRunner
#
#   selenium-webdriver    - Used to interface with Selenium Grid
#   mocha                 - JavaScript test framework running on Node.js
#   mocha-allure-reporter - Mocha plugin to output raw Allure files
#   allure-commandline    - CLI utils for generating the Allure reports
######################################################################### 

npm install selenium-webdriver
npm install mocha
npm install mocha-allure-reporter
npm install allure-commandline
