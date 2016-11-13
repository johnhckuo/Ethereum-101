pragma solidity ^0.4.2;
contract Stakeholder{

  // Solidity will generate a function for returning the value of public varialbes
	address public serviceProvider;

  //constructor
	function Stakeholder(){
    //msg is a built-in variables in Solidity, and msg.sender can return the address of the one who is calling this contract
		serviceProvider = msg.sender;
	}

  //The following define the behaviors all stakeholders might need
  function registerStakeholder(){

  }

  function registerValueActivity(){

  }

  function update(){

  }

  //kill function can return the remaining Ether stored on this contract to the serviceProvider
	function kill(){
		suicide(serviceProvider);
	}
}
