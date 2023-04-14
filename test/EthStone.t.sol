// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/EthStone.sol";


contract Forkmain_EthStone is Test{
   uint256 mainnetFork;
   string MAINNET_RPC_URL ='https://eth-goerli.g.alchemy.com/v2/rbl1LoFLWcUEdt9sdk_30vpIVYeMVRoj';
   
   address debugg;
   uint256 sizeh;
    
   EthStone_main public forkstone=  new EthStone_main(12);
         
   
   function setUp() public {
        mainnetFork = vm.createFork(MAINNET_RPC_URL);
       
        debugg=forkstone.get_owner();
        sizeh= forkstone.get_players();
        console.log("----------set up complete:", sizeh);
  	 Arana arana=new Arana(); 
  	 Uther uther=new Uther(); 
        forkstone.add_heroes(address(arana));
        
        (bool success, bytes memory returnData)=address(arana).call(abi.encodeWithSignature("_action1(uint256)", 0x61));
        
        console.log("temp=",success, string(returnData));
    }



  function sub_createplayer() public
 {
  uint256 private1=0x123456;
  address[30] memory joueurs;
  
  for(uint256 i=0;i<joueurs.length;i++)
  {
   address player=vm.addr(private1+i);
   vm.startPrank(player, player)  ;
   uint256 ret;
   address ret2;
   address ret3;

   (ret, ret2, ret3)=forkstone.add_player(player);
   console.log("\n --create player n",i);
   console.log(" EOA: ", player);
   console.log(" account and card", ret, ret2);
   console.log(" player contract address", ret3);

   vm.stopPrank();
   console.log(" player contract address check:",forkstone.get_player_contractaddr(i));
   
   
  }
  
  
 }
 
 function test_battle() public
 {
   uint256 private1=0x123456;
  address[6] memory joueurs;
   uint256 ret;
   address ret2;
   address ret3;
   
  EthStone_Map map=EthStone_Map(forkstone.get_origin());  
   
  for(uint256 i=0;i<joueurs.length;i++)
  {
   address player=vm.addr(private1+i);
   vm.startPrank(player, player)  ;
  

   (ret, ret2, ret3)=forkstone.add_player(player);
   console.log("\n --create player n",i+1);
   console.log(" EOA: ", player);
   console.log(" account and card", ret, ret2);
   console.log(" player contract address", ret3);
   forkstone.travel(ret, ret2, forkstone.get_origin());
  
   vm.stopPrank();
   
   (ret2, ret3, ret)=map.get_status(i);
   console.log(" map content:", ret2, ret3, ret);
   
   
  }
   forkstone.populate(address(map));
   
   ret=map.hero_slot();
   for(uint8 i=0;i<6;i++){
   ret2=map.Monsters(i);
   console.log(" ret2:", ret2);
   
   }
   
   
   
 }
 
 function sub_map() public
 {
  sub_createplayer();
  sizeh= forkstone.get_players();
  console.log("----------number of players:", sizeh);
 }


}











