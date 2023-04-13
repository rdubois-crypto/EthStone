![ethstone2](https://user-images.githubusercontent.com/103030189/231741393-48dc0700-47c5-4b6b-840a-2eceb3ce2271.jpg)
# EthStone
A decentralized Rogue-like game PoC.

This project aims to implement a rogue-like game where a player owns heroes and fight for the control of maps with other players.
It is designed as an exercise for the Ledger's solidity guild. 

## Design Philosophy
As a decentralized game, the finality is to implement a game where:
- sovereignty :players own their asset heroes and conquered lands (maps)
- upgradability : 
- dev community : developpers are encouraged to contribute to the project by being rewarded by the contract when submitting:
  - new heroes and maps (solidity devs)
  - on top front environment
- decentralization : main contract shall be fully decentralized at some point, replacing the current admin by a voting system (destroying ownership when implemented)
- security : cheat shall be prevented by design



## Components

### EthStone_main.sol
This contract ensures the consistency of the whole game by enforcing the legality of heroes and map ownership and moves. 

### EthStone_map.sol
A EthStone_map contract is deployed for each tile of the map. It represents a land, owned by one of the player, protected by bots from the conquest of another team of players. 

### EthStone_player.sol
A EthStone_player contract is deployed for each player. It contains the list of assets (xp, gold, heroes) owned by the player and their current status.


### EthStone_heroes.sol
A EthStone_hero contract is deployed when a developper submit a new hero with its own rules.

### EthStone_reward.sol
Implementation of the reward system.

## Rules
(desbribe rules here)

## Economy 
(desbribe incentives here)

