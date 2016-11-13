pragma solidity ^0.4.2;
contract Stakeholder{

	address public serviceProvider;

	function Stakeholder(){
		serviceProvider = msg.sender;
	}

  function registerStakeholder(){

  }

  function registerValueActivity(){

  }

  function update(){

  }


  // Restrict the accessors of functions which apply this modifier
	modifier onlyOwner{
		if (msg.sender != serviceProvider){
			throw;   //throw in Solidity will consume all the gas message sender provide
		}else{
			_;
		}
	}

  //apply the onlyOwner modifier to this function to prevent malicious operations
	function kill() onlyOwner{
		suicide(serviceProvider);
	}
}

contract Customer is Stakeholder{

	string public userName;

	function Customer(string _name){
		userName = _name;
	}

  //Define the value activity only provided by customers
  function valueActivity(){

  }

}
