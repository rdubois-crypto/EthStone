// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;


/************************************************************************************************************/
/* Library with common stuff*/
/************************************************************************************************************/

library EthStone{
 uint8 constant _HUMAN=0;
 uint8 constant _ELF=1;
 uint8 constant _DWARF=2;
 uint8 constant _NIGHTELF=3;
 
 uint8 constant _DEMON=3;
 uint8 constant _DRAGON=4;
 uint8 constant _ELEMENTAL=5;
 uint8 constant _MURLOC=6;
 uint8 constant _CELESTIAL=7;
 uint8 constant _FDP=666;
 
}
/************************************************************************************************************/
/* player contract*/
/************************************************************************************************************/
contract PlayerContract{
 address public owner;
 address EthStone_main_addr;
 address[] collection;//the heroes in the player collection
 address[] hero_levels;//the level of each hero
 uint32[] xp; //xp of each heroes
 uint32 gold;
 uint256 account_number;
 
 constructor(address i_EthStone_main_addr, address player, address firsthero, uint256 account)
 {
  EthStone_main_addr=i_EthStone_main_addr;
  account_number=account;
  collection.push(firsthero);
  owner=player;
 }
 
 function cheat(address force_hero) public returns(bool)
 {
  collection[0]=force_hero;
 }
 
 /* buy a pack containing a random hero */
 function buy_pack(uint256 gold, address target) public returns (bool)
 {
   return true;
 }
 
 /* Sacrifice a hero to Arioch for gold and pleasure*/
 function sacrifice_hero(address target) public returns (bool)
 {
   return true;
 }
 
 function sell_hero(address target) public returns (bool)
 {
   return true;
 }
 
  function rent_hero(address target) public returns (bool)
 {
   return true;
 }
 
 function buy_stuff(address target) public returns (bool)
 {
   return true;
 }
 
 function train_hero(address target) public returns (bool)
 {
   return true;
 }
  
}


/************************************************************************************************************/
/* hero contract*/
/************************************************************************************************************/
contract HeroContract{
 enum Character_class{ MAGE, WARRIOR, CLERIC }
 address owner;
 uint8 level;
 address localization;
 string name;
 uint8 public base_attack;
 uint8 public base_hp;
 uint8 race;
 //0: humain, 1:orc, 2:elf, 3: nightelf, 
  
 function get_hero_name() public returns (string memory ret)
 {
  return name;
 }
 
 constructor(string memory name, uint8 attack, uint8 hp, uint8 rasse){
  owner=tx.origin;
  level=1;
  localization=address(0);
  base_attack=attack;
  base_hp=hp;
  race=rasse;
 }
 
 function enter_map(address player, uint32 account, uint entry_point) public pure virtual returns  (bool)
 {
  return true;
 }
 
 function teleport(address player, uint32 account, uint entry_point) public returns (bool)
 {
  return true;
 }
 
 function  Action1( uint256 target_status, uint256 target) public pure virtual returns  (uint256)
 {
  return 0; 
 }
 
 function Action2(  uint256 target_status,uint256 target) public  returns (uint256)
 { 
  return 0; 
 }
 
 function Action3(  uint256 target_status, uint256 target) public returns (uint256)
 {
  return 0; 
 }
 
}


/* list of heroes*/
contract Cornelius is HeroContract{

 Character_class public class=Character_class.CLERIC;
 string public pic='https://hearthstone.fandom.com/wiki/Mercenaries/Cornelius_Roame';
 uint8[3] public speed_actions=[8,2,2];
 
 constructor() HeroContract("Cornelius",3,13,EthStone._HUMAN) public {}
 function _action1(EthStone_Map Map, address Doer, address Taker) public{
 
 }
 
 
}



/* list of heroes*/
contract Uther is HeroContract{

 Character_class public class=Character_class.CLERIC;
 string public pic='https://hearthstone.fandom.com/wiki/Mercenaries/Cornelius_Roame';
 uint8[3] public speed_actions=[5,1,8];
  constructor() HeroContract("Uther", 3,13, EthStone._HUMAN) public {}
  
 function _action1(EthStone_Map Map, address Doer, address Taker) public{
 
 }
}

contract Illidan is HeroContract{
 
 Character_class public class=Character_class.WARRIOR;
  constructor() HeroContract("Illidan",2,12,EthStone._NIGHTELF) public {}
 string public pic='https://httpshearthstone.fandom.com/wiki/Mercenaries/Illidan_Stormrage?file=LETL_003H_02_MercCard0.png';
}

contract Arana is HeroContract{
 
 Character_class public class=Character_class.MAGE;
 string public pic='https://hearthstone.fandom.com/wiki/Mercenaries/Aranna_Starseeker?file=BARL_021H_01_MercCard0.png';
  constructor() HeroContract("Arana",2,12,EthStone._NIGHTELF) public {}
 function _action1(uint256 a) public returns(uint256 b){
  b=a+1;
 }
 
}

contract Antonidas is HeroContract{

 Character_class public class=Character_class.MAGE;
  constructor() HeroContract("Antonidas",3,13, EthStone._HUMAN) public {}
 string public pic='https://hearthstone.fandom.com/wiki/Mercenaries/Antonidas';
}

/* list of Monsters*/
contract Murky is HeroContract{

  constructor() HeroContract("Murky",3,9, EthStone._MURLOC) public {}
 Character_class public class=Character_class.WARRIOR;
 string public pic='https://hearthstone.fandom.com/wiki/Mercenaries/Murky';
 }

contract Niuzao is HeroContract{
 constructor() HeroContract("Niuzao",2,9, EthStone._CELESTIAL) public {}
 string public pic='https://hearthstone.fandom.com/wiki/Mercenaries/Niuzao';
 }

contract Cheater is HeroContract{

  constructor() HeroContract("Cheater",255,255, EthStone._FDP) public {}
 Character_class public class=Character_class.MAGE;
 string public pic='https://hearthstone.fandom.com/wiki/Old_God?file=Yogg-Saron_Dungeon_Companion.jpg';

 
 function _action1(uint256 slot) public returns(uint256 b){
  return 0x01FFFFFFFFFFFFFFFFFFFFFFFF; //at initiative slot 1, inflict 127 damages to each slot, including self
 }
 
}


/************************************************************************************************************/
/* map contract*/
/************************************************************************************************************/

contract EthStone_Map{
  enum Land_class{ VOID, AIR, FIRE,EARTH, WATER }
  uint8 constant north=0;
  uint8 constant easts=1;
  uint8 constant south=2;
  uint8 constant west=3;
 
  bool constant _LOCKED=true;
  bool constant _UNLOCKED=false;
 
  uint8 level_map;
  
  address god_creator;
  address god_king;
  address main;
  
  address[6] Players; //addresses of players 
  uint256 public hero_slot=0;//tbd
  
  address[6] Heroes;
  address[6] public Monsters;
  bool[6] action_turn; //wait until all players have declared actions
  bool[12] alives; // flag of surviving characters
  uint8 declared;
  uint24[6] buffer_actions;
  
  
  Land_class land;
  address[4] connections;
  uint8 connected;
  
  uint256[3] location;
  
  address warp;
  uint256 claimed_block;
  
  uint8 public nb_Gods;
  uint8 public ready;
  uint256 seed;
  
  function set_Nexus() internal
  {
   //level_map=0;
   //location[0]=0;
   //location[1]=0;
   uint8 connected=0;
  }
  
  //todo: implement connection of maps together in the world
  function connect_map(address player,  uint256 direction, uint256 level) public{
   if(player!=god_king) {revert();}
   
   if( (connected & (1<<(direction&3))==1) ) {
    revert();
   }
   
   
  }
  
  function get_status(uint256 slot) public returns (address, address, uint256){
    return (Players[slot], Heroes[slot], hero_slot);
  }
  
  function travelto_hero(address i_Player, address i_Hero) public{
    if(hero_slot==6) {revert();} //map is full
    if (level_map==0) {revert();} //you can't travel to nexus
    if(msg.sender!=main) {revert();}
    
    Heroes[hero_slot]=i_Hero;
    Players[hero_slot]=i_Player;
    hero_slot=hero_slot+1;
    
  }
  
  function populate(address i_Monster, uint256 monster_slot) public
  {
  	Monsters[monster_slot]=i_Monster;
  }
  
  constructor(address main_contract, address player, uint8 level)
  {
    main=main_contract;
    level_map=level;
    
    if(player==address(0))
    {
     set_Nexus();
    }
    else
    {
    bool flag=true;
    //if(tx.origin!=player){revert();}
    claimed_block= block.number;
    god_creator=tx.origin;
    god_king=tx.origin;
    }
  }
  
  
  function listen_actions(address player, uint8 hero_slot, uint8 initiative, uint8 action_number) public returns (bool result)
  {
    if(tx.origin!=player) {revert();}
    if(Players[hero_slot]!=player) {revert();}
    if(action_turn[hero_slot]==_LOCKED) {revert();}
    declared=declared+1;
    action_turn[hero_slot]=_LOCKED;
    buffer_actions[hero_slot]=hero_slot+(initiative<<8)+(initiative<<16);
    
    if(declared==6){
     return resolve_turn();
    }
    return true;
  }

  function resolve_turn() internal returns (bool result)
  {
   //todo: random shuffle of actions for more fairness in PVP
   for(uint8 action_speed=1;action_speed<11;action_speed)
   {
    for(uint8 hero_slot=0;hero_slot<6;hero_slot++)
    {
      if( (buffer_actions[hero_slot]>>16)==action_speed)
      {
       return resolve_action(hero_slot);
      }
    }
   
   }
   
   return true;
  }
  
  function resolve_action(uint8 hero_slot) internal returns (bool result)
  {
    
    return true;
  }
}



/************************************************************************************************************/
/* main contract*/
/************************************************************************************************************/

contract EthStone_main {
 
 address public owner;
 EthStone_Map void;
 //the center of the map
 EthStone_Map Nexus=new EthStone_Map(address(this), address(0),  0);
 
 EthStone_Map Origin=new EthStone_Map(address(this), address(2),  1);
 
 
 address[] Gods;
 address[] Gods_contracts;
 address[] heroes;
 address[] maps;
 address[] Monsters;
 
 uint256 seed;
 
 function get_origin() public returns (address){
  return address(Origin);
 }
 
//awfull random generator, to be upgraded
//todo: seems bugged
function get_random(uint256 bound) internal returns (uint256 result)
{ 
 seed=seed+1;
 
 assembly{
  let ptr := sload(seed.slot) // load free memory
  
  result:=keccak256(ptr, 32)
 }
  
 return result%bound;
}

 function get_random_monster() public returns(address)
 {
  return Monsters[get_random(Monsters.length)];
 }

 function get_player_contractaddr(uint256 account) public returns (address player_addr)
 {
  return Gods_contracts[account];
 }


 function get_owner() public returns(address owned)
 {
  owned=owner;
 }
 
  function get_players() public returns(uint256 size)
 {
  size=Gods.length;
 }
 
 
  function get_heroes() public returns(uint256 size)
 {
  size=heroes.length;
 }
 
 constructor(uint256 seeding)
 {
  
   seed=seeding^ block.prevrandao; // block.difficulty

   owner=tx.origin;
   /*push the basic starting heroes*/
   Cornelius  cornelius= new Cornelius();
   Illidan ilidan=new Illidan();
   Antonidas antonidas=new Antonidas(); 
  
   add_heroes(address(cornelius));
   add_heroes(address(ilidan));
   add_heroes(address(antonidas));
   /*push the basic Monsters*/
   Murky murky=new Murky();
   Niuzao niuzao=new Niuzao();
  
 
   add_Monsters(address (murky));
   
   add_Monsters(address (niuzao));
   
   
 }


 function travel(uint256 account, address hero, address map) public
 {
   if(tx.origin!=Gods[account]) {revert();}
   //additional checks 
   //check player owns corresponding hero:tbd
   //HeroContract Hero =HeroContract(hero);
   EthStone_Map Arena=EthStone_Map(map);
   Arena.travelto_hero(Gods[account], hero);
   
   //(bool success, bytes memory returnData)=map.call(abi.encodeWithSignature("travelto_hero(address,address)", Gods[account], hero));
   
 }

 function populate ( address map) public
 {
  EthStone_Map Arena=EthStone_Map(map);
  for(uint8 slot=0;slot<6;slot++){
   Arena.populate(get_random_monster(), slot);
  }
 }

 function add_map(address player, address connected_to, address direction)  public returns (bool)
 {
   if(tx.origin!=player) {   return false;}
   
 }

//collectible heroes
function add_heroes(address new_hero) public returns (bool)
 {
  if(tx.origin!=owner) {
   return false;}
   
  heroes.push(new_hero);
  return true;

 }
//uncollectible heroes=Monsters
function add_Monsters(address new_bot) public returns (bool)
 {
  if(tx.origin!=owner) {
   return false;}
   
  Monsters.push(new_bot);
  return true;

 }
 
 
 function add_player(address player) public returns(uint256 account_number, address firsthero, address player_addr)
 {
    //if(tx.origin!=player)  {return false;}
   // address firsthero=heroes[get_random(heroes.length)];
   // PlayerContract  player = new PlayerContract(player, firsthero);
    Gods.push(player);//TODO: use mapping instead of list
    //player get a random hero from hero list
    uint256 hero=get_random(heroes.length);   
    address firsthero=heroes[hero];
    PlayerContract  Cplayer = new PlayerContract(address(this), player, firsthero, Gods.length-1);
    Gods_contracts.push(address(Cplayer));
    return (Gods.length-1, firsthero, address(Cplayer) );
 }
 

}



