# NC VAX TRAX - UI Testing Framework

## Technology Overview

- Selenium - Browser based UI test automation. Deployed already as part of the Ploigos tooling
- Mocha - JavaScript test framework running on Node.js
- Allure - Test output visualization. Jenkins plugin available to get the reports directly in Jenkins attached to the builds.

## Quick Start
```
git clone https://github.com/bgregori/nc-vax-tests.git
cd nc-vax-tests
./prep_env.sh
./run_tests.sh
```

### Environment Variables

Environment Variables that are required. They are set up for at the top of the `./run_tests.sh` script in project base directory. 

- `APP_ROUTE`: `Application Under Test Base Url`
- `WEB_DRIVER_URL`: `Selenium Grid URL`
- `BROWSER`: `chrome` or `firefox`


## Test Creation

Leverage the Selenium IDE browser extension as a base for you tests. This can be downloaded [selenium ide](https://www.selenium.dev/selenium-ide/). This tool will allow you to record test scripts and export them in a variety of languages. 

In order to create a test:
1. Record a script with your desired test case.
2. Right click on the name of the test and select "export". For this project export as `JavaScript - Mocha`. 
3. Add the following to the top of the file exported: `const globals = require('../globals.js');`
4. Replace the URL's / browser hard-coded in the gin the file exported from IDE: 
```
globals.webDriverUrl
globals.appRoute
globals.browser
```
5. Save your file to the `./test` directory


## Allure 

### Allure Reports

### Adding Allure Test and Steps to use case