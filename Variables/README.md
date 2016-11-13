# Variables
Introduction to some advance data types like mapping, struct, event

### Explanation

- Event:
Event can inform user that certain operation being executed, e.g. inform user of the return of API result.
The following example depict the implemenataion of Event.
```javasctipt
event trigger();
function callback(){
  trigger();
}
```
- Mapping:
mapping can be seen as a table which stores key and the correspond value for further lookup or operation.
```javasctipt
mapping (address => uint) balance;
```
- Struct
Struct already appears in many kinds of programming language, so I'll just skip it :p
```javasctipt
struct info{
  bool active;
  string name;
  uint256 balance;
}
```
