// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

const creatorMintConract is ERC721, Ownable {
    uint256 public mintprice = 0.5 ether;
    uint256 public totalSupply;
    uint256 public maxSupply;
    bool public isMintEnabled
    mapping(address => uint256) public mintedWallets


    constructor () payble ERC721("Simple Mint", SIMPLEMINT) {
        maxSupply = 2
    }

}