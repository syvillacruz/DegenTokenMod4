# DegenToken Mod 4 Villacruz

## Description

The DegenToken contract is an ERC20 token implementation with additional functionalities for minting, burning, transferring, checking balances, and redeeming tokens for items. It is designed using Solidity and leverages OpenZeppelin libraries for standard functionalities and ownership control.

## Imports
```
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
```
The contract imports the ERC20 token standard and Ownable contract from the OpenZeppelin library.

ERC20: Provides the standard implementation of the ERC20 token.
Ownable: Adds ownership control to the contract, which allows certain functions to be restricted to the contract owner.

## Constructor 

The constructor initializes the contract with:

  The name "Degen" and symbol "DGN" for the ERC20 token.
  Sets the deployer of the contract as the owner using Ownable.
  Mints 100 tokens (adjusted for decimals) to the contract owner.

## Mint Function
```
function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}
```
This function allows the owner to mint new tokens and send them to a specified address. The onlyOwner modifier restricts access to the contract owner.

## Burn Function

```
function burn(uint256 amount) public {
    _burn(msg.sender, amount);
}
```
This function allows any token holder to burn (destroy) their own tokens by specifying the amount to be burned.

## Transfer Token Function

```
function transferToken(address recipient, uint256 amount) public {
    emit Transfer(msg.sender, recipient, amount);
    _transfer(msg.sender, recipient, amount);
}
```
This function allows a user to transfer tokens to another address. It emits a Transfer event and calls the _transfer function to execute the transfer.

## Balance Check Function

```
function balanceCheck() public view returns (uint256) {
    return balanceOf(msg.sender);
}
```
This function allows a user to check their token balance.

## Balance Check Function

```
function redeem(uint item) public returns (string memory message) {
    if (item == 1) {
        require(balanceOf(msg.sender) >= 10, "Wrong Amount");
        burn(10);
        message = "You have bought the shoes!";
    } else if (item == 2) {
        require(balanceOf(msg.sender) >= 15, "Wrong Amount");
        burn(15);
        message = "You have bought the watch!";
    } else if (item == 3) {
        require(balanceOf(msg.sender) >= 20, "Wrong Amount");
        burn(20);
        message = "You have bought the cologne!";
    }
    return message;
}
```
This function allows users to redeem their tokens for items:

Item 1 (shoes) costs 10 tokens.
Item 2 (watch) costs 15 tokens.
Item 3 (cologne) costs 20 tokens.
The function checks if the user has enough tokens, burns the required amount, and returns a success message.

## Authors
syvillacruz

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
