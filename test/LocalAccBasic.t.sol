// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/LocalAccount.sol";

contract LocalB is Test {

    LocalAccount localA;
    function setUp() public {
        localA = new LocalAccount(address(306));
    
    }

    function testCreatesNewAcc() public {
        vm.prank(address(1));
        address newA = localA.newAccount();
        assertTrue(localA.getNonceOf(address(1)) == 1);
    }

}
