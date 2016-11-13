# Modifiers
A useful way to restrict the accessors of certain functions ！

### Explanation
A simple example is listed as follows:

```javascript
modifier onlyOwner{
  if (msg.sender != serviceProvider){
    throw;   
  }else{
    _;
  }
}

function kill() onlyOwner{
  suicide(serviceProvider);
}
```
By defining some conditions in the modifier, and create two possible results:
> + `if (msg.sender != serviceProvider)`: The contract will throw an exception and revert all the transaction made previously.
> + `else`: We put a `_` in this statement, which represents that the code of the function which apply this modifier will be placed in this blank (kind of similar to `fill in the blank`)

Furthermore, if you want to pass the argument of the function to modifier, the following example will show you how.
```javascript
modifier onlyOwner(address ADDR){
  if (msg.sender != ADDR){
    throw;   
  }else{
    _;
  }
}

function kill(address ADDR) onlyOwner(ADDR){
  suicide(ADDR);
}
```
Modifier can be really useful when you want some certain parties to access function while preventing others.
