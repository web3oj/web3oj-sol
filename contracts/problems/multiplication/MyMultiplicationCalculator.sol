// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMultiplicationCalculator {
    function multiply(uint256, uint256) external pure returns (uint256);
}

contract MyMultiplicationCalculator is IMultiplicationCalculator {
    function multiply(uint256 input1, uint256 input2) override public pure returns (uint256){
        // 여기에 작성하시오.
    }
}
