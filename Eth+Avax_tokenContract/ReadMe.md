# FlashToken ERC20 Contract

This Solidity program implements a basic ERC20 token contract called FlashToken. It demonstrates the fundamental functionality of creating, transferring, and burning tokens on the Ethereum blockchain. The purpose of this program is to serve as a starting point for those who want to create their own ERC20 token and understand the basics of token economics.

## Description

This program is a smart contract written in Solidity, designed for the Ethereum blockchain. The contract creates an ERC20 token with the following features:
- Minting new tokens (restricted to the contract owner)
- Burning tokens
- Transferring tokens between addresses with logging
- A maximum supply cap of 1 million tokens

This FlashToken contract can be used as a foundation for more complex token systems or as a learning tool for understanding ERC20 token implementation.

## Functions

The FlashToken contract provides these functionas:

1. Token Information:
   - Name: FlashToken
   - Symbol: Flash
   - Decimals: 18 (default for ERC20)
   - Maximum Supply: 1,000,000 tokens

2. Initial Minting:
   - Upon deployment, 100,000 tokens are minted to the contract deployer's address.

3. Minting (Owner Only):
   - The contract owner can mint new tokens to any address.
   - Minting is restricted by the maximum supply cap of 1,000,000 tokens.

4. Burning:
   - Any token holder can burn (destroy) their own tokens.

5. Transferring:
   - Token holders can transfer their tokens to any other address.
   - The transfer function is explicitly overridden to include logging.

6. Allowances:
   - Token holders can approve other addresses to spend a certain amount of their tokens.
   - Approved spenders can transfer tokens on behalf of the token holder.

7. Balance and Supply Queries:
   - Anyone can check the token balance of any address.
   - The total supply of tokens in circulation can be queried.

8. Ownership Management:
   - The contract has an owner (initially the deployer).
   - Ownership can be transferred to another address.

9. Logging:
   - The transfer function logs details of each transfer using Hardhat's console.log.


## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., FlashToken.sol). Copy and paste the provided code into your file.

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile FlashToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "FlashToken" contract from the dropdown menu, and then click on the "Deploy" button.

After the contract is deployed, you can interact with it by using its functions.


## Authors

[@flash496](https://github.com/Flash496)

## License

This project is licensed under the MIT License
