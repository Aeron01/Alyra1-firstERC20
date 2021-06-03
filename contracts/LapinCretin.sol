// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// import oppen zeppelin ERC20 contracts

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// contract name (j'ai mis lapin crétin car actuellement j'ai l'impression d'en être devenue un.)

contract LapinCretin is ERC20 {

  // constructor
  constructor(address owner_, uint256 initialSupply) ERC20("LapinCretin", "LAC") {
    _mint(owner_, initialSupply);
  }
}