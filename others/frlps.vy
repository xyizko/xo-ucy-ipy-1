# For Loops in vypter w taz

# pragma version ^0.4.0 

@external 
@pure
def for_loop() -> DynArray[uint256,100]:
    arr: DynArray[uint256, 100] = []

    nums: uint256[4] = [11, 22, 33, 44]

    for i: uint256 in nums:
        arr.append(i)
    
    return arr