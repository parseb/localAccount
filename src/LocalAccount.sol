// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "delegatable-sol/Delegatable.sol";

contract LocalAccount is Delegatable {
    
    mapping(address => uint256) nonce;
    address server;

    constructor(address executor_) {
        server = executor_;
    }


    function newAccount() external returns(address) {
        address lAddr = localAddr(msg.sender);
        unchecked { ++nonce[lAddr]; }
        return lAddr;
    }


    function localAddr(address x_) public pure returns (address) {
        return address(uint160(bytes20(x_)) % 32); 
    }

    function getNonceOf(address who_) public view returns (uint256) {
        return nonce[who_];
    }



}
