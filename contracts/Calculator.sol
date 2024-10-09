// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Calculator {
    uint256 result = 0;

    function add(uint256 a, uint256 b) external {
        result = a + b;
    }

    function subtract(uint256 a, uint256 b) public {
        result = a - b;
    }

    function multiply(uint256 a, uint256 b) public {
        result = a * b;
    }

    function get() public view returns (uint256) {
        return result;
    }
}
