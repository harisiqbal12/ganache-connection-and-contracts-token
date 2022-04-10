// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract Color is ERC721, Ownable {
    uint public mintPrice = 0.05 ether;
    uint public totalSupply;
    uint public maxSupply;
    bool public isMintEnable;
    mapping(address => uint) public mintedWallet;


    constructor () payable ERC721('Color', 'CLR') {
        maxSupply = 3;
    }

    function toggleIsMintEnable() external onlyOwner {
        isMintEnable = !isMintEnable;
    }

    function setMaxSupplt(uint _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }

    function mint() external payable {
        require(isMintEnable, 'Minting not enable');
        require(mintedWallet[msg.sender] < 1, 'exceeds max per wallets');
        require(msg.value == mintPrice, 'Wrong Value');
        require(maxSupply > totalSupply, 'sold out');

        mintedWallet[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }

}