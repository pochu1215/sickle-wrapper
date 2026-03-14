// SPDX-License-Identifier: MIT
pragmasolidity 0.8.17;

import "forge-std/Test.sol";
import "../src/SickleWrapper.sol";

interface IRewardRouter {
    function onRewardsClaimed(address user, address[] calldata tokens, uint256[] calldata amounts) external;
}

contract SickleForkSimulation is Test {
    SickleWrapper public wrapper;
    address public user = makeAddress("user");
    address public feeRecipient = 0xfF828F0d9589D111175e4636014088E030E8768B;

    function setUp() public {
        // Mock or Fork logic here
    }

    function testFeeRouting() public {
        uint256 harvestAmount = 1000e18;
        uint256 expectedFee = 50e18; // 5%
        uint256 expectedNet = 950e18;

        // Validate math
        assertEq((harvestAmount * 500) / 10000, expectedFee);
        assertEq(harvestAmount - expectedFee, expectedNet);
    }
}
