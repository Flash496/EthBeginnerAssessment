// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {

//structure of our NFTs that will be in the store
    struct NFTItem {
        string name;
        uint256 price;
        bool isAvailable;
    }

    NFTItem[] public nftItems;
    mapping(address => mapping(uint256 => bool)) public ownedNFTs;

//events that will be useful when we integrate it with a frontend
    event NFTRedeemed(address player, uint256 itemId, string name);
    event NFTMinted(uint256 itemId, string name, uint256 price);
    event NFTBurned(uint256 itemId, string name);
    event NFTTransferred(address from, address to, uint256 itemId, string name, uint256 price);
    event NFTResold(address player, uint256 itemId, string name);


    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        console.log("Deployed Degen Gaming Token");
    }


//Functions for minting and burning (only by the owner) and transferring tokens (by anyone)
    function mint_DGN(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        console.log("Minted %s tokens to %s", amount, to);
    }

    function burn_DGN(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        console.log("Burned %s tokens from %s", amount, msg.sender);
    }

    function transfer(address to, uint256 amount) override public virtual returns (bool) {
        bool transferred = super.transfer(to, amount);          //super keyword keeps the original transfer function from the parent contract (ERC20)
        if (transferred) {
            console.log("Transferred %s tokens from %s to %s", amount, msg.sender, to);
        }
        return transferred;
    }
    

//Nft Store functions for minting and burning (only by the owner)
    function mint_NFT(string memory name, uint256 price) public onlyOwner {
        nftItems.push(NFTItem(name, price, true));
        uint256 newItemId = nftItems.length - 1;
        emit NFTMinted(newItemId, name, price);
    }

    function Burn_NFT(uint256 itemId) public onlyOwner {
        require(itemId < nftItems.length, "Invalid item ID");
        require(nftItems[itemId].isAvailable, "NFT is not available for deletion");
        
        emit NFTBurned(itemId, nftItems[itemId].name);
        
        // Move the last item to the deleted position
        nftItems[itemId] = nftItems[nftItems.length - 1];
        nftItems.pop();
    }

//Lists all available NFTs in the store
    function Available_NFTs() public view returns (string[] memory, uint256[] memory) {
        uint availableCount = 0;
        for (uint i = 0; i < nftItems.length; i++) {
            if (nftItems[i].isAvailable) {
                availableCount++;
            }
        }

        string[] memory names = new string[](availableCount);
        uint256[] memory prices = new uint256[](availableCount);
        uint currentIndex = 0;

        for (uint i = 0; i < nftItems.length; i++) {
            if (nftItems[i].isAvailable) {
                names[currentIndex] = nftItems[i].name;
                prices[currentIndex] = nftItems[i].price;
                currentIndex++;
            }
        }

        return (names, prices);
    }

//Returns price for the NFT in the store
    function NFT_Price(uint256 itemId) public view returns (uint256) {
        require(itemId < nftItems.length, "Invalid item ID");
        return nftItems[itemId].price;
    }


//Function for anyone to redeem the nfts using their DegenToken
    function redeem_NFT(uint256 itemId) public {
        require(itemId < nftItems.length, "Invalid item ID");
        require(nftItems[itemId].isAvailable, "NFT not available");
        require(balanceOf(msg.sender) >= nftItems[itemId].price, "Insufficient balance");
        require(!ownedNFTs[msg.sender][itemId], "NFT already owned");

        _burn(msg.sender, nftItems[itemId].price);
        ownedNFTs[msg.sender][itemId] = true;
        nftItems[itemId].isAvailable = false;

        console.log("Player %s redeemed NFT %s", msg.sender, itemId);
        emit NFTRedeemed(msg.sender, itemId, nftItems[itemId].name);
    }


//Returns Owned NFTs of a player
    function Owned_NFTs() public view returns (string[] memory) {
        uint ownedCount = 0;
        for (uint i = 0; i < nftItems.length; i++) {
            if (ownedNFTs[msg.sender][i]) {
                ownedCount++;
            }
        }

        string[] memory ownedNFTNames = new string[](ownedCount);
        uint currentIndex = 0;

        for (uint i = 0; i < nftItems.length; i++) {
            if (ownedNFTs[msg.sender][i]) {
                ownedNFTNames[currentIndex] = nftItems[i].name;
                currentIndex++;
            }
        }

        return ownedNFTNames;
    }

//Function that lets u resell the NFTs for 90 percent of its original value back to the store
    function resellNFT(uint256 itemId) public {
        require(itemId < nftItems.length, "Invalid item ID");
        require(ownedNFTs[msg.sender][itemId], "You don't own this NFT");

        uint256 resellPrice = nftItems[itemId].price * 90 / 100; // 90% of original price
        _mint(msg.sender, resellPrice);
        ownedNFTs[msg.sender][itemId] = false;
        nftItems[itemId].isAvailable = true;

        console.log("Player %s resold NFT %s", msg.sender, itemId);
        emit NFTResold(msg.sender, itemId, nftItems[itemId].name);
    }


//Function that enables players to sell their owned NFTs to Other players in exchange for 90% of the original cost
    function transfer_NFT(address to, uint256 itemId) public {
        require(itemId < nftItems.length, "Invalid item ID");
        require(ownedNFTs[msg.sender][itemId], "You don't own this NFT");
        require(to != address(0), "Invalid recipient address");
        require(to != msg.sender, "Cannot transfer to yourself");

        uint256 salePrice = nftItems[itemId].price * 90 / 100; // 90% of original price
        require(balanceOf(to) >= salePrice, "Buyer has insufficient balance");

        // Transfer the NFT to the buyer address
        ownedNFTs[msg.sender][itemId] = false;
        ownedNFTs[to][itemId] = true;

        // Transfer the DGN to the seller address
        _transfer(to, msg.sender, salePrice);

        console.log("Player %s transferred NFT %s to %s", msg.sender, itemId, to);
        emit NFTTransferred(msg.sender, to, itemId, nftItems[itemId].name, salePrice);
    }
}
