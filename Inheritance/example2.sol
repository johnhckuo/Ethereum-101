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

	function kill() {
		suicide(serviceProvider);
	}
}

// the contract which inheritance stakeholder, which means that customers can access the function and global variables stakeholder owns
contract Customer is Stakeholder{

	string public userName;

	function Customer(string _name){
		userName = _name;
	}

  //Define the value activity only provided by customers
  function valueActivity(){

  }

}
