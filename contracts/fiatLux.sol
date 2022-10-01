// SPDX-License-Identifier: MIT

// fiatLux.sol
// Written by: @ruzventure
// https://easycarbon.io

pragma solidity >=0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract fiatLux is Ownable, ReentrancyGuard, ERC721A{
    uint256 public MAX_NFT_QUANTITY = 1000; // COLLECTION SIZE
    uint256 public NFT_PRICE = 0; // PER NFT COST: 0 AVAX (FOR DEMO PURPOSES)
    bool public IS_PAUSED = false;
    string public BASE_URI;

    constructor() ERC721A("Fire Recovery NFT", "FIRE") {}

    modifier callerIsUser() {
        require(
            tx.origin == msg.sender,
            "The caller is from different contract"
        );
        _;
    }

    function setNFTPrice(uint256 _nftPrice) public onlyOwner {
        NFT_PRICE = _nftPrice;
    }

    function withdraw() public onlyOwner nonReentrant {
        uint256 _balance = address(this).balance;

        require(_balance > 0, "No enough balance yet");

        (bool succ, ) = payable(msg.sender).call{value: _balance }("");
        require(succ, "Founder transfer failed");

    }

    function togglePaused() public onlyOwner {
        IS_PAUSED = !IS_PAUSED;
    }

    function setBaseURI(string memory _baseURI) public onlyOwner {
        BASE_URI = _baseURI;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override
        returns (string memory)
    {
        require(_exists(_tokenId), "Token not found");
        return "ipfs://Qmd4EfaxogjCiXHZcQozVYu1eFk198H8jXvXaf7ip2Z5Nc";
    }

    function tokensOfOwner(
        address addr,
        uint8 startId,
        uint8 endId
    ) external view returns (uint8[] memory) {
        uint256 tokenCount = balanceOf(addr);
        if (tokenCount == 0) {
            return new uint8[](0);
        } else {
            uint8[] memory result = new uint8[](tokenCount);
            uint8 index = 0;
            for (uint8 tokenId = startId; tokenId < endId; tokenId++) {
                if (index == tokenCount) break;

                if (ownerOf(tokenId) == addr) {
                    result[index] = tokenId;
                    index++;
                }
            }
            return result;
        }
    }

    function mintNFT(uint8 numberOfTokens) public payable callerIsUser {
        require(IS_PAUSED == false, "Contract has been paused");
        uint256 supply = totalSupply();
        require(
            supply + numberOfTokens <= MAX_NFT_QUANTITY,
            "Will exceed the total nft limit"
        );
        require(msg.value >= numberOfTokens * NFT_PRICE, "Insufficient fee");
        _safeMint(msg.sender, numberOfTokens);
    }
}