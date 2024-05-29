// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract shiftingSched {

  function firstShift(uint hour) public pure {  
      require(hour > 9, "Not enough hours for first shift");
  }

  function secondShift(uint hour) public pure {
      assert(hour >=10);
  }

  function thirdShift(uint hour) public pure {
    if (hour <= 10 ){
      revert("Not enough hours for third shift");
    }
    else {
        revert("Overtime");
  }
}
}
