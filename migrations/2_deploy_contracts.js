var CallSpread = artifacts.require("CallSpread");
var FeedBackedCall = artifacts.require("FeedBackedCall");
var FeedBackedCall2 = artifacts.require("FeedBackedCall");
var loggable = artifacts.require("Loggable");
var TradingAccount = artifacts.require("TradingAccount");
var TradingAccount2 = artifacts.require("TradingAccount");
var RandomizedPriceFeedApi = artifacts.require("RandomizedPriceFeedApi");
module.exports = function(deployer) {
    deployer.deploy(loggable);
  deployer.deploy(CallSpread);
  deployer.deploy(FeedBackedCall);
  deployer.deploy(FeedBackedCall2);
  deployer.deploy(TradingAccount);
  deployer.deploy(TradingAccount2);
  deployer.deploy(RandomizedPriceFeedApi);
  

};