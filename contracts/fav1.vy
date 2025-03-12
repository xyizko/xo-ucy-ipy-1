# Actual contract being written here 

#####################################
# Contract Setup
#####################################

# pragma version 0.4.0
# @licesne BOOTY

#####################################
# Contract Code
#####################################

# State variable 

# Default value is 0 - Note the getter method is atuomatically created
my_favorite_number: public(uint256)




# Constructor
@deploy 
def __init__():
    self.my_favorite_number = 7 

# Function Definitions
@external # external decrator to declare the visibility
def store(new_number: uint256):
    self.my_favorite_number = new_number


# @external # external decorator
# def store_func():
#     self.store(66)

# the @view decorator defines this as a view function which just reads state so there is only an execution cost and no tx cost
@external 
@view
def retrieve() -> uint256:
    return self.my_favorite_number






