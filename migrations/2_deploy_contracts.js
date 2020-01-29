var CallSpread = artifacts.require("CallSpread");
var FeedBackedCall = artifacts.require("FeedBackedCall");
var loggable = artifacts.require("Loggable");
var TradingAccount = artifacts.require("TradingAccount");
var RandomizedPriceFeedApi = artifacts.require("RandomizedPriceFeedApi");
module.exports = function(deployer) {
    deployer.deploy(loggable);
  deployer.deploy(CallSpread);
  deployer.deploy(FeedBackedCall);
  deployer.deploy(TradingAccount);
  deployer.deploy(RandomizedPriceFeedApi);
  

};