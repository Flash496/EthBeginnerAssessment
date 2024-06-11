# ErrorHandling Smart Contract

ErrorHandling is a simple Solidity smart contract that showcases different error handling mechanisms: `require()`, `assert()`, and `revert()`. I am able to run this code efficiently using the REMIX IDLE. This contract enables users to deposit and withdraw funds while enforcing various error handling methods. Using this as an example we can understand how the methods are different from eachother and in which situations they are used.

## Contract Overview

The ErrorHandling contract allows users to interact with three main functions:

- `deposit(uint _amount)`: Deposits funds into the contract, ensuring that the deposit amount must be greater than 0 using `require()`. An optional custom error message, "Amount must be greater than zero" is provided, and remaining gas is refunded upon error.
  
- `withdrawA(uint _amount)`: Withdraws funds from the contract, ensuring that the contract has enough balance to fulfill the withdrawal request using `assert()`. All remaining gas is consumed upon error.
  
- `withdrawR(uint _amount)`: Similar to `withdrawA`, this function allows for fund withdrawal but, It utilizes `revert()` to handle the error condition if the contract lacks sufficient balance. An optional custom error message, "Insufficient balance," is provided, and remaining gas is refunded upon error.

### Purpose:

`require()`: Validate conditions that should be true before executing the function logic.

`revert()`: Explicitly trigger a revert, often used in more complex error handling.

`assert()`: Ensure conditions that should never be false, used for catching bugs and checking invariants.

## Usage

### Getting Started

To interact with the ErrorHandling contract:

1. **Deploy the Contract**: To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.
   Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ErrorHandling.sol).
   To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0", and then click on the "Compile ErrorHandling.sol" button.
Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorHandling" contract from the dropdown menu, and then click on the "Deploy" button.

3. **Interact with Functions**: After deployment, call the `deposit`, `withdrawA`, and `withdrawR` functions with integer values to observe the error handling mechanisms in action.
   
5. **Observe Error Handling**: Experiment with different inputs to understand how `require()`, `assert()`, and `revert()` handle errors in various scenarios.

## Authors

- [@flash496](https://www.github.com/flash496)

## License

This smart contract is released under the [MIT License].
