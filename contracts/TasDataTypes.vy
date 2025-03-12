# S1V18 - Ref Data types Vyper 

# pragma version ^0.4.0

# Reference data types 

# Fixed sized lists
nums: public(uint256[10])

# Dynamic Arrays 

# Mappings 
myMap: public(HashMap[address, uint256])

# Structs 
struct Person:
    name: String[10]
    age: uint256 
person: public(Person)

# Fixed Sized Lists 

@deploy 
def __init__():

    # Fixed Sized Lists
    self.nums[0] = 123 
    self.nums[1] = 456 

    # Mapping 
    self.myMap[msg.sender] = 1
    self.myMap[msg.sender] = 11 

