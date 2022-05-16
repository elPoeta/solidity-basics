// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract HelloWorld {
    string greeting;

    constructor() {
        greeting = "Hello World!!!";
    }

    function greet() public view returns (string memory) {
        return greeting;
    }
}
