// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

import "./UniswapV2Pair.sol";
import "../interfaces/IUniswapV2Pair.sol";

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
        // 1. Validate tokens
        require(tokenA != tokenB, "Addresses are Identical!");
        require(tokenA != address(0) && tokenB != address(0), "Address Zero!");

        // 2. Sort tokens (smaller address first)
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);

        // 3. Check if pair doesn't already exist
        require(getPair[token0][token1] == address(0), "Pair already exists");

        // 4. Deploy new pair contract
        // TODO: Check UniswapV2Pair Smart Contract
        bytes memory bytecode = type(UniswapV2Pair).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }

        // 5. Initialize the pair (calling its init function)
        IUniswapV2Pair(pair).initialize(token0, token1);

        // 6. Store pair in mapping
        getPair[token0][token1] = pair;
        getPair[token1][token0] = pair; // The lookup will work for both direction of the pool
        
        // 7. Add to allPairs array
        allPairs.push(pair);
        
        // 8. Emit PairCreated event
        emit PairCreated(token0, token1, pair, allPairs.length);

        // 9. Return pair address
        return pair;
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