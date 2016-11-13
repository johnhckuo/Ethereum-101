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

### Trivial Concepts
There are some concepts might bother you while getting into solidity programming in the first time. Here are some tips.
#### 1. promise
In order to deal with some async function, we need to set promise for the convenience of operation serialization.
#### 2. callback function
Briefly speaking, it is just a function waiting to be executed if the other function complete query.
#### 3. gas
Gas acts as a input resource to make car move, and so is the meaning of gas stands for Ethereum : to get things work.
#### 4. Invalid JUMP error
When compiling your smart contract, you might encounter this error for some reasons. They can be either the existence of run-time errors in your code or a `throw` occured.
#### 5. Throw
What is worth notice here is that once a contract throw an exception, it will consume all the gas. (part of the reasons is that Ethereum want to prevent malicious attack)
