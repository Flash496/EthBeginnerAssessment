# Voting Smart Contract

This Solidity smart contract implements a basic voting system on the Ethereum blockchain. It demonstrates the use of `require()`, `assert()`, and `revert()` statements for error handling and control flow.

## Description

The Voting contract allows users to vote for one of three options within a specified time frame. It showcases fundamental concepts of smart contract development, including:

- Time-based constraints
- Ownership control
- Vote tracking and tallying
- Error handling using Solidity's built-in functions

## Features

1. Timed Voting: Voting is only allowed for a specified duration set at contract deployment.
2. Single Vote per Address: Each Ethereum address can vote only once.
3. Three Voting Options: Users can choose between three voting options.
4. Owner-controlled Ending: Only the contract owner can end the voting prematurely.
5. Result Viewing: After voting ends, anyone can view the results.

## Functions

### Constructor
- Sets the voting duration and contract owner.

### vote_1or2or3(uint _choice)
- Allows a user to cast a vote for one of the three options.
- Uses `require()` to check voting eligibility and validity.
- Uses `assert()` to guard against vote count overflow.

### endVoting()
- Allows the owner to end voting prematurely.
- Uses `require()` to restrict access to the owner.
- Uses `revert()` to prevent ending before the set duration.

### getResults()
- Returns the vote counts for all options.
- Can only be called after voting has ended.

## Getting Started

To use this contract:

1. Deploy the contract, specifying the voting duration in minutes.
2. Users can call `vote_1or2or3(uint _choice)` to cast their votes (1, 2, or 3).
3. The owner can call `endVoting()` to close the vote after the duration has passed.
4. Anyone can call `getResults()` to view the final vote counts.

## Executing the Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to https://remix.ethereum.org/
2. Create a new file and name it `Voting.sol`
3. Copy and paste the provided code into the file
4. Compile the contract by clicking on the "Solidity Compiler" tab and then "Compile Voting.sol"
5. Deploy the contract by going to the "Deploy & Run Transactions" tab, selecting "Voting" from the dropdown, entering the voting duration in minutes, and clicking "Deploy"
6. Interact with the deployed contract using the provided functions

## Authors

[Your Name]

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
