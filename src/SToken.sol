// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Stoken is ERC20{


constructor() ERC20("Stoken", "STK") {
    _mint(msg.sender, 100_000_000 * 10 ** 18);
}

}