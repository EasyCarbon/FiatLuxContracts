// SPDX-License-Identifier: MIT

// ownerMintsAll.sol
// Written by: @ruzventure
// https://easycarbon.io

pragma solidity >=0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract owner is Ownable, ERC721A {
    string public baseURI = "";

    constructor() ERC721A("FiatLux", "FLUX") {}

    function setBaseURI(string memory _baseURI) public onlyOwner {
        baseURI = _baseURI;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override
        returns (string memory)
    {
        require(_exists(_tokenId), "Token not found");

        if (bytes(baseURI).length > 0) {
            return
                string(
                    abi.encodePacked(
                        baseURI,
                        Strings.toString(_tokenId),
                        ".json"
                    )
                );
        }

        return "ipfs://Qmd4EfaxogjCiXHZcQozVYu1eFk198H8jXvXaf7ip2Z5Nc";
    }

    function mintAll() public onlyOwner {
        _safeMint(msg.sender, 1000);
    }
}