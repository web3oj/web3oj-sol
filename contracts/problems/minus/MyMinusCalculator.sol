// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMinusCalculator {
    function minus(uint256, uint256) external pure returns (uint256);
}

contract MyMinusCalculator is IMinusCalculator {
    function minus(uint256 input1, uint256 input2) override public pure returns (uint256){
        // TODO
    }
}
