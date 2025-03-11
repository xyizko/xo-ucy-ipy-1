# Advanced Functions - S1V16- Advanced Functions with Taz
# Called external functions 

# pragma version ^0.4.0 

@external 
@pure 
def multilply(x: uint256, y: uint256) -> uint256:
    return x * y 

@external 
@pure 
def divide(x: uint256, y: uint256) -> uint256: # In this division it will round down
    return x // y # Note for division this is the operator 

@external
def todo():
    pass 

@external 
@pure 
def return_many() -> (uint256, bool):
    return (123, True)

