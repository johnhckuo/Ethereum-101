pragma solidity ^0.4.2;
contract Stakeholder{

  address public serviceProvider;
  event register(uint, address);

  struct info{
    bool active;
    string name;
    uint256 balance;
  }

  struct activities{
    address stakeholder1;
    address stakeholder2;

    // For the convenience of tutorial, we'll just enter the name of the smart property instead of its address
    //address smartProperty1;
    //address smartProperty2;
    string smartProperty1;
    string smartProperty2;
  }

  struct properties{
    uint id;
    address owner;
    string name;
  }

  mapping(address => info) public StakeholderInfo;
  mapping(uint => activities) public ValueActivity;


  function Stakeholder(){
    serviceProvider = msg.sender;
  }

  function registerStakeholder(string _name, uint256 _balance){
    StakeholderInfo[msg.sender]= info({
        active:true,
        name:_name,
        balance:_balance
    });

    //now is a built-in function for acquiring current timestamp
    register(now, msg.sender);
  }

  function registerValueActivity(uint id, address SH1, address SH2, string SP1, string SP2){
    ValueActivity[id] = activities({
        stakeholder1:SH1,
        stakeholder2:SH2,
        smartProperty1:SP1,
        smartProperty2:SP2
    });
  }

  function update(bool _active, string _name, uint256 _balance){
    StakeholderInfo[msg.sender].active = _active;
    StakeholderInfo[msg.sender].name = _name;
    StakeholderInfo[msg.sender].balance = _balance;

  }
}
contract Customer is Stakeholder{

  address interactADDR;
  struct interactParties{
      //address smartProperties;
      bool interactable;
      string SmartProperties;
  }
  mapping (address=> interactParties) Interacters;
  address public serviceProvider;

  function customer(){
      serviceProvider = msg.sender;
  }


  modifier InteracterOnly(address target){
      if (!Interacters[target].interactable || serviceProvider != msg.sender){
          throw;
      } else{
          _;
      }
  }

  function valueActivity(address target) InteracterOnly(target){
      //target.send(10);

  }

}
