# DegenToken Smart Contract

This Solidity smart contract implements an ERC20 token with additional NFT functionality for a gaming ecosystem on the Ethereum blockchain. It demonstrates the use of OpenZeppelin libraries, custom NFT structures, and various token management functions.

## Description

The DegenToken contract allows for the creation, transfer, and management of both fungible tokens (DGN) and non-fungible tokens (NFTs) within a gaming context. It showcases fundamental concepts of smart contract development, including:

- ERC20 token implementation
- NFT creation and management
- Ownership control
- Token minting and burning
- NFT marketplace functionality

## Functions

### Token Management

#### mint_DGN(address to, uint256 amount)
- Allows the owner to mint new DGN tokens to a specified address.

#### burn_DGN(uint256 amount)
- Allows users to burn their own DGN tokens.

#### transfer(address to, uint256 amount)
- Overrides the ERC20 transfer function to include logging.

### NFT Management

#### mint_NFT(string memory name, uint256 price)
- Allows the owner to create new NFTs in the marketplace.

#### Burn_NFT(uint256 itemId)
- Allows the owner to remove NFTs from the marketplace.

#### Available_NFTs()
- Returns a list of available NFTs in the marketplace.

#### NFT_Price(uint256 itemId)
- Returns the price of a specific NFT.

#### redeem_NFT(uint256 itemId)
- Allows users to purchase NFTs using DGN tokens.

#### Owned_NFTs()
- Returns a list of NFTs owned by the caller.

#### resellNFT(uint256 itemId)
- Allows users to resell their NFTs back to the marketplace for 90% of the original price.

#### transfer_NFT(address to, uint256 itemId)
- Allows users to transfer their NFTs to other users for 90% of the original price.

## Getting Started

### Executing the Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to https://remix.ethereum.org/
2. Create a new file and name it `DegenToken.sol`.
3. Copy and paste the provided code into the file.
4. Compile the contract by clicking on the "Solidity Compiler" tab and then "Compile DegenToken.sol"

### To use this contract:

1. Deploy the contract by going to the "Deploy & Run Transactions" tab, selecting "DegenToken" from the dropdown, and clicking "Deploy"
2. Use the various functions to interact with the token and NFT ecosystem:
   - Mint DGN tokens using `mint_DGN`
   - Create NFTs using `mint_NFT`
   - Allow users to purchase NFTs with `redeem_NFT`
   - Enable NFT trading between users with `transfer_NFT`
   - Manage the NFT marketplace with other provided functions

## Authors

[Your Name or Username]

## License

This project is licensed under the MIT License.
