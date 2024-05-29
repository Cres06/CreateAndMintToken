// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Cresz06 is ERC20 {
    address private _owner;

constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
    _owner = msg.sender;
    _mint(_owner, initialSupply);
}

modifier CresOwner() {
    require(msg.sender == _owner, "Only owner can execute this function");
    _;
}

function mint(address to, uint256 amount) external CresOwner {
    _mint(to, amount);
}

function burn(uint256 amount) external {
    _burn(msg.sender, amount);
}

function transfer(address recipient, uint256 amount) public override returns (bool) {
    require(recipient != address(0), "ERC20: transfer to the zero address");
    _transfer(_msgSender(), recipient, amount);
    return true;
}

function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
    require(recipient != address(0), "ERC20: transfer to the zero address");
    uint256 currentAllowance = allowance(sender, _msgSender());
    require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
    _transfer(sender, recipient, amount);
    _approve(sender, _msgSender(), currentAllowance - amount);
    return true;
}
}
