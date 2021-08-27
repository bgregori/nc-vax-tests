#!/bin/bash
######################################################################### 
# 
#   Wrapper script to invoke the tests as StepRunner would have to.
#   Can be used to invoke tests from local machine.
#
#   Environment Variables that need to be set (currently done here):
#   
#   APP_ROUTE - Route to the app created for the current pipeline run
#   WEB_DRIVER_URL - URL for SeleniumGrid Hub (Not exposed by default)
######################################################################### 

export APP_ROUTE="http://simple-ui2-simpleui.apps.valkyrie.rhnaps.io"
export WEB_DRIVER_URL="http://se-hub-devsecops.apps.valkyrie.rhnaps.io/wd/hub"

# Invoke tests via Mocha. Tests are discovered in ./test
# The mocha-allure-reporter creates ./allure-results and drops its output there.
# Unfortunately this is not human readable, but IS a good target to be a pipeline
# artifact in Jenkins.
./node_modules/mocha/bin/mocha --reporter mocha-allure-reporter

# Use Allure CLI to generate the usable Reports which are saved to ./allure-report
./node_modules/allure-commandline/bin/allure generate allure-results --clean -o allure-report

# Spins up a node server to host the generated report, and opens your default
# browser to it.
# 
#       *** Remove this for CI/CD use cases ***
./node_modules/allure-commandline/bin/allure open