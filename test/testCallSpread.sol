pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CallSpread.sol";

contract testCallSpread {
 // The address of the adoption contract to be tested
 CallSpread callspread = CallSpread(DeployedAddresses.CallSpread());



//test ping 
 function testPingCallSpread() public {
 // uint val = callspread.initialize();

  //Assert.equal(val, null, "Adoption of the expected pet should match what is returned.");
}

}