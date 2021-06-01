// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Lahar is ERC20 {
  constructor(address owner_, uint256 initialSupply) ERC20("Lahar", "LAH") {
    _mint(owner_, initialSupply);
  }
}