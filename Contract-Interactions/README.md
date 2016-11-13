# Smart Contract Interaction
Advance smart contract manipulations

###Explanation
I'm gonna introduce two ways for advanced contract interaction.
The first one is to interact with the struct object defined with the same contract.
It is more intuitive, but I'll still show you the convenience of struct.
```javascript
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
```


The second will be the interaction between two contract without the relationship of inheritance.
We'll need to call the contract Customer, and send the address of the Customer contract as the argument. Then we are ready to go！
```javascript
function update(address customerADDR, bool _active, string _name, uint256 _id){
  Customer customer1 = Customer(customerADDR);
  customer1.update(customerADDR, _active, _name, _id);
}
function update(address ADDR, bool _active, string _name, uint256 _id) ownerOnly{
  StakeholderInfo[ADDR].active = _active;
  StakeholderInfo[ADDR].name = _name;
  StakeholderInfo[ADDR].id = _id;
  StakeholderInfo[ADDR].time = now;
}
```
