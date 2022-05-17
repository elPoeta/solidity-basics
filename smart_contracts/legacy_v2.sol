// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Legacy {
    address owner;
    uint256 fortune;
    bool isDeceased;

    constructor() public payable {
        owner = msg.sender; // msg sender -> address that is being called
        fortune = msg.value; // msg value -> tells us how much ether is being sent
        isDeceased = false;
    }

    address payable[] wallets;
    mapping(address => uint256) inheritance;

    function setInheritance(address payable wallet, uint256 amount) public {
        require(msg.sender == owner);
        wallets.push(wallet);
        inheritance[wallet] = amount;
    }

    function payout() private {
        for (uint256 i = 0; i < wallets.length; i++) {
            wallets[i].transfer(inheritance[wallets[i]]);
        }
    }

    function deceased() public payable {
        require(msg.sender == owner);
        require(isDeceased == false);
        isDeceased = true;
        payout();
    }
}
