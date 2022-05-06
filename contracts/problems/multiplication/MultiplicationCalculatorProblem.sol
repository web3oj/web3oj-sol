// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IMultiplicationCalculator {
    function multiply(uint256, uint256) external pure returns (uint256);
}

contract MultiplicationCalculatorProblem{
    IMultiplicationCalculator public multiplicationCalculator;

    function setMultiplicationCalculator(address _multiplicationCalculator) public {
        multiplicationCalculator = IMultiplicationCalculator(_multiplicationCalculator);
    }
}
