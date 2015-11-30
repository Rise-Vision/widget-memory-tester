var webdriver = require('selenium-webdriver');
var chrome = require('selenium-webdriver/chrome');
var path = require('chromedriver').path;

var service = new chrome.ServiceBuilder(path).build();
chrome.setDefaultService(service);

var options = new chrome.Options();

options.addArguments("enable-precise-memory-info");

var browser = new chrome.Driver(options, service);

var DISPLAY_ID = process.env.DISPLAY_ID;
var RUNNING_TIME = process.env.RUNNING_TIME;

browser.get('http://rvashow.appspot.com/Viewer.html?type=display&player=true&id='+DISPLAY_ID); // Run presentation
browser.sleep((RUNNING_TIME)? RUNNING_TIME : 60*60*1000); // Run for an hour if no time is passed
console.log('Done!');
browser.quit();
