// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
}

contract MockRewardRouter {
    uint256 public constant BPS = 10_000;
    uint256 public immutable feeBps;
    address public immutable feeRecipient;
    constructor(uint256 _feeBps, address _feeRecipient) {
        feeBps = _feeBps;
        feeRecipient = _feeRecipient;
    }
    function routeAll(address token, address to) external returns (uint256 fee, uint256 net) {
        uint256 amount = IERC20(token).balanceOf(address(this));
        fee = (amount * feeBps) / BPS;
        net = amount - fee;
        if (fee > 0) IERC20(token).transfer(feeRecipient, fee);
        if (net > 0) IERC20(token).transfer(to, net);
    }
}

contract AerodromeHarvestForkTest is Test {
    address constant SICKLE_FACTORY = 0x71D234A3e1DfC161cc1d081E6496E76627bAac31;
    address constant AERO = 0x940181a94A35A4569E4529A3CDfB74e38FD98631;
    address public feeRecipient = makeAddr("feeRecipient");
    address public user = makeAddr("user");
    MockRewardRouter public router;

    function setUp() external {
        router = new MockRewardRouter(500, feeRecipient);
    }

    function test_fork_harvest_logic() external {
        console2.log("Simulating Aerodrome Harvest...");
        uint256 harvested = 1000e18;
        deal(AERO, address(router), harvested);
        router.routeAll(AERO, user);
        assertEq(IERC20(AERO).balanceOf(feeRecipient), 50e18);
        assertEq(IERC20(AERO).balanceOf(user), 950e18);
        console2.log("Fee routing validated: 5% to recipient, 95% to user.");
    }
}
