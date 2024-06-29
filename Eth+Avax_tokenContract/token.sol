// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract FlashToken is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 1000000 * 10**18; // 1 million tokens
    
    constructor() ERC20("FlashToken", "Flash") Ownable(msg.sender) {
        // Mint 100,000 tokens to the contract creator upon deployment
        _mint(msg.sender, 100000 * 10**18);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds maximum supply");
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    //Explicitly added and overriden transfer function
    function transfer(address to, uint256 amount) override public virtual returns (bool) {
        bool transferred = super.transfer(to, amount);          //super keyword keeps the original transfer function from the parent contract (ERC20)
        if (transferred) {
            console.log("Transferred %s tokens from %s to %s", amount, msg.sender, to);
        }
        return transferred;
    }
}
