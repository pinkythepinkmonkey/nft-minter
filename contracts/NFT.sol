// Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SandDollarNFT is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() public ERC721("SDPOLYX", "SDPOLYX") {
        _setBaseURI("ipfs://QmVvUotFSTypmoEvGN7duQepwy49Cg56674rTFWVzQg1dM/");
    }

    function mint() private onlyOwner {
        _safeMint(msg.sender, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }

    function mintBatch(uint256 numTokens) public onlyOwner {
        for (uint256 i = 0; i < numTokens; i++) {
            mint();
        }
    }

    function isApprovedForAll(address _owner, address _operator)
        public
        view
        override
        returns (bool isOperator)
    {
        // if OpenSea's ERC721 Proxy Address is detected, auto-return true
        if (_operator == address(0x58807baD0B376efc12F5AD86aAc70E78ed67deaE)) {
            return true;
        }

        // otherwise, use the default ERC721.isApprovedForAll()
        return ERC721.isApprovedForAll(_owner, _operator);
    }
}
