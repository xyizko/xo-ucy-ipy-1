# Beginner 1-3 - Introduction to Python and VyperLang Notes

> This repo will have the classword being done for the above mentioned course 

1. Make sure to lock in the compiler version to know exactly what the compiler will do 

2. Note, updating state of the contract ( the state varibales ) is done with txs
    - We init variables in `.sol` with the `constructor()` kw

3. Regarding visibiity 

```py 
# Function Definitions
@internal # external decrator to declare the visibility
def store(new_number: uint256):
    self.my_favorite_number = new_number

@external 
def store_func():
    self.store(66)
```
- here the functiona decorators - @external and @internal both set the visibility 
- In the case of `store()` having `@internal` this function can be called only by the contract, for example via another function 
- In the case of `store_func()` having he decorator of `@external`  this function can be now called by a user

4 . Regarding view decorator
    1. `view` function can be called by a human for free no gas
    2. But when tx calls a view function it costs gas

5. Constructor Function in Vyper 
    1. Used for setting state variables such as owner 
    2. Params in the constructor 