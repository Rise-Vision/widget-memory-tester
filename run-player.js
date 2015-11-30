var webdriver = require('selenium-webdriver');
var chrome = require('selenium-webdriver/chrome');
var path = require('chromedriver').path;

var service = new chrome.ServiceBuilder(path).build();
chrome.setDefaultService(service);

var browser = new webdriver.Builder()
  .withCapabilities(webdriver.Capabilities.chrome())
  .build();


var DISPLAY_ID = process.env.DISPLAY_ID;

browser.get('http://rvashow.appspot.com/Viewer.html?type=display&player=true&id='+DISPLAY_ID); // Run presentation
browser.sleep(30000); // 30 seconds
console.log('Done!');
browser.quit();
