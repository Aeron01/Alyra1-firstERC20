// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";
import "./Ownable.sol";


contract ICO is Ownable {

using Address for address payable;

    // State variables
    mapping(address => uint256) private _balances;
    uint256 private _timeStamp;    
    uint256 private _icoEnd;
    address private _lapinCretin;
        
    // constructor
    constructor(address lapinCretinAddress, uint256 icoEnd_) {
      _lapinCretin = lapinCretinAddress;
      _timeStamp = block.timestamp+(icoEnd_ * 1 days);
    }
    
   // event
    event Transfered(address indexed sender, uint256 amount);
    event Withdrew(address indexed recipient, uint256);
    event Bought(address indexed sender, uint256 value);

    // modifier
    /*
    modifier () {
      require(param, "ICO: ");
      _;
    }
    */
    
    // fonctions
    receive() external payable {
      _buyWithEth(msg.sender, msg.value);
    }

    fallback() external payable {

    }

    function buyWithEth() external payable {
      require(msg.value > 0, "ICO: the sum must be greater than zero");
      _buyWithEth(msg.sender, msg.value);
      emit Transfered(msg.sender, msg.value);
    }

    function withdraw() public /*Ownable(owner_)*/ {
      require(block.timestamp > _icoEnd, "ICO: ICO time is not closed");
      require(address(this).balance > 0, "ICO: can not withdraw 0 ether");
      payable(msg.sender).transfer(address(this).balance);
    }

    function buyToken(uint256 number) public payable {
      require(number > 0, "ICO: can not buy 0 Token");
    }

    function _buyWithEth(address sender, uint256 value) private {
      emit Bought(sender, value);(sender, value);
    }

}