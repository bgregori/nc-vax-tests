# NC COVIDSafe - UI Testing Framework

## Technology Overview

- Selenium - Browser based UI test automation. Deployed already as part of the Ploigos tooling
- Mocha - JavaScript test framework running on Node.js
- Allure - Test output visualization. Jenkins plugin available to get the reports directly in Jenkins attached to the builds.

## Quick Start
```
git clone https://github.com/bgregori/nc-vax-tests.git
cd nc-vax-tests
./test_resources/prep_env.sh
./test_resources/run_tests.sh
```

### Environment Variables

Environment Variables that are required: 

- `APP_ROUTE`: `Application Under Test Base Url`
- `WEB_DRIVER_URL`: `Selenium Grid URL`
- `BROWSER`: `chrome` or `firefox`


### Manually Invoke Tests

Invoke tests via Mocha. Tests are discovered in `./test`
`./node_modules/mocha/bin/mocha --reporter mocha-allure-reporter`


## Test Creation

Leverage the Selenium IDE browser extension as a base for you tests. This can be downloaded [selenium ide](https://www.selenium.dev/selenium-ide/). This tool will allow you to record test scripts and export them in a variety of languages. 

In order to create a test:
1. Record a script with your desired test case.
2. Right click on the name of the test and select "export". For this project export as `JavaScript - Mocha`. 
3. Save your file to the `./test` directory
4. Run the `./test_resources/fix_export.sh` script against the exported file

## Allure 

### Allure Reports

The output of running the Mocha tests is a raw data file for Allure. From this output you can then generate the reports.

### Adding Allure Test and Steps to use case

The export will put all test steps into a single test case. To provide more granular reporting we want to break these up into multiple test cases.

- `describe` function should wrap entire test case
- `it` function should label each step

See `/test/acceptEULA.spec.js`

### Manually Invoke Allure Reports

Use Allure CLI to generate the usable Reports which are saved to ./allure-report
`./node_modules/allure-commandline/bin/allure generate allure-results --clean -o allure-report`

Spins up a node server to host the generated report, and opens your default browser to it.
`./node_modules/allure-commandline/bin/allure open`













