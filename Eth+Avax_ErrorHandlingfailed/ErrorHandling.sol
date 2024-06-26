// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    uint256 public balance;

    function deposit(uint _amount) external {
        // Ensures that the deposit amount must be not 0
        // with an optional custom message
        // refunds remaining gas upon error
        require(_amount > 0, "Amount must be greater than zero");
        
        // add the deposited amount to balance
        balance += _amount;
    }

    function withdrawA(uint _amount) external {
        // Ensure that the contract has enough balance using assert
        // The remaining gas is consumed upon error
        assert(balance >= _amount);
        
        // add the deposited amount to balance
        balance -= _amount;
    }

    function withdrawR(uint _amount) external {
        // Checks if the contract has enough balance 
        if (balance < _amount) {
            // If the condition is false then the transaction is reverted 
            // with an optional custom message
            // the remaining gas is refunded upon error
            revert("Insufficient balance");
        }
        
        // subtracts the amount from balance
        balance -= _amount;
    }
}
