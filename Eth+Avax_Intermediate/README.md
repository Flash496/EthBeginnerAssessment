# ErrorHandling Smart Contract

ErrorHandling is a simple Solidity smart contract that showcases different error handling mechanisms, including `require()`, `assert()`, and `revert()`. This contract enables users to deposit and withdraw funds while enforcing various conditions to maintain contract integrity.

## Contract Overview

The ErrorHandling contract allows users to interact with three main functions:

- `deposit(uint256 _amount)`: Deposits funds into the contract, enforcing that the deposit amount must be greater than zero using `require()`. Gas is refunded upon error.
- `withdrawA(uint256 _amount)`: Withdraws funds from the contract, ensuring that the contract has enough balance to fulfill the withdrawal request using `assert()`. All remaining gas is consumed upon error.
- `withdrawR(uint256 _amount)`: Similar to `withdrawA`, this function allows for fund withdrawal. It utilizes `revert()` to handle the error condition if the contract lacks sufficient balance. An optional custom error message, "Insufficient balance," is provided, and remaining gas is refunded upon error.

## Usage

### Getting Started

To interact with the ErrorHandling contract:

1. **Deploy the Contract**: Use a compatible Ethereum development environment or blockchain network to deploy the contract.
2. **Interact with Functions**: After deployment, call the `deposit`, `withdrawA`, and `withdrawR` functions with appropriate parameters to observe the error handling mechanisms in action.
3. **Observe Error Handling**: Experiment with different inputs to understand how `require()`, `assert()`, and `revert()` handle errors in various scenarios.

## License

This smart contract is released under the [MIT License](LICENSE).

## Authors

- [@flash496](https://www.github.com/flash496)
