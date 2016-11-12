# Getting familiar with the Solidity syntax
Some basic introductions for rookies！

### Explanation

Let's have a look at how a solidity smart contract looks like:

```javascript
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

```

It seems complex, but actually it is simplyly comprised by three parts: variables, constructor, and functions
> + Variables contains the resources for further operation
> + Contructor is a special function that will be initialized in the beginning or this contract will fail to deploy
> + Functions act as means to alter the value of variables and implement our logic to fulfill certain task 

Note: In the update of Solidity 0.4.0, each contract will need to specify `pragma solidity ^0.4.2; ` in the first line of .sol file
