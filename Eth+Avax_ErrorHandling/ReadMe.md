# Voting Smart Contract

This Solidity smart contract implements a voting system on the Ethereum blockchain. It demonstrates the use of `require()`, `assert()`, and `revert()` statements for error handling.

## Description

The Voting contract allows users to vote for one of three options within a specified time frame. It showcases fundamental concepts of smart contract development, including Time-based constraints, Ownership control, Vote tracking and tallying, and Error handling using Solidity's built-in functions

## Functions

### Constructor
- Sets the voting duration and contract owner.

### vote_1or2or3(uint _choice)
- It allows a user to cast a vote for one of the three options.
- It uses `require()` to check voting eligibility and validity.
- It uses `assert()` to guard against vote count overflow.

### endVoting()
- It allows the owner to end voting prematurely.
- It uses `require()` to restrict access to the owner.
- It uses `revert()` to prevent ending before the set duration.

### getResults()
- It returns the vote counts for all options.
- It uses `require()` to ensure that it can only be called after voting has ended.


## Getting Started

## Executing the Program

### To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to https://remix.ethereum.org/
2. Create a new file and name it `FlashToken.sol`
3. Copy and paste the provided code into the file
4. Compile the contract by clicking on the "Solidity Compiler" tab and then "Compile FlashToken.sol"

### To use this contract:

1. Deploy the contract by going to the "Deploy & Run Transactions" tab, selecting "FlashToken" from the dropdown, and clicking "Deploy"
2. The deployer's address will automatically receive 100,000 FlashTokens upon deployment
3. The contract owner can mint new tokens to any address using the `mint` function
4. Users can transfer tokens to other addresses using the `transfer` function
5. Token holders can burn their tokens using the `burn` function
6. Anyone can check token balances using the `balanceOf` function
7. The total supply of tokens can be checked using the `totalSupply` function.

   
## Authors

[@flash496](https://github.com/Flash496)

## License

This project is licensed under the MIT License.
