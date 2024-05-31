# YapDegenToken README

## Overview
YapDegenToken is a Solidity smart contract that implements an ERC20 token with additional functionalities for managing costumes and redeeming tokens for these costumes. This README provides an overview of the contract's features and usage.

## Features
- ERC20 token functionality: Supports standard ERC20 token operations such as transferring tokens, checking balances, and burning tokens.
- Costume Management: Allows the owner of the contract to add new costumes to the store.
- Token Redemption: Users can redeem their tokens for costumes from the store.
- Costume Ownership: Tracks the quantity of each costume owned by a player.

## Contract Structure
The contract is structured as follows:
- `YapDegenToken`: Main contract inheriting from ERC20 and Ownable.
- `Costume`: Struct to represent a costume.
- `costumes`: Array to store all available costumes.
- `playerCostumes`: Mapping to track the quantity of each costume owned by a player.

## Usage
### Deployment
- Deploy the contract to a supported Ethereum network.
- Upon deployment, sample costumes such as "Knight Armor", "Wizard Robe", etc., are added to the store.

### Minting Tokens
- Only the owner can mint new tokens using the `mint` function.

### Adding Costumes
- The owner can add new costumes using the `addCostume` function.

### Redeeming Tokens for Costumes
- Users can redeem their tokens for costumes using the `redeemTokensForCostume` function.

### Checking Costume Quantity
- Users can check the quantity of a specific costume they own using the `getCostumeQuantity` function.

### Burning Tokens
- Tokens can be burned using the `burn` function.

### Transferring Tokens
- Tokens can be transferred to another address using the `transferTokens` function.

### Checking Token Balance
- Token balance of an address can be checked using the `checkBalance` function.

## Security Considerations
- Ensure proper access control to sensitive functions.
- Review and test thoroughly before deploying to a production environment.

## License
This project is licensed under the MIT License.

