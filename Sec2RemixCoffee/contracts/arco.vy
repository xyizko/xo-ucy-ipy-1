# Undestanding dynamic arrays vyper
dynamic_array: public(DynArray[uint256,100]) # 100 Slots , and can grow
fixed_sized_array: public(uint256[100]) # Fixed length 100
index: uint256

@external
@view
def dyn_array_size() -> uint256:
    return len(self.dynamic_array) 

# @external
# @view
# def fixed_array_size() -> uint256:
#     return len(self.fixed_array_size) 

@external
def add_to_arrray():
    self.fixed_sized_array[0] = 1
    self.dynamic_array.append(1)
    self.index = self.index + 1 