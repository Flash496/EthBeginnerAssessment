# SimpleToken ERC20 Contract

This Solidity program implements a basic ERC20 token contract called SimpleToken. It demonstrates the fundamental functionality of creating, transferring, and burning tokens on the Ethereum blockchain. The purpose of this program is to serve as a starting point for those who want to create their own ERC20 token and understand the basics of token economics.

## Description

This program is a smart contract written in Solidity, designed for the Ethereum blockchain. The contract creates an ERC20 token with the following features:
- Minting new tokens (restricted to the contract owner)
- Burning tokens
- Transferring tokens between addresses
- A maximum supply cap of 1 million tokens

This SimpleToken contract can be used as a foundation for more complex token systems or as a learning tool for understanding ERC20 token implementation.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., SimpleToken.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleToken is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 1000000 * 10**18; // 1 million tokens
    
    constructor() ERC20("SimpleToken", "SIM") Ownable(msg.sender) {
        _mint(msg.sender, 100000 * 10**18);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds maximum supply");
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
