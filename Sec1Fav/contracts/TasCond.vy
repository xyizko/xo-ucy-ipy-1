# Tas: Conditionals V 30 

# pragma version ^0.4.0


@external 
@pure
def if_else(x: uint256) -> uint256:
    if x <= 10:
        return 1
    elif x <=20:
        return 2
    else:
        return 3


@external
@pure
def if_else_msg(x: uint256) -> (uint256, String[2]):  # String[2] is valid for two-character messages
    if x <= 10:
        return 1, "as"  
    elif x <= 20:
        return 2, "bs"  
    else:
        return 3, "cs"  