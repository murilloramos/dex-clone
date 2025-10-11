// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract UniswapV2Factory {
    // State variables

    address public feeTo; // Who will get the trading fees
    address public feeToSetter; // Who controls the trading fee system
    mapping(address => mapping(address => address)) public getPair; // Looking up for pools
    address[] public allPairs; // List of created pools

    // Events
    event PairCreated(address indexed token0, address indexed token1, address pair, uint256);

    // Constructor
    constructor(address _feeToSetter) public {
        feeToSetter = _feeToSetter;
    }

    function createPair(address tokenA, address tokenB) external returns (address pair) {
        // TODO:
        // 1. Validate tokens are different
        // 2. Sort tokens (smaller address first)
        // 3. Check pair doesn't already exist
        // 4. Deploy new pair contract
        // 5. Store pair in mapping
        // 6. Add to allPairs array
        // 7. Emit PairCreated event
        // 8. Return pair address
    }

    function setFeeTo(address _feeTo) external {
        // TODO:
        // Only feeToSetter will be able to call this
        // Update the feeTo address
    }

    function setFeeToSetter(address _feeToSetter) external {
        // TODO:
        // Only the current feeToSetter can call this
        // Transfer control to a new address
    }

    function allPairsLength() external view returns (uint256) {
        return allPairs.length;
    }
}