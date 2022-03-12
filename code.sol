// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract RomeVerseGameTokens is ERC1155
{
    address private owner ;

    // There are totally 10 tokens in the game since it consist of 5 erc20 tokens and 5 nfts its better to 
    // implement the contract using ERC1155 contract which saves a lot of gas fee and we can implement 
    // both erc20 tokens and erc 721 tokens in one contract only or one go

    uint256 public constant Pant = 0 ; // token id for all 10 tokens 
    uint256 public constant Helmet = 1;
    uint256 public constant Sword = 2;
    uint256 public constant FarmTool = 3;
    uint256 public constant Axe = 4;
    uint256 public constant Wool = 5;
    uint256 public constant Iron = 6;
    uint256 public constant Leather = 7;
    uint256 public constant Wheat = 8;
    uint256 public constant Grain = 9;

   string _baseTokenURI ; 


    // BASEURI should be in the form of -> ipfs://METADATA-CID/{id}.json  (important point)

   constructor(string memory baseURI) ERC1155(baseURI)
   { 
      owner = msg.sender;
      _baseTokenURI = baseURI;
   }

  // Minting any type of ERC20 Token 
   function MintERC20Tokens(uint256 tokenId , uint256 amount) public
   {
     require(amount>=5 , "You can mint any ERC20 Token above 5");
     _mint(msg.sender , tokenId, amount , "");
   }

  // For minting PantNFT 
   function MintPantNFT() public
   { 
     _burn(msg.sender,Wool,1); // we will burn 1 Wool which we have 
     _burn(msg.sender,Leather,2); // we will burn 2 Leathers which we have 
   } 

  // For minting HelmetNFT
   function MintHelmetNFT() public
   {
     _burn(msg.sender,Iron,1); // we will burn 1 Iron which we have 
     _burn(msg.sender,Leather,2); // we will burn 2 Leathers which we have 
   }

  // For minting SwordNFT
   function MintSwordNFT() public
   {
     _burn(msg.sender,Iron,3); // we will burn 3 Irons which we have
   }

  // For minting FarmToolNFT
   function MintFarmToolNFT() public
   {
     _burn(msg.sender,Iron,1); // we will burn 1 Iron which we have
     _burn(msg.sender,Leather,1); // we will burn 1 Leather which we have 
     _burn(msg.sender,Wool,1);  // we will burn 1 Wool which we have
   }

 // For minting MintAxeToolNFT
   function MintAxeToolNFT() public
   { 
      _burn(msg.sender,Iron,1); // we will burn 1 Iron which we have
     _burn(msg.sender,Leather,1); // we will burn 1 Leather which we have 
     _burn(msg.sender,Wool,1);  // we will burn 1 Wool which we have
   }


  // TokenURI of a particular Token 

         function uri(uint256 tokenId) public view virtual override returns (string memory) {
           return string (
               
               abi.encodePacked(
                 _baseTokenURI,Strings.toString(tokenId),".json"
             )
           );
        }       



}
