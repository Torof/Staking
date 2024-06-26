// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import "./SToken.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Staking {
    using SafeERC20 for IERC20;

    IERC20 public STK;

    uint256 public totalStaked;

    uint256 public accumulatedTokenReward;

    uint256 public rewardPerTokenStored;

    uint256 public lastUpdateTime;

    uint256 public rewardRate;

    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;
    mapping(address => uint256) public stakedBalance;

    function stake(uint256 amount) public {
        // transfer STK tokens from sender to this contract
        STK.safeTransferFrom(msg.sender, address(this), amount);
        // code here
    }

    function unstake(uint256 amount) public {
        // transfer STK tokens from this contract to sender
        STK.safeTransferFrom(address(this), msg.sender, amount);
        // code here
    }

    function earned(address _user) public view returns (uint256 earnedAmount) {
        earnedAmount = stakedBalance[_user] * (rewardPerTokenStored - userRewardPerTokenPaid[_user]) / 1e18 + rewards[_user];   
    }

    function rewardPerToken() public view returns (uint256) {
        if (totalStaked == 0) {
            return rewardPerTokenStored;
        }
        return rewardPerTokenStored + (block.timestamp - lastUpdateTime) * rewardRate * 1e18 / totalStaked;
    }

    function updateReward(address _account) public {
        // update reward for sender
        // code here
    }

    function notifyRewardAmount(uint256 reward) public {
        // notify the contract about the reward to be distributed and update the reward parameters
        // code here
    }

    function claimReward() public {
        // transfer reward from this contract to sender
        STK.safeTransferFrom(address(this), msg.sender, accumulatedTokenReward);
        // code here
    }
}
