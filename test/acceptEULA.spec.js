const globals = require('../test_resources/globals.js')

// Generated by Selenium IDE
const { Builder, By, Key, until } = require('selenium-webdriver')
const assert = require('assert')

describe('Accept EULA and assert navigation to Profile', function() {
  this.timeout(30000)
  let driver
  let vars
  before(async function() {
    driver = await new Builder().forBrowser(globals.browser).usingServer(globals.webDriverUrl).build()
    vars = {}
  })
  after(async function() {
    await driver.quit();
  })
  it('Launch app', async function() {
    await driver.get(globals.appRoute)
  })
  it('Accept the EULA', async function() {
    await driver.findElement(By.css(".pf-m-display-lg")).click()
  })
  it('Assert we land on profile page', async function() {
    assert(await driver.getCurrentUrl() == globals.appRoute + "/profile")
  })
})
