// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PlusCalculatorProblem.sol";

contract MyPlusCalculator is IPlusCalculator {
    function plus(uint256 input1, uint256 input2) override public pure returns (uint256){
        return input1 + input2;
    }
}
