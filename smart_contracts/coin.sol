// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public owner;
    mapping(address => uint256) public balances;
    event Sent(address from, address to, uint256 amount);
    error insufficientBalance(uint256 requested, uint256 available);

    constructor() {
        owner = msg.sender;
    }

    function mint(address reciever, uint256 amount) public {
        require(msg.sender == owner);
        balances[reciever] += amount;
    }

    function send(address reciever, uint256 amount) public {
        if (balances[msg.sender] < amount)
            revert insufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Sent(msg.sender, reciever, amount);
    }
}
