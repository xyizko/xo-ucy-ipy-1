# For Loops in vypter w taz

# pragma version ^0.4.0 

@external 
@pure
def for_loop() -> DynArray[uint256,100]:
    arr: DynArray[uint256, 100] = []

    for i: uint256 in range(100):
        arr.append(i)
    
    return arr