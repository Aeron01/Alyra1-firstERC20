// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Address.sol";
import "./Ownable.sol";

contract ICO is Ownable {

using Address for address payable;

    // State variables
    mapping(address => uint256) private _balances;
    uint256 private _timeStamp;    
    uint256 private _IcoEnd;
        
    // constructor
    constructor(address owner_, IcoEnd_) Ownable(owner_) {
      _timeStamp = block.timestamp+(IcoEnd_ * 1 days);
    }

    // event
    event Transfered(address indexed sender, address indexed recipient, uint256 amount);
    event Withdrew(address indexed recipient, uint256);

    // modifier
    modifier () {
      require(param, "ICO: ");
      _;
    }

    // fonctions
    receive() external payable {
      _buyWithEth(msg.sender, msg.value);
    }

    fallback() external {

    }

    function buyWithEth() external payable {
      require(msg.value > 0, "ICO: the sum must be greater than zero");
      _buyWithEth(msg.sender, msg.value);
      emit Transfered(msg.sender, msg.value);
    }

    function withdraw() public Ownable {
      require(block.timestamp > _IcoEnd, "ICO: ICO time is not closed");
      require(address(this).balance > 0, "ICO: can not withdraw 0 ether");
      payable(msg.sender).transfer(address(this).balance);
    }

    function buyToken(uint256 number) public payable {
      require(number > 0, "ICO: can not buy 0 Token");
    }

    function _buyWithEth(address sender, uint256 value) private {
      emit (sender, value);
    }
}