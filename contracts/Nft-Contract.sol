// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Nft-Contract is ERC721, Ownable {
    uint256 public mintprice = 0.05 ether;
    uint256 public totalSupply;
    uint256 public maxSupply;
    bool public isMintEnabled;
    mapping(address => uint256) public mintedWallets;


  constructor() payable ERC721("_Creator", "CRT") Ownable(msg.sender) {
        maxSupply = 10;
    }


    function toggleIsMIntEnabled()  external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }

    function mint() external payable {
        require (isMintEnabled, "minting is not enabled for now");
        require(mintedWallets[msg.sender] < 1, "max mint per wallet number exceeded");
        require(msg.value == mintprice, "wrong mint value");
        require(maxSupply > totalSupply, "sold out Already");

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }



}