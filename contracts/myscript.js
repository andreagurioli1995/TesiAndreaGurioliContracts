const CallSpread = artifacts.require("CallSpread");

contract("CallSpread", accounts => {
  it("should put 10000 MetaCoin in the first account", () =>
  CallSpread.deployed()
      .then(instance => instance.ping())
      .then(balance => {
        console.log(Date.now);
        assert.equal(
          balance.valueOf(),
          10000,
          "10000 wasn't in the first account"
        );
      }));

});