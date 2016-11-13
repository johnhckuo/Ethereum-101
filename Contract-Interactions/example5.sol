pragma solidity ^0.4.2;
contract Stakeholder{

  address public serviceProvider;

  struct info{
    bool active;
    string name;
    uint256 id;
    uint256 time;
  }
  struct activities{
    address stakeholder1;
    address stakeholder2;
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

  function registerStakeholder(string _name, uint256 _id){
    StakeholderInfo[msg.sender]= info({
        active:true,
        name:_name,
        id:_id,
        time:now
    });
  }

  function registerValueActivity(uint id, address SH1, address SH2, string SP1, string SP2){
    ValueActivity[id] = activities({
        stakeholder1:SH1,
        stakeholder2:SH2,
        smartProperty1:SP1,
        smartProperty2:SP2
    });
  }

  function returnActive(address ADDR) returns (bool){
    return StakeholderInfo[ADDR].active;
  }

  modifier ownerOnly{
      if (msg.sender != serviceProvider){
          throw;
      }else{
          _;
      }
  }

  function update(address ADDR, bool _active, string _name, uint256 _id) ownerOnly{
    StakeholderInfo[ADDR].active = _active;
    StakeholderInfo[ADDR].name = _name;
    StakeholderInfo[ADDR].id = _id;
    StakeholderInfo[ADDR].time = now;
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

  function customer(){

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

  function getInteracter(address ADDR) returns (string){
      return Interacters[ADDR].SmartProperties;
  }

}

// This contract defines both what the service provider do and which module we provide
contract ServiceProvider{
  address public serviceProvider;

  mapping(address => mapping(string => uint)) ResourceImportance;

  function ServiceProvider(){
    serviceProvider = msg.sender;
  }

  //fill out the address of Stakeholder contract
  address constant shADDR = 0x0;
  Stakeholder sh = Stakeholder(shADDR);

  //empowerment module 1
  function queryEmpowermentData(address shADDR, string rADDR, uint importance){
    ResourceImportance[shADDR][rADDR] = importance;
  }

  modifier StakeholderOnly(address ADDR){

    if (!sh.returnActive(ADDR)){
      throw;
    }else{
      _;
    }
  }

  function provideEmpowermentData(address ADDR) StakeholderOnly(ADDR){
    // wait for further update
  }

  function update(address customerADDR, bool _active, string _name, uint256 _id){
    Customer customer1 = Customer(customerADDR);
    customer1.update(customerADDR, _active, _name, _id);
  }

}
