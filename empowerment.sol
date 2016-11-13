pragma solidity ^0.4.2;
contract Stakeholder{

  address public owner;

  struct info{
    bool active;
    string name;
    uint256 balance;
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
    owner = msg.sender;
  }

  function registerStakeholder(string _name, uint256 _balance){
    StakeholderInfo[msg.sender]= info({
        active:true,
        name:_name,
        balance:_balance

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

  function update(bool _active, string _name, uint256 _balance){
    StakeholderInfo[msg.sender].active = _active;
    StakeholderInfo[msg.sender].name = _name;
    StakeholderInfo[msg.sender].balance = _balance;

  }
  function returnActiveSH(address ADDR) returns (bool){
      return StakeholderInfo[ADDR].active;
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
    address public owner;

    function customer(){
        owner = msg.sender;
    }


    modifier InteracterOnly(address target){

        if (!Interacters[target].interactable || owner != msg.sender){
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

contract ServiceProvider{
  address public owner;
  struct empowermentData{

  }
  mapping(address => mapping(string => uint)) ResourceImportance;

  function ServiceProvider(){
    owner = msg.sender;
  }

  address constant shADDR = 0x0;
  Stakeholder sh = Stakeholder(shADDR);

    //module1
  function queryEmpowermentData(address shADDR, string rADDR, uint importance){
    ResourceImportance[shADDR][rADDR] = importance;
  }

  modifier StakeholderOnly(address ADDR){
    Stakeholder sh = Stakeholder(ADDR);
    if (!sh.returnActiveSH(ADDR)){
      throw;
    }else{
      _;
    }

  }
  function provideEmpowermentData(address ADDR) StakeholderOnly(ADDR){
    // wait for further update
  }

}
