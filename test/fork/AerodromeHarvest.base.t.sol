// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/StdCheats.sol";

import "../../src/RewardRouter.sol";
import "../../src/SickleWrapper.sol";

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract AerodromeHarvestBaseTest is Test, StdCheats {
    address constant SICKLE_FACTORY = 0x71D234A3e1dfC161cc1d081E6496e76627baAc31;
    address constant FARM_STRATEGY = 0x5A72C0f4Bf7f3Ddf1370780d405e29149b128A04;
    address constant NFT_FARM_STRATEGY = 0xb156de7b6065657827860181ceab0550959ab3d;
    address constant AERO = 0x940181a94A35A4569E4529A3CDFB74e38FD98631;
    uint256 constant FEE_BPS = 500;
    uint256 constant BPS_DENOMINATOR = 10_000;
    address constant FEE_RECIPIENT = 0xfF828F0d9589D111175e4636014088E030E8768B;

    RewardRouter public rewardRouter;
    SickleWrapper public sickleWrapper;
    address public user;

    function setUp() public {
        vm.createSelectFork(vm.envString("BASE_RPC_URL"));
        user = makeAddr("user");
        rewardRouter = new RewardRouter(address(this), FEE_BPS, FEE_RECIPIENT);
        sickleWrapper = new SickleWrapper(user, IFarmStrategy(FARM_STRATEGY), INftFarmStrategy(NFT_FARM_STRATEGY), ISickleFactory(SICKLE_FACTORY), IRewardRouter(address(rewardRouter)));
    }

    function testAerodromeHarvestFeeRouting() public {
        uint256 rewardAmount = 1_000e18;
        deal(AERO, address(sickleWrapper), rewardAmount);
        address[] memory tokens = new address[](1);
        tokens[0] = AERO;
        uint256[] memory amounts = new uint256[](1);
        amounts[0] = rewardAmount;
        vm.prank(address(sickleWrapper));
        rewardRouter.onRewardsClaimed(user, tokens, amounts);
        assertEq(IERC20(AERO).balanceOf(user), (rewardAmount * 9500) / 10000);
        assertEq(IERC20(AERO).balanceOf(FEE_RECIPIENT), (rewardAmount * 500) / 10000);
    }
}