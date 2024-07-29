// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable{

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        _mint(msg.sender, 100 * 10**uint(decimals()));
    }

    function mint(address to, uint256 amount) public onlyOwner{
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transferToken(address recipient, uint256 amount) public {
        emit Transfer(msg.sender, recipient, amount);
        _transfer(msg.sender, recipient, amount);

    }

    function balanceCheck() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function redeem(uint item) public returns (string memory message) {
        if (item == 1) {
            require (balanceOf(msg.sender) >= 10, "Wrong Amount");
            burn(10);
            message = "You have bought the shoes!";
        }

        else if (item == 2){
            require (balanceOf(msg.sender) >= 15, "Wrong Amount");
            burn(15);
            message = "You have bought the watch!";
        }

        else if (item == 3){
            require (balanceOf(msg.sender) >= 20, "Wrong Amount");
            burn(20);
            message = "You have bought the cologne!";
        }

        return message;

    }


}
