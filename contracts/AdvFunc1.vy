# Advanced Functions - S1V16- Advanced Functions with Taz from Programmer Smart 
# Called external functions - Note that all these functions will have blue button which is some action, which is not read in this case , and will cost gas 

# pragma version ^0.4.0 

#######################
# Functions Being called
#######################

@external 
@pure 
def multilply(x: uint256, y: uint256) -> uint256:
    return x * y 

# Note the division will always round down and it wont show decimal values
@external 
@pure 
def divide(x: uint256, y: uint256) -> uint256: # In this division it will round down
    return x // y # Note for division this is the operator 

# Example function which doenst do anything , similar to python
@external
def todo():
    pass 

@external 
@pure 
def return_many() -> (uint256, bool):
    return (123, True)

