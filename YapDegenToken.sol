// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";

contract YapDegenToken is ERC20, Ownable {
    struct Costume {
        string name;
        uint256 cost;
    }

    Costume[] public costumes;
    mapping(address => mapping(uint256 => uint256)) public playerCostumes;

    event TokensRedeemed(address indexed player, uint256 amount, string costume);
    event CostumeAdded(uint256 indexed costumeId, string name, uint256 cost);
    event CostumePurchased(address indexed player, uint256 indexed costumeId, uint256 amount);

    constructor() ERC20("Degen", "DGN") {
        // Adding sample costumes during contract deployment
        addCostume("Knight Armor", 100);
        addCostume("Wizard Robe", 150);
        addCostume("Pirate Outfit", 120);
        addCostume("Ninja Suit", 200);
        addCostume("Elf Tunic", 80);
    }

    // Minting new tokens, only the owner can call this function
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Add a new costume to the store
    function addCostume(string memory name, uint256 cost) public onlyOwner {
        costumes.push(Costume(name, cost));
        emit CostumeAdded(costumes.length - 1, name, cost);
    }

    // Redeeming tokens for a costume
    function redeemTokensForCostume(uint256 costumeId) external {
        require(costumeId < costumes.length, "Costume does not exist");
        Costume memory costume = costumes[costumeId];
        require(balanceOf(msg.sender) >= costume.cost, "Insufficient balance to redeem tokens");

        _burn(msg.sender, costume.cost);
        playerCostumes[msg.sender][costumeId] += 1;
        emit CostumePurchased(msg.sender, costumeId, costume.cost);
    }

    // Check the quantity of a specific costume a player owns
    function getCostumeQuantity(address account, uint256 costumeId) external view returns (uint256) {
        require(costumeId < costumes.length, "Costume does not exist");
        if (playerCostumes[account][costumeId] > 0) {
            return playerCostumes[account][costumeId];
        } else {
            return 0; // Player does not own this costume
        }
    }

    // Burning tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Wrapper function for transferring tokens
    function transferTokens(address recipient, uint256 amount) external {
        transfer(recipient, amount);
    }

    // Wrapper function for checking token balance (optional, for demonstration)
    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}
